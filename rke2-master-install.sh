
#!/bin/bash

#RKE2 https://github.com/rancher/rke2/releases version 확인하는곳

# Install RKE2
curl -sfL https://get.rke2.io | INSTALL_RKE2_VERSION="v1.26.2+rke2r1" sh -

# Create YAML file for cluster configuration
cat << EOF > /etc/rancher/rke2/config.yaml
write-kubeconfig-mode: "0644"
tls-san:
  - "10.253.8.82"
  - "10.253.8.44"
server: https://10.253.8.82:9345
token: "rke2innoclustertoken"
EOF


sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service