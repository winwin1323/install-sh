#!/bin/bash
# Get node token

sudo systemctl stop rke2-server.service

#TOKEN - sudo cat /var/lib/rancher/rke2/server/node-token

TOKEN=$1

# Create YAML file for cluster configuration if it does not exist
if [ ! -f /etc/rancher/rke2/config.yaml ]; then
    mkdir -p /etc/rancher/rke2/
fi
	
cat << EOF > /etc/rancher/rke2/config.yaml
write-kubeconfig-mode: "0644"
tls-san:
  - "10.253.8.82"
  - "10.253.8.44"
server: https://10.253.8.82:9345
token: "$TOKEN"
EOF

sudo systemctl start rke2-server.service

