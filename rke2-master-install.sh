
#!/bin/bash

#RKE2 https://github.com/rancher/rke2/releases version 확인하는곳

# Install RKE2
curl -sfL https://get.rke2.io | INSTALL_RKE2_VERSION="v1.26.2+rke2r1" sh -

sleep 3

sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service
