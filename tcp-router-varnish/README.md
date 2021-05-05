# 

This is simple example that presents how to use Traefik and Varnish together. 

Varnish is a great tool that provides HTTP caching layer. You can install in front of any web server and typically speed up the content delivery


## A simple diagram
```
     HTTP request
          |
          |
          v
  +----------------+
  | Traefik Proxy  | TCP router with HostSNI rule
  +-------+--------+
          |
          |   Proxy Protocol 2
          |
  +-------v--------+
  | Varnish Cache  |
  +-------+--------+                            
          |                                
          |    HTTP request
          v
+---------------------+
| Whoami HTTP server  |
+---------------------+
```
## Comment

It was initially discussed on Traefik's community forum and I thought that this example is worth to be placed here. 

What is interesting here that Traefik is getting HTTP request and does TLS termination and pass the request using PROXY protocol to Varnish that has to accept Proxy, otherwise the communicaiton will fail. 

Traefik creates TCP router with HostSNI and can terminate TLS certificates. 
