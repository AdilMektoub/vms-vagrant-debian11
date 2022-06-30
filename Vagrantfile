# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # serveur DEPLOY
  config.vm.define "deploy" do |deploy|
    deploy.vm.box = "debian/bullseye64"
    deploy.vm.box_download_insecure = true
    deploy.vm.hostname = "deploy"
    deploy.vm.box_url = "debian/bullseye64"
    deploy.vm.network "private_network", ip: "192.168.56.0"
    deploy.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "deploy"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
      service ssh restart
    SHELL
    deploy.vm.provision "shell", path: "common-master.sh"
  end

# serveur MASTER
config.vm.define "master" do |master|
  master.vm.box = "debian/bullseye64"
  master.vm.box_download_insecure = true
  master.vm.hostname = "master"
  master.vm.box_url = "debian/bullseye64"
  master.vm.network "private_network", ip: "192.168.56.10"
  master.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 4096]
    v.customize ["modifyvm", :id, "--name", "master"]
    v.customize ["modifyvm", :id, "--cpus", "4"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
    service ssh restart
  SHELL
  master.vm.provision "shell", path: "common-master.sh"
end

# serveur WORKER 1
config.vm.define "worker1" do |worker1|
  worker1.vm.box = "debian/bullseye64"
  worker1.vm.box_download_insecure = true
  worker1.vm.hostname = "worker1"
  worker1.vm.box_url = "debian/bullseye64"
  worker1.vm.network "private_network", ip: "192.168.56.11"
  worker1.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--name", "worker1"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
    service ssh restart
  SHELL
  worker1.vm.provision "shell", path: "common.sh"
end

# serveur WORKER 2
config.vm.define "worker2" do |worker2|
  worker2.vm.box = "debian/bullseye64"
  worker2.vm.box_download_insecure = true
  worker2.vm.hostname = "worker2"
  worker2.vm.box_url = "debian/bullseye64"
  worker2.vm.network "private_network", ip: "192.168.56.12"
  worker2.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--name", "worker2"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
    service ssh restart
  SHELL
  worker2.vm.provision "shell", path: "common.sh"
end
end
