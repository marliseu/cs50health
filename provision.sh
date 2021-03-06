#!/bin/sh

# base
sudo apt-get install -y git-core

# MySQL
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install mysql-server mysql-client
mysqladmin -uroot password root > /dev/null 2>&1
mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS mdcs50;"
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

# apache
sudo apt-get install -y apache2
sudo apt-get install -y apache2-mpm-worker apache2-utils libapache2-mod-php5 libapache2-mod-upload-progress libapache2-mod-fcgid
sudo a2enmod actions alias rewrite ssl

# php
sudo apt-get install -y php5-fpm
sudo apt-get install -y php5-mysql php5-cli php5-curl php5-gd php5-imagick php5-mcrypt php5-memcache php5-ps php5-sqlite php5-tidy php5-xmlrpc php5-xsl libapache2-mod-php5

mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS final;"

service apache2 restart