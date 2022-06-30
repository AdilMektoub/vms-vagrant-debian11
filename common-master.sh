#!/bin/bash

## install packages debian docke ansible

IP=$(hostname -I | awk '{print $2}')

echo "[1]: install utils"
apt update -qq >/dev/null
apt install -qq -y git sshpass net-tools wget gnupg2 curl vim >/dev/null

echo "[2]: install docker & docker-composer & k8s"
apt install -y docker.io

systemctl daemon-reload
systemctl restart docker

echo "[3]: install k8s"
swapoff -a
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
apt update && apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update
apt install -y kubelet kubeadm kubectl
mkdir -p $HOME/.kube
