#!/bin/bash
# Get node token
#TOKEN -main master server to "sudo cat /var/lib/rancher/rke2/server/node-token"

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
  - "10.253.8.46"
server: https://10.253.8.82:9345
token: "$TOKEN"
EOF

# Install RKE2
curl -sfL https://get.rke2.io | INSTALL_RKE2_VERSION="v1.25.7+rke2r1" sh -

sleep 3

sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service
