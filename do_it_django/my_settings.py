import os
import pymysql  
pymysql.install_as_MySQLdb()
import my_settings

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# DATABASES = {
#     'default': {
#         'ENGINE': os.environ.get("SQL_ENGINE", "django.db.backends.mysql"),
#         'NAME': os.environ.get('SQL_DATABASE'),
#         'USER': os.environ.get('SQL_USER'),
#         'PASSWORD': os.environ.get('SQL_PASSWORD'),
#         'HOST': os.environ.get('SQL_HOST'),
#         'PORT': os.environ.get("SQL_PORT"),
#         }
#     }



DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'project_django',
        'USER': 'root',
        'PASSWORD': 'rootroot',
        'HOST': '192.168.10.34',
        'PORT': '3306',
        }
    }