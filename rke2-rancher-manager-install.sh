
#!/bin/bash
 
 RANCHER_HOSTNAME=$1
 
 helm repo add jetstack https://charts.jetstack.io 
 helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
 
 helm repo update
  
 kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
   
 helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1
   
  kubectl create namespace cattle-system
  
 helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=$RANCHER_HOSTNAME \
  --set bootstrapPassword=admin \
  --set replicas=1
  