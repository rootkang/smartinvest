#!/bin/bash
apt update && apt upgrade -y
apt install -y git curl ufw docker.io docker-compose
systemctl enable docker
systemctl start docker

ufw allow 22
ufw allow 80
ufw allow 443
ufw --force enable

cd /root
git clone https://github.com/rootkang/smartinvest.git || true
cd smartinvest

docker-compose up -d --build

IP=$(curl -s ifconfig.me)
echo "App running at http://$IP"
