#!/bin/bash
su -c "yum update"
su -c "yum install vim rpm-build redhat-rpm-config make -y"
su -c 'yum groupinstall "Development tools"'
su vagrant -c "cd ~ && mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} && echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros"
