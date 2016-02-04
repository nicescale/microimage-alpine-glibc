#!/bin/bash

set -e

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE sleep 1000

docker exec $CON_NAME /bin/echo "testing"
docker exec $CON_NAME cat /etc/resolv.conf
docker exec $CON_NAME wget -O - https://$REG_URL

docker rm -f $CON_NAME

echo "---> The test pass"
