#!/bin/sh

sudo docker network create taiga

sudo docker run \
	-e POSTGRES_DB=taiga \
	-e POSTGRES_PASSWORD=password \
	-e POSTGRES_USER=postgres \
	--network taiga \
	--name postgres \
	-p 30100:5432 \
	-d postgres

