#!/bin/sh

sudo docker network create taiga

sudo docker run \
	-e TAIGA_DB_NAME=taiga \
	-e TAIGA_DB_PASS=password \
	-e TAIGA_DB_USER=postgres \
	-e TAIGA_HOSTNAME=localhost:38001 \
	--network taiga \
	--name taiga-bender-dev \
	-p 38001:8000 \
	-it \
	--rm \
	bender/taiga-back:dev6

