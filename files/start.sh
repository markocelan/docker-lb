#!/bin/bash

cd /app

CONFIG_TEMPLATE_URL=${CONFIG_TEMPLATE_URL:-https://github.com/markocelan/docker-lb/raw/master/in.template.example}
CONSUL=${CONSUL:-127.0.0.1:8500}
APP_NAME=${APP_NAME:-webapp}

curl -k -L "${CONFIG_TEMPLATE_URL}" | sed "s/PLACEHOLDER_SERVICE_NAME/${APP_NAME}/" > /app/in.template

touch haproxy.pid

./consul-template -wait 2s:5s -consul "${CONSUL}" -template "in.template:haproxy.cfg:haproxy -f haproxy.cfg -p haproxy.pid -sf $(<haproxy.pid)"
