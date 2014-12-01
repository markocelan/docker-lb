#!/bin/bash

cd /app

CONFIG_TEMPLATE_URL=${CONFIG_TEMPLATE_URL:-https://github.com/markocelan/docker-lb/raw/master/in.template.example}
CONSUL=${CONSUL:-127.0.0.1:8500}
APP_NAME=${APP_NAME:-webapp}

curl -k -L "${CONFIG_TEMPLATE_URL}" | sed "s/PLACEHOLDER_SERVICE_NAME/${APP_NAME}/" > /app/in.template

touch haproxy.pid

# run initial HAProxy
./reload.sh

./consul-template -consul "${CONSUL}" -template "in.template:haproxy.cfg:./reload.sh"
