#!/bin/bash

#RKE2 https://github.com/rancher/rke2/releases version 확인하는곳

# RKE2 Config
if [ ! -f /etc/rancher/rke2/config.yaml ]; then
    mkdir -p /etc/rancher/rke2/
fi
	
cat << EOF > /etc/rancher/rke2/config.yaml
write-kubeconfig-mode: "0644"
tls-san:
  - "10.253.8.82"
  - "10.253.8.44"
  - "10.253.8.46"
EOF


# Install RKE2
curl -sfL https://get.rke2.io | INSTALL_RKE2_VERSION="v1.25.7+rke2r1" sh -

sleep 3

sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service
