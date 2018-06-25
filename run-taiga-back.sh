#!/bin/sh

sudo docker network create taiga

sudo docker run \
	-e TAIGA_DB_NAME=taiga \
	-e TAIGA_DB_PASS=password \
	-e TAIGA_DB_USER=postgres \
	--network taiga \
	--name taiga-bender \
	-p 38000:8000 \
	-it \
	--rm \
	bender/taiga-back:dev4

