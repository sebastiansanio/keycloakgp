#!/bin/bash
kubectl create ns keycloak
kubectl create secret generic keycloak-passwords --from-literal=db-password=${DB_PASSWORD} --from-literal=admin-password=${KC_ADMIN_PASSWORD} -n keycloak
kubectl create -f deploy-config.yaml -n keycloak
kubectl create -f deploy.yaml -n keycloak
kubectl create -f svc.yaml -n keycloak

# With Helm v3

# CERT-MANAGER (SSL)
helm repo add jetstack https://charts.jetstack.io
helm repo update
kubectl create ns cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --set installCRDs=true
kubectl create -f prod_issuer.yaml

# NGINX-INGRESS
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
kubectl create ns ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx
kubectl create -f ingress.yaml -n keycloak
