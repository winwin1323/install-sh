#!/bin/bash

# ufw 방화벽 활성화
sudo systemctl enable ufw
sudo systemctl start ufw

# ufw 방화벽에 19001 포트 추가
sudo ufw allow 19001/tcp

# SSH 설치
sudo apt-get install openssh-server

# SSH 포트 변경
sudo sed -i 's/#Port 22/Port 19001/g' /etc/ssh/sshd_config

# SSH 서비스 재시작
sudo service ssh restart


