# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

client_vagrantfile = File.expand_path('../cluster_info.json', __FILE__)
settings = JSON.parse(File.read(client_vagrantfile)) if File.exists?(client_vagrantfile)

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  settings.each do |cluster|
    config.vm.define cluster["name"] do |node|
      node.vm.network "public_network", ip: cluster["ip"]

      node.vm.provider "virtualbox" do |vb|
        vb.memory = cluster["memory"]
      end
      node.vm.provision "ansible" do |ansible|
        ansible.playbook = cluster["playbook"]
        ansible.extra_vars = {
          master_ip: cluster["master_ip"],
          master_port: cluster["master_port"],
          master_name: cluster["name"]
        }
        #ansible.verbose = true
      end
    end
  end
  # config.vm.define "node" do |node|
  #   node.vm.network "private_network", ip: "192.168.42.3"
  #   node.vm.provision "ansible" do |ansible|
  #     ansible.playbook = "node.playbook.yml"
  #     #ansible.verbose = true
  #   end
  # end
end
