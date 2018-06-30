import os

from .development import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv("TAIGA_DB_NAME") or 'taiga',
        'USER': os.getenv("TAIGA_DB_USER") or 'taiga',
        'PASSWORD': os.getenv("TAIGA_DB_PASS") or 'postgres',
        'HOST': os.getenv("TAIGA_DB_HOST") or 'postgres',
        'PORT': os.getenv("TAIGA_DB_PORT") or '5432',
    }
}

TAIGA_HOSTNAME = os.getenv('TAIGA_HOSTNAME')

SITES['api']['domain'] = TAIGA_HOSTNAME
SITES['front']['domain'] = TAIGA_HOSTNAME

#MEDIA_URL  = 'http://' + TAIGA_HOSTNAME + '/media/'
#STATIC_URL = 'http://' + TAIGA_HOSTNAME + '/static/'

#MEDIA_URL = "http://{hostname}/media/".format(hostname = TAIGA_HOSTNAME)
#STATIC_URL = "http://{hostname}/static/".format(hostname = TAIGA_HOSTNAME)

_set_taiga_url = lambda path: "http://{hostname}/{path}/".format(hostname = TAIGA_HOSTNAME, path = path)

MEDIA_URL = _set_taiga_url("media")
STATIC_URL = _set_taiga_url("static")

