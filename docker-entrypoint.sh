#!/bin/sh

# Populate the database with initial basic data
python3 manage.py migrate --noinput
python3 manage.py loaddata initial_user
python3 manage.py loaddata initial_project_templates
python3 manage.py compilemessages

if [ ! -d "$TAIGA_BACK_HOME/static" ]; then
	python3 manage.py collectstatic --noinput
fi

exec "$@"

