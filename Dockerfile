FROM progrium/busybox

MAINTAINER marko.celan@gmail.com

WORKDIR /app

ENV CONSUL_TEMPLATE_VERSION 0.3.1
ENV CONSUL_NAME consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64

ADD files/start.sh /app/start.sh
ADD files/reload.sh /app/reload.sh

RUN opkg-install bash curl haproxy && \
	curl -k -L https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/${CONSUL_NAME}.tar.gz | gunzip | tar -x && \
	mv ${CONSUL_NAME}/consul-template /app && \
	chmod a+x /app/*.sh 



ENTRYPOINT  ["/app/start.sh" ]
