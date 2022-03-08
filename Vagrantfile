# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # serveur dev
  config.vm.define "test" do |test|
    test.vm.box = "debian/bullseye64"
    test.vm.box_download_insecure = true
    test.vm.hostname = "test"
    test.vm.box_url = "debian/bullseye64"
    test.vm.network :private_network, ip: "192.168.5.3"
    test.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "test"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
      service ssh restart
    SHELL
    test.vm.provision "shell", path: "common.sh"
  end
end
