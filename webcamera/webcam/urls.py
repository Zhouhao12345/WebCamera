from django.conf.urls import url
from webcam import views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^index/$', views.index, name='index'),
    url(r'^camerapost/$', views.camera, name='camera'),
]