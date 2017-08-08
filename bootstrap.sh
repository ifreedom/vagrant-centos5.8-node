#!/bin/bash

cp -f /vagrant/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo

yum update

yum install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++ -y
