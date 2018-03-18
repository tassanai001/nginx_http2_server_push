#!/bin/sh
docker rm -f http_push

docker build . -t http_push

docker run -d --name http_push -p 8080:80 -p 443:443 http_push
