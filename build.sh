#!/bin/bash

mkdir -p /usr/local/src

# build python

cd /usr/local/src
wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
tar -xvzf Python-2.7.3.tgz
cd Python-2.7.3

yum install -y tk-devel tcl-devel bzip2-devel
./configure --prefix=/opt/python-2.7.3

make && make install

# build nodejs

cd /usr/local/src
# 目前 gcc 4.8.2 能支持的最高的 nodejs 版本是 5.12.0
wget --no-check-certificate https://nodejs.org/download/release/v5.12.0/node-v5.12.0.tar.gz
tar -xvzf node-v5.12.0.tar.gz
cd node-v5.12.0

scl enable devtoolset-2 bash
export PATH="/opt/python-2.7.3/bin:$PATH"
./configure --prefix=/opt/node-v5.12.0-linux-x64

make && make install

# remove hardcoded shebang
sed -i -e 's/\/opt\/node-v5.12.0-linux-x64\/bin\/node/\/usr\/bin\/env node/g' /opt/node-v5.12.0-linux-x64/bin/npm
tar -cvzf /vagrant/node-v5.12.0-linux-x64.tar.gz /opt/node-v5.12.0-linux-x64
