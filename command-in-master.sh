#!/bin/bash

## install packages debian docke ansible

IP=$(hostname -I | awk '{print $2}')

echo "[1]: Joint the cluster"
kubeadm init --apiserver-advertise-address=192.168.56.10 --pod-network-cidr=10.244.0.0/16