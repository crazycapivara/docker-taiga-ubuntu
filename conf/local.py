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
