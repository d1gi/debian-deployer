#!/bin/bash

# Базовый софт
apt-get install colordiff mc make htop make git curl rcconf p7zip-full zip ruby ruby-dev dnsutils monit apt-transport-https -y

# Подготовка репозиториев
curl https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |apt-key add -

echo "deb https://repo.varnish-cache.org/debian/ wheezy varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" >> /etc/apt/sources.list.d/postgresql.list
printf "deb http://packages.dotdeb.org wheezy-php55 all\ndeb-src http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/dotdeb.list

apt-get update

apt-get install locales
dpkg-reconfigure locales

# Сервера
#apt-get install mysql-server mysql-client -y

#apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 libapache2-mod-rpaf memcached php5 php5-dev php5-cli -y

#apt-get install php5-apcu php-pear php5-gd php5-intl php5-curl php5-geoip php5-gmp php5-imagick php5-mcrypt php5-sqlite php5-snmp php5-xmlrpc php5-xsl php5-mysqlnd php5-pgsql php5-tidy php5-redis -y

#apt-get install php5-memcache php5-memcached -y

#apt-get install nginx -y
