# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/centos-7.0"
  config.vm.synced_folder "rpmbuild/", "/home/vagrant/rpmbuild", owner: "vagrant", group: "vagrant", create: true
  config.vm.provision :shell, path: "set_build_environment.sh"

end
