docker-lb
=========

Docker container running HAProxy autoconfigured by consul-template.

You can easily run your own HAProxy loadbalancer. 

Example: 
--------

```shell
$ docker run --name=myapp-loadbalancer \
	-it --rm \
	-p 8000 \
	-p 127.0.0.1::8081 \
	-e APP_NAME=myapp \
	-e CONFIG_TEMPLATE_URL="https://github.com/markocelan/docker-lb/raw/master/in.template.example" \
	-e CONSUL=127.0.0.1:8500 \
	markocelan/docker-lb
```

APP_NAME is needed only when you are using example template. It is used so consul-template knows which service you are trying to balance.


Using example template
-------

If you want you can use example template for HTTP load balancer. Simply set APP_NAME environment variable to a consul service name.
I.e. if your application is registred as 'myapplication' in consul then use '-e APP_NAME=myapplication' switch when running your docker container.
