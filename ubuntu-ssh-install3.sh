#!/bin/bash
# ufw 방화벽 활성화
sudo apt update
sudo apt-get install -y ufw
sudo ufw allow 19001/tcp
sudo ufw --force enable
# SSH 설치
sudo apt-get install -y openssh-server
# SSH 포트 변경
sudo sed -i 's/#Port 22/Port 19999/g' /etc/ssh/sshd_config
# SSH 서비스 재시작
sudo systemctl restart sshd.service
