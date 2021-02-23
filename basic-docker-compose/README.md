[![Traefik on Docker Compose](https://github.com/jakubhajek/traefik-proxy/actions/workflows/compose.yaml/badge.svg)](https://github.com/jakubhajek/traefik-proxy/actions/workflows/compose.yaml)
# Traefik Proxy running with Docker Compose

This examples presents how to run Traefik Proxy with enabled API and its builtin Dashboard. It also presents a simple routing rule for `Whoami` service. 

You need to have installed Docker and Docker Compose. 

The example also show the basic routing based on HTTP Host header using external service nip.io. This is very useful becase you can use real URL names and there is no need to add any modification to /etc/hosts. 

There are two names created that points to your local environemnt:

- dashboard.127.0.0.1.nip.io 
- whoami.127.0.0.1.nip.io


# Let's deploy it

Just run command:
```shell
docker-compose -f docker-compose.yaml up
```

# Let's test our application stack

First, we will try to reach Whoami service based on basic routing rules we created:

## Whoami service

```shell
curl http://whoami.127.0.0.1.nip.io:8080
```

You should recieve the following result:

```shell
➜ curl http://whoami.127.0.0.1.nip.io:8080
Hostname: 801d867ac310
IP: 127.0.0.1
IP: 172.24.0.2
RemoteAddr: 172.24.0.3:56324
GET / HTTP/1.1
Host: whoami.127.0.0.1.nip.io:8080
User-Agent: curl/7.64.1
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 172.24.0.1
X-Forwarded-Host: whoami.127.0.0.1.nip.io:8080
X-Forwarded-Port: 8080
X-Forwarded-Proto: http
X-Forwarded-Server: c4a1b74db6e8
X-Real-Ip: 172.24.0.1
```

If so, everything works as it is expected. You can also have look on log file to see the entire flow of your request. We enabled DEBUG in the configuration, so you find a plenty of useful information. 

##  Dashboard

Traefik Proxy has built-in dashboard that visualize what routers and services are available. In order to see dashboard you can visist the following URL 
[http://dashboard.127.0.0.1.nip.io:8080/dashboard/](http://dashboard.127.0.0.1.nip.io:8080/dashboard/) and you should see the beau

## API

We also exposed API and we can send requests to the [available endpoints](https://doc.traefik.io/traefik/operations/api/#endpoints) as the following example request shows:

```shell
➜ curl http://dashboard.127.0.0.1.nip.io:8080/api/version
```
and the result
```json
{"Version":"2.4.5","Codename":"livarot","startDate":"2021-02-23T09:33:56.4443914Z"}%
```

```shell
curl http://dashboard.127.0.0.1.nip.io:8080/api/overview
```
and the result
```json
{"http":{"routers":{"total":4,"warnings":0,"errors":0},"services":{"total":5,"warnings":0,"errors":0},"middlewares":{"total":2,"warnings":0,"errors":0}},"tcp":{"routers":{"total":0,"warnings":0,"errors":0},"services":{"total":0,"warnings":0,"errors":0}},"udp":{"routers":{"total":0,"warnings":0,"errors":0},"services":{"total":0,"warnings":0,"errors":0}},"features":{"tracing":"","metrics":"","accessLog":false},"providers":["Docker"]}
```

# Summary

You have just started the journey with Traefik Proxy. Traefik use Docker provider to expose dynamically new services depoyed thought specific labels added on service level. 
You deployed the example Whoami service using routers and service and also builtin `/dashboard/` and `/api/`. Congrats! Let's dive deeper and see more advanced use cases.
