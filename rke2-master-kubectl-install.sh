#!/bin/bash

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get update && sudo apt-get install -y kubectl


# Check if directory exists
if [ ! -d /$HOME/.kube ]; then
  sudo mkdir -p /$HOME/.kube
fi

# Copy kubectl config to .kube directory
sudo cp /etc/rancher/rke2/rke2.yaml /$HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config