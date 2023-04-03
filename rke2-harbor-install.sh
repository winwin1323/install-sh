#!/bin/bash

HARBOR_HOSTNAME=$1

kubectl get namespace harbor-system &> /dev/null || kubectl create namespace harbor-system

helm repo add harbor https://helm.goharbor.io
helm repo update

helm install --wait --name harbor --namespace harbor-system harbor/harbor \
  --set expose.type=nodePort \
  --set expose.tls.auto.commonName=$HARBOR_HOSTNAME \
  --set externalURL=https://$HARBOR_HOSTNAME:30003 \
  --set persistence.persistentVolumeClaim.registry.size=100Gi \
  --set harborAdminPassword=admin