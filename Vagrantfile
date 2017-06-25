# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.33.1"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "master.playbook.yml"
      #ansible.verbose = true
    end
  end
end
