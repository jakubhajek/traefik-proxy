# Install Traefik with defined values



# Cert Manager

## Repo added

helm repo add jetstack https://charts.jetstack.io


## Install

helm repo update


helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.2.0 \
  --create-namespace \
  # --set installCRDs=true
