colab_version := 2.0a2
.PHONY: clean all
all: download_tarballs download_specs prepare_specs prepare_tarballs set_build_env
download_specs:
	wget https://beta.softwarepublico.gov.br/gitlab/softwarepublico/pkg-rpm/repository/archive.tar.gz -O src/pkg-rpm.tar.gz --no-check-certificate
download_tarballs:
	#wget https://beta.softwarepublico.gov.br/gitlab/softwarepublico/colab/repository/archive.tar.gz -O src/colab.tar.gz --no-check-certificate
prepare_specs:
	tar -xzf src/pkg-rpm.tar.gz -C src/
	rm -rf src/pkg-rpm.tar.gz
prepare_tarballs:
	#mv src/colab.tar.gz src/colab-$(colab_version).tar.gz
set_build_env:
	#cp src/*.tar.gz /home/vagrant/rpmbuild/SOURCES/
	#cp src/*.patch /home/vagrant/rpmbuild/SOURCES/
	cp src/pkg-rpm.git/specs/*/*.spec /home/vagrant/rpmbuild/SPECS/
clean:
	rm -rf src/*
