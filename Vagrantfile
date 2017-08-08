# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "prorail/centos-5.8-x86_64"

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
