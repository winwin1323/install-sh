#!/bin/bash

# Allow RKE2 communication ports
sudo ufw allow 9345/tcp
sudo ufw allow 6443/tcp
sudo ufw allow 8472/udp
sudo ufw allow 10250/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp
sudo ufw allow 30000:32767/tcp
sudo ufw allow 8472/udp
sudo ufw allow 4240/tcp
sudo ufw allow 179/tcp
sudo ufw allow 4789/udp
sudo ufw allow 5473/tcp
sudo ufw allow 9098/tcp
sudo ufw allow 9099/tcp
sudo ufw allow 5473/tcp
sudo ufw allow 8472/udp
sudo ufw allow 9099/tcp
sudo ufw allow 51820/udp
sudo ufw allow 51821/udp

# Enable firewall
ufw --force enable
