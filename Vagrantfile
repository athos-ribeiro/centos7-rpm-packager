# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #ips = YAML.load_file('config/ips.yaml')

  config.vm.define "packager", primary: true do |packager|
    packager.vm.box = "chef/centos-7.0"
    #packager.vm.synced_folder "src/", "/home/vagrant/src", create: true, owner: "vagrant", group: "vagrant"
    #packager.vm.provision :shell, path: "set_build_environment.sh"
    packager.vm.provision "chef_solo" do |chef|
      chef.add_recipe "packager"
    end
    #packager.vm.network 'private_network', ip: ips['packager']
  end

end
