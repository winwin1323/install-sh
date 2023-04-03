#!/bin/bash


kubectl get namespace argocd &> /dev/null || kubectl create namespace argocd

helm repo add argo https://argoproj.github.io/argo-helm


helm repo update

helm install argocd --namespace argocd argo/argo-cd \
  --set server.service.type=NodePort