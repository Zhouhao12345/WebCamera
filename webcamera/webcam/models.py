from __future__ import unicode_literals

from django.db import models
import base64
from django.contrib.auth.models import User
# Create your models here.

def upload_location(instance, filename):
    return 'profile_image/{0}/{1}'.format(instance.user.username, filename)

class ResUsers(models.Model):

    user = models.OneToOneField(User)
    phone_number = models.CharField(max_length=50, blank=True)
    about_me = models.TextField(max_length=500, blank=True)
    email = models.TextField(max_length=100, blank=True)
    picture = models.ImageField(upload_to=upload_location)

    def __unicode__(self):
        return self.user.username

class Packages(models.Model):
    name = models.CharField(max_length=50, blank=True)
    description = models.TextField(max_length=500, blank=True)

    def __unicode__(self):
        return self.name

class Modules(models.Model):
    package_ids = models.ManyToManyField(Packages)
    name = models.CharField(max_length=50, blank=True)
    description = models.TextField(max_length=500, blank=True)
    available = models.BooleanField(default=False)

    def __unicode__(self):
        return self.name

class Servers(models.Model):
    name = models.CharField(max_length=50, blank=True)
    description = models.TextField(max_length=500, blank=True)
    available_package_ids = models.ManyToManyField(Packages)
    domain = models.CharField(max_length=50, blank=True)
    admin_password = models.CharField(max_length=50, blank=True)
    main_server = models.BooleanField(default=False)

    def set_password(self, clean_password):
        base64_password = base64.b64encode(clean_password)
        self.admin_password = base64_password

    def get_password(self):
        password = base64.b64decode(self.admin_password)
        return password

    def __unicode__(self):
        return self.name

class Instances(models.Model):
    server_id = models.ForeignKey(Servers)
    user_id = models.ForeignKey(ResUsers)
    name = models.CharField(max_length=50, blank=True)
    init_user_password = models.CharField(max_length=20, blank=True)
    description = models.TextField(max_length=500, blank=True)
    user_number = models.IntegerField(default=0)
    real_database = models.CharField(max_length=50, blank=True)
    template_database = models.CharField(max_length=50, blank=True)
    subdomain = models.CharField(max_length=50, blank=True)
    package_ids = models.ManyToManyField(Packages)

    def __unicode__(self):
        return self.name

    def set_password(self, clean_password):
        base64_password = base64.b64encode(clean_password)
        self.init_user_password = base64_password

    def get_password(self):
        password = base64.b64decode(self.init_user_password)
        return password
