# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.42.2"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "master.playbook.yml"
      #ansible.verbose = true
    end
  end
  config.vm.define "node" do |master|
    master.vm.network "private_network", ip: "192.168.42.3"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "node.playbook.yml"
      #ansible.verbose = true
    end
  end
end
