#!/bin/bash

## install packages debian docke ansible

IP=$(hostname -I | awk '{print $2}')

echo "[1]: Disable swap & Firewall"
ufw disable
swapoff -a; sed -i '/swap/d' /etc/fstab

echo "[2]: Update sysctl settings for Kubernetes networking"
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

echo "[3]: Install docker engine"
  apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt update
  apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal

echo "[4]: Add Apt repository"
  apt update
  #curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  #curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  apt update
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

echo "[5]: Install Kubernetes components"
  apt update && apt install -y kubeadm=1.18.5-00 kubelet=1.18.5-00 kubectl=1.18.5-00

