# -*- coding: utf-8 -*-
import requests
import time
from bs4 import BeautifulSoup
from webcam.models import ResUsers
from celery.schedules import crontab
from celery.utils.log import get_task_logger
from celery import shared_task

@shared_task
def add(x, y):
    return x + y