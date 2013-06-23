# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant is a disposable VM tool for developers. See http://vagrantup.com
# for more details.

Vagrant.configure("2") do |config|
  config.vm.box = "precise-server-cloudimg-amd64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network :forwarded_port, guest: 3179, host: 3179

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  config.vm.provision :shell, :path => "./script/ubuntu-bootstrap"
  config.vm.provision :shell, :inline => <<SETUP
mkdir -p /vagrant/gopath/src
ln -nsf ../.. /vagrant/gopath/src/camlistore.org
echo 'export GOPATH=/vagrant/gopath' > /etc/profile.d/camlistore-build.sh
SETUP

end
