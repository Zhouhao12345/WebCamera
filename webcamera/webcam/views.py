from __future__ import print_function
from django.shortcuts import render
from django.http import HttpResponse
from django.core.urlresolvers import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from StringIO import StringIO
from django.views.generic import *
from webcam.models import *
from webcam.tasks import *
import numpy
import cv2 as cv
import base64

class HomeView(TemplateView):
    template_name = 'home.html'


class AboutView(TemplateView):
    template_name = 'about.html'


class ContractView(TemplateView):
    template_name = 'contact.html'

class DashboardView(TemplateView):
    template_name = 'dashboard.html'

    def get_context_data(self, **kwargs):
        context = super(DashboardView, self).get_context_data(**kwargs)
        user = self.request.user
        add.delay(1,3)
        res_user = ResUsers.objects.get(user=user)
        instance_list = Instances.objects.filter(user_id=res_user)
        context['instance_list'] = instance_list
        context['instance_len'] = len(instance_list)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(DashboardView, self).dispatch(*args, **kwargs)

class ProfileView(DetailView):
    template_name = 'profile.html'
    context_object_name = "cur_user"
    model = ResUsers

    def get_object(self):
        user = self.request.user
        object = ResUsers.objects.get(user=user)
        return object

    def get_context_data(self, **kwargs):
        context = super(ProfileView, self).get_context_data(**kwargs)
        instance_list = Instances.objects.filter(user_id=self.object)
        context['instance_list'] = instance_list
        context['instance_len'] = len(instance_list)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(ProfileView, self).dispatch(*args, **kwargs)

class InstanceListView(ListView):
    context_object_name = "instance_list"
    model = Instances

    def get_queryset(self):
        user = self.request.user
        res_user = ResUsers.objects.get(user=user)
        return Instances.objects.filter(user_id=res_user)

    def get_context_data(self, **kwargs):
        context = super(InstanceListView, self).get_context_data(**kwargs)
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(InstanceListView, self).dispatch(*args, **kwargs)

class InstanceDetailView(DetailView):
    template_name = 'instance.html'
    context_object_name = "cur_instance"
    model = Instances

    def get_object(self):
        object = super(InstanceDetailView, self).get_object()
        return object

    def get_context_data(self, **kwargs):
        context = super(InstanceDetailView, self).get_context_data(**kwargs)
        context['package_list'] = self.object.package_ids.all()
        return context

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(InstanceDetailView, self).dispatch(*args, **kwargs)

class InstanceDeleteView(DeleteView):
    model = Instances
    template_name = 'instance_delete.html'

    def get_object(self, queryset=None):
        """ Hook to ensure object is owned by request.user. """
        obj = super(InstanceDeleteView, self).get_object()
        return obj

    def get_success_url(self):
        return '/instance_list/'

class InstanceCreateView(CreateView):
    template_name = 'instance_form.html'
    model = Instances
    fields = ['name', 'init_user_password', 'description', 'subdomain']

    def form_valid(self, form):
        user = self.request.user
        active_server = Servers.objects.get(main_server=True)
        res_user = ResUsers.objects.get(user=user)
        form.instance.user_id = res_user
        form.instance.server_id = active_server
        return super(InstanceCreateView, self).form_valid(form)

    def get_context_data(self, **kwargs):
        context = super(InstanceCreateView, self).get_context_data(**kwargs)
        return context

    def get_success_url(self):
        return '/instance_list/'

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(InstanceCreateView, self).dispatch(*args, **kwargs)

@csrf_exempt
def comerapost(request):
    if request.POST:
        image = Image.new(
            "RGBA", (int(
                request.POST['w']), int(
                request.POST['h'])), "#FF0000")
        imageRGB = filter(
            lambda cell: cell,
            request.POST['pix'].split('|'))
        for index, item in enumerate(imageRGB):
            items = filter(lambda cell: cell, item.split(';'))
            for index1, item_in in enumerate(items):
                image.putpixel((index1, index), int(item_in, 10))
        image = detect_face(numpy.array(image))
        a = StringIO()
        Image.fromarray(image).save(a, 'jpeg')
    return HttpResponse(
        'data:image/png;base64,' +
        base64.b64encode(
            a.getvalue()))

def detect(img, cascade):
    rects = cascade.detectMultiScale(img, scaleFactor=1.3, minNeighbors=4, minSize=(30, 30),
                                     flags=cv.CASCADE_SCALE_IMAGE)
    if len(rects) == 0:
        return []
    rects[:,2:] += rects[:,:2]
    return rects

def draw_rects(img, rects, color):
    for x1, y1, x2, y2 in rects:
        cv.rectangle(img, (x1, y1), (x2, y2), color, 2)

import os

def detect_face(img):
    cascade_fn = os.path.abspath(os.path.dirname(__file__)) + "/opencv/haarcascades/haarcascade_frontalface_alt.xml"
    nested_fn = os.path.abspath(os.path.dirname(__file__)) + "/opencv/haarcascades/haarcascade_eye.xml"

    cascade = cv.CascadeClassifier(cascade_fn)
    nested = cv.CascadeClassifier(nested_fn)
    gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    gray = cv.equalizeHist(gray)

    rects = detect(gray, cascade)
    vis = img.copy()
    draw_rects(vis, rects, (0, 255, 0))
    if not nested.empty():
        for x1, y1, x2, y2 in rects:
            roi = gray[y1:y2, x1:x2]
            vis_roi = vis[y1:y2, x1:x2]
            subrects = detect(roi.copy(), nested)
            draw_rects(vis_roi, subrects, (255, 0, 0))
    return vis
