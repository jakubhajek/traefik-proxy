[![Traefik on Docker Swarm](https://github.com/jakubhajek/traefik-proxy/actions/workflows/swarm.yaml/badge.svg)](https://github.com/jakubhajek/traefik-proxy/actions/workflows/swarm.yaml)

# Traefik Proxy running on Docker Swarm 

This is a basic example on how to depoy Traefik Proxy with example service WhoAmi on Docker Swarm. 

## Prerequisities

You need to have a Swarm cluster, so let's initiated: `docker swarm init`

# Let's deploy it

The cluster that consists of one node has been created. You can deploy your stack and start exploring all Traefik advantages. 

`docker stack deploy traefik-stack -c traefik-stack.yaml --prune`

# Let's test it

The below command display the service created in stack file:

```
➜ docker service ls
ID             NAME                    MODE         REPLICAS   IMAGE                   PORTS
aqo8qgj0biou   traefik-stack_traefik   replicated   1/1        traefik:v2.4.5          *:80->80/tcp, *:8080->8080/tcp
w1zd4dbsu0uo   traefik-stack_whoami    replicated   1/1        traefik/whoami:latest

```


# Healthcheck

