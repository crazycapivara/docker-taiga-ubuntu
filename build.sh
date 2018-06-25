#!/bin/sh

TAG=${1:-development}

echo $TAG

sudo docker build -t bender/taiga-back:$TAG .

