from django.conf.urls import url
from webcam.views import *
from django.views.generic import RedirectView

urlpatterns = [
    url(r'^$', HomeView.as_view(), name='home'),
    url(r'^about/$', AboutView.as_view(), name='about'),
    url(r'^contact/$', ContractView.as_view(), name='contact'),
    url(r'^camerapost/$', comerapost, name='camera'),
    url(r'^accounts/profile/$', RedirectView.as_view(url='/dashboard/')),
    url(r'^dashboard/$', DashboardView.as_view(), name='dashboard'),
    url(r'^profile/$', ProfileView.as_view(), name='profile'),
    url(r'^instance_list/$', InstanceListView.as_view(template_name='instance.html'), name='my_instances'),
    url(r'^instance/create/$', InstanceCreateView.as_view(), name='create_instance'),
    url(r'^instance/(?P<pk>[0-9]+)/delete/$', InstanceDeleteView.as_view(), name='delete_instance'),
]