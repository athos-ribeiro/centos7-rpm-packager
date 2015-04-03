#how to yum update?
package "vim"
package "git"
package "rpm-build"
package "redhat-rpm-config"
#package "make" #needed?

packager_user = "vagrant"

# Make dirs for RPM building structure
%w{BUILD RPMS SOURCES SPECS SRPMS}.each do |dir|
  directory "/home/#{packager_user}/rpmbuild/#{dir}" do
    owner packager_user
    group packager_user
    action :create
    recursive true
  end
end

cookbook_file "/home/#{packager_user}/.rpmmacros" do
  owner packager_user; group packager_user; mode 0644
  source 'rpmmacros'
end

# Get spec files
execute 'download:specs' do
  user packager_user
  command 'wget https://beta.softwarepublico.gov.br/gitlab/softwarepublico/pkg-rpm/repository/archive.tar.gz -O /tmp/pkg-rpm.tar.gz --no-check-certificate'
end

execute 'untar:specs' do
  user packager_user
	command 'tar -xzf /tmp/pkg-rpm.tar.gz -C /tmp/'
end

execute 'set:specs' do
  user packager_user
	command "cp /tmp/pkg-rpm.git/specs/*/*.spec /home/#{packager_user}/rpmbuild/SPECS/"
end

