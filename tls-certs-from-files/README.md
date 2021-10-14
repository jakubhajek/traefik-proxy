## TLS certificates loaded from files.

This is a simple configuration presenting how to add TLS certificates that are manually issued and than attached them to the specific router. 

### Generate self signed certificate
```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
```

### Validate TLS certificate

```
openssl x509 -noout -subject -in whoami.crt
```
