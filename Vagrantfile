# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "packager", primary: true do |packager|
    packager.vm.box = "chef/centos-7.0"
    packager.vm.synced_folder "src/", "/home/vagrant/src", create: true, owner: "vagrant", group: "vagrant"
    packager.vm.provision :shell, path: "set_build_environment.sh"
  end

end
