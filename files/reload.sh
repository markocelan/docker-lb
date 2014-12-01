#!/bin/bash

PIDFILE=haproxy.pid
OLD_PIDS=$(< $PIDFILE)
haproxy -c -f haproxy.cfg && \
haproxy -f haproxy.cfg -p haproxy.pid -sf $OLD_PIDS && \
echo "[HAProxy reload]Successfully restarted and reconfigured HAProxy. Resulting configuration:" &&\
cat haproxy.cfg && \
echo "[HAProxy reload]End of configuration."
