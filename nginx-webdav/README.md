
# Traefik Proxy running with Nginx

This scenario shows how to transfer files using DAV protocol using Traefik Proxy working as an edge router. The diagram is following: 

` Traefik-Proxy -> Nginx-Webdav`

# Let's Deploy it

The first manifest contains:
- PVC which uses the following storage class
- Configmap with enabed DAV for nginx
- Deployment with `init containers` section that allow to create the appropriate directories with the correct privileges
- Service

Execute the following command: `kubectl apply -f nginx-webdav.yaml` and than IngressRoute object that route incoming request to Nginx. `kubectl apply -f ingressroute.yaml`

# Verify the installation

You can test it by executing the command: 

`curl -T512MB.zip -H "Expect: 100-continue" dav.127.0.0.1.nip.io/upload/ -v`

The file should be correctly uploaded and stored on the attached PVC. 
