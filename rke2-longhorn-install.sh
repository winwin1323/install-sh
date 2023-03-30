#!/bin/bash


helm repo add longhorn https://charts.longhorn.io

helm repo update

kubectl create namespace longhorn-system

helm install longhorn longhorn/longhorn --namespace longhorn-system

helm install longhorn longhorn/longhorn \
--namespace longhorn-system \
--set defaultSettings.defaultDataPath="/home/rke2/longhorn" \
--set defaultSettings.storageOverProvisioningPercentage=100 \
--set defaultSettings.defaultReplicaCount=3 \
--set defaultSettings.defaultLonghornStaticStorageClass="longhorn-static"

