#!/bin/bash
su -c "yum update -y"
su -c "yum install vim rpm-build redhat-rpm-config make -y"
su -c 'yum groupinstall "Development tools" -y'
su vagrant -c "cd ~ && mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}"
su vagrant -c 'echo "%_topdir %(echo $HOME)/rpmbuild" > ~/.rpmmacros'
su vagrant -c 'cd /vagrant && make'
