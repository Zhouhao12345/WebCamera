FROM zhouhao123/opencv_django:latest
MAINTAINER zhouhao <zhouhao19931002@hotmail.com>

RUN pip install gunicorn -i http://pypi.douban.com/simple/ saltTesting --trusted-host pypi.douban.com

RUN pip install django-registration==2.2 -i http://pypi.douban.com/simple/ saltTesting --trusted-host pypi.douban.com

RUN pip install psycopg2==2.7.1 -i http://pypi.douban.com/simple/ saltTesting --trusted-host pypi.douban.com

RUN rm -r /usr/src/app/webcamera

CMD gunicorn -b :8000 --chdir webcamera webcamera.wsgi
