#!/bin/sh

sudo docker network create taiga

sudo docker run \
	-e TAIGA_DB_NAME=taiga \
	-e TAIGA_DB_PASS=password \
	-e TAIGA_DB_USER=postgres \
	-e TAIGA_HOSTNAME=localhost:38002 \
	--network taiga \
	--name taiga-bender-nginx \
	-p 38002:8000 \
	-it \
	--rm \
	bender/taiga-back:dev7

