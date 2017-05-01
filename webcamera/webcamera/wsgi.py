"""
WSGI config for webcamera project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/howto/deployment/wsgi/
"""

import os
from os.path import join,dirname,abspath

from django.core.wsgi import get_wsgi_application

PROJECT_DIR = dirname(dirname(abspath(__file__)))

import sys
sys.path.insert(0,PROJECT_DIR)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "webcamera.settings")
sys.path.append('/usr/lib/python2.7/site-packages/django')

application = get_wsgi_application()
