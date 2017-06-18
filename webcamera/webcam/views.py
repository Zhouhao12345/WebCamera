from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from PIL import Image
import base64
from StringIO import StringIO
# Create your views here.

def home(request):
    return render(request, 'home.html')

def index(request):
    return render(request, 'index.html')

@csrf_exempt
def camera(request):
    if request.POST:
        image = Image.new("RGB",(int(request.POST['w']), int(request.POST['h'])))
        imageRGB = filter(lambda cell: cell, request.POST['pix'].split('|'))
        for index, item in enumerate(imageRGB):
            items = filter(lambda cell: cell, item.split(';'))
            for index1, item_in in enumerate(items):
                image.putpixel((index1,index),int(item_in,10))
        fake_file = StringIO()
        image.save(fake_file, "jpeg")
    return HttpResponse('data:image/png;base64,'+base64.b64encode(fake_file.getvalue()))
