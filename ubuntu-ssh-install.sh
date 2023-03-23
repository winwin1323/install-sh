#!/bin/bash

# SSH 설치
sudo apt-get install openssh-server

# SSH 포트 변경
sudo sed -i 's/#Port 22/Port 19001/g' /etc/ssh/sshd_config

# SSH 서비스 재시작
sudo service ssh restart