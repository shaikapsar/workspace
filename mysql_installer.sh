#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password changeit"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password changeit"
sudo apt-get install -y mysql-server
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
