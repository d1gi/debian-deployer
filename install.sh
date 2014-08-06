#!/bin/bash

apt-get install apt-transport-https -y

# varnish
wget --quiet -O - https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
echo "deb https://repo.varnish-cache.org/debian/ wheezy varnish-4.0" > /etc/apt/sources.list.d/varnish-cache.list

# dotdeb
#curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
wget --quiet -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
printf "deb http://packages.dotdeb.org wheezy-php55 all\ndeb-src http://packages.dotdeb.org wheezy-php55 all" > /etc/apt/sources.list.d/dotdeb.list

# postgresql
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/postgresql.list

# Maria DB
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
printf "deb http://mirror.mephi.ru/mariadb/repo/10.0/debian wheezy main\ndeb-src http://mirror.mephi.ru/mariadb/repo/10.0/debian wheezy main" > /etc/apt/sources.list.d/mariadb.list

# Nginx
wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
printf "deb http://nginx.org/packages/debian/ wheezy nginx\ndeb-src http://nginx.org/packages/debian/ wheezy nginx" > /etc/apt/sources.list.d/nginx.list

apt-get update

# Базовый софт
apt-get install colordiff mc make htop make git curl rcconf p7zip-full zip ruby ruby-dev dnsutils monit -y
apt-get install locales-all fail2ban python-software-properties -y

apt-get install locales
dpkg-reconfigure locales
dpkg-reconfigure tzdata

# SQL Сервера
apt-get install mariadb-server -y
#apt-get install mysql-server mysql-client -y

# Apache и PHP
apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 libapache2-mod-rpaf memcached php5 php5-dev php5-cli -y
apt-get install php5-apcu php-pear php5-gd php5-intl php5-curl php5-geoip php5-gmp php5-imagick php5-mcrypt php5-sqlite -y
apt-get install php5-snmp php5-xmlrpc php5-xsl php5-mysqlnd php5-pgsql php5-tidy php5-redis php5-memcache -y

# Хак с расширением php5-memcached
printf "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list
apt-get update
apt-get install libmemcached11
printf "deb http://packages.dotdeb.org wheezy-php55 all\ndeb-src http://packages.dotdeb.org wheezy-php55 all" > /etc/apt/sources.list.d/dotdeb.list
apt-get update
apt-get install php5-memcached -y

a2enmod rewrite
a2enmod php5
service apache2 restart

apt-get install nginx -y

# Composer
curl -skS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer.phar

apt-get clean

# Apache
rm /etc/apache2/sites-enabled/000-default


cp -R new/etc / -v
cp -R new/usr / -v
cp ~/.bashrc ~/.bashrc_old

# @todo pma и pga
#wget http://heanet.dl.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.2.7/phpMyAdmin-4.2.7-all-languages.zip

git config --global color.diff always
git config --global color.status always
git config --global color.branch always
git config --global color.interactive always

wget http://get.sensiolabs.org/php-cs-fixer.phar -O /usr/local/bin/php-cs-fixer.phar
chmod 0777 /usr/local/bin/php-cs-fixer.phar

git clone https://github.com/KnpLabs/symfony2-autocomplete.git ~/symfony2-autocomplete
