import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'webcamera.settings')

import django
django.setup()

from webcam.models import *
from django.contrib.auth.models import User

def populate():

    server = add_server('saas_odoo', 'admin', 'foodtuo.com', 'Test Server', True)
    package = add_packages('init_setup', 'Test Package 1')
    module_object_list = []
    module_list = [
        'auth_crypt',
        'auth_ldap',
        'auth_oauth',
        'auth_signup',
        'base',
        'base_action_rule',
        'base_gengo',
        'base_geolocalize',
        'base_import',
        'base_import_module',
        'base_setup',
        'board',
        'bus',
        'calendar',
        'decimal_precision',
        'fetchmail',
        'im_livechat',
        'mail',
        'mail_tip',
        'note',
        'product',
        'product_email_template',
        'product_expiry',
        'product_extended',
        'product_margin',
        'report',
        'resource',
        'web',
        'web_analytics',
        'web_calendar',
        'web_diagram',
        'web_editor',
        'web_kanban',
        'web_kanban_gauge',
        'web_planner',
        'web_settings_dashboard',
        'web_tip',
        'web_view_editor']
    for index, name in enumerate(module_list):
        m = add_modules(name, ('Test %d' % index))
        module_object_list.append(m)
    add_module_package(package=package, module_list=module_object_list)
    add_server_package(server, package)
    print "Database has been successfully populated!!!!!!!!!"


def add_server(name, admin_password, domain, description, main_server):
    s = Servers.objects.get_or_create(
        name=name,
        admin_password=admin_password,
        domain=description,
        main_server=main_server
    )[0]
    return s

def add_packages(name, description):
    p = Packages.objects.get_or_create(name=name,description=description)[0]
    return p

def add_modules(name, description):
    print name
    m = Modules.objects.get_or_create(name=name, description=description)[0]
    return m

def add_server_package(server, package_list):
    server.available_package_ids.set([package_list])

def add_module_package(module_list, package):
    for module in module_list:
        module.package_ids.add(package)

if __name__ == '__main__':
    print "Starting web population script..."
    populate()