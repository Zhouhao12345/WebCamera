# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2017-09-09 08:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webcam', '0002_auto_20170906_1839'),
    ]

    operations = [
        migrations.AlterField(
            model_name='instances',
            name='name',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='instances',
            name='real_database',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='instances',
            name='subdomain',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='instances',
            name='template_database',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='modules',
            name='name',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='packages',
            name='name',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='resusers',
            name='phone_number',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='servers',
            name='admin_password',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='servers',
            name='domain',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='servers',
            name='name',
            field=models.CharField(blank=True, max_length=50),
        ),
    ]
