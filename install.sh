#!/bin/bash

apt-get install apt-transport-https -y

# Varnish
wget --quiet -O - https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
echo "deb https://repo.varnish-cache.org/debian/ wheezy varnish-3.0" > /etc/apt/sources.list.d/varnish-cache.list

# dotdeb
wget --quiet -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
printf "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all\ndeb http://packages.dotdeb.org wheezy-php56 all\ndeb-src http://packages.dotdeb.org wheezy-php56 all\ndeb http://mirror.nl.leaseweb.net/dotdeb/ wheezy-php56 all\ndeb-src http://mirror.nl.leaseweb.net/dotdeb/ wheezy-php56 all" > /etc/apt/sources.list.d/dotdeb.list

# PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/postgresql.list

# Maria DB
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
printf "deb http://mirror.mephi.ru/mariadb/repo/10.0/debian wheezy main\ndeb-src http://mirror.mephi.ru/mariadb/repo/10.0/debian wheezy main" > /etc/apt/sources.list.d/mariadb.list

# MongoDB
apt-key adv --keyserver keyserver.ubuntu.com --recv 9ECBEC467F0CEB10
#echo "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen" > /etc/apt/sources.list.d/mongodb.list
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" > /etc/apt/sources.list.d/mongodb.list

# Java
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
printf "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main\ndeb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/java.list

# elasticsearch
wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
echo "deb http://packages.elasticsearch.org/elasticsearch/1.5/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list

# Apache Cassandra
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 749D6EEC0353B12C
gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | apt-key add -
printf "deb http://www.apache.org/dist/cassandra/debian 20x main\ndeb-src http://www.apache.org/dist/cassandra/debian 20x main" > /etc/apt/sources.list.d/cassandra.list

# RabbitMQ
wget -qO - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list

# Ruby Version Manager
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Subversion 1.8
wget -q http://opensource.wandisco.com/wandisco-debian.gpg -O- | apt-key add -
echo "deb http://staging.opensource.wandisco.com/debian wheezy svn18" > /etc/apt/sources.list.d/subversion.list

# Nginx native
#wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
#printf "deb http://nginx.org/packages/debian/ wheezy nginx\ndeb-src http://nginx.org/packages/debian/ wheezy nginx" > /etc/apt/sources.list.d/nginx.list

# NodeJS
#  in this step apt-get update will executes automatically
wget -qO- https://deb.nodesource.com/setup_5.x | bash -

# Базовый софт
apt-get install dialog apt-utils -y
apt-get install colordiff mc make htop make git curl rcconf p7zip-full zip dnsutils monit python-software-properties -y
apt-get install acl bash-completion locales locales-all fail2ban resolvconf subversion sudo ntp imagemagick p7zip tree -y
apt-get install libedit-dev libevent-dev libcurl4-openssl-dev automake1.1 libncurses-dev libpcre3-dev pkg-config python-docutils -y
apt-get install oracle-java8-installer -y
#apt-get install elasticsearch -y
#apt-get install rabbitmq-server -y

dpkg-reconfigure locales
dpkg-reconfigure tzdata

# БД
apt-get install redis-server -y
apt-get install mariadb-server -y
#apt-get install postgresql postgresql-contrib -y
#apt-get install cassandra -y
#apt-get install mongodb php5-mongo -y
#apt-get install mongodb-org=3.0.3 php5-mongo -y
#apt-get install mysql-server mysql-client -y

# Web server
apt-get install apache2 apache2-mpm-prefork libapache2-mod-php5 libapache2-mod-rpaf memcached php5 php5-dev php5-cli php5-fpm -y
apt-get install php5-apcu php-pear php5-gd php5-intl php5-curl php5-geoip php5-gmp php5-imagick php5-mcrypt php5-sqlite php5-ssh2 -y
apt-get install php5-snmp php5-xmlrpc php5-xsl php5-mysqlnd php5-pgsql php5-tidy php5-redis php5-memcache php5-memcached php5-imap -y

ln -s /etc/php5/global-php5.ini /etc/php5/apache2/conf.d/00-global-php5.ini
ln -s /etc/php5/global-php5.ini /etc/php5/cli/conf.d/00-global-php5.ini
ln -s /etc/php5/global-php5.ini /etc/php5/fpm/conf.d/00-global-php5.ini

ln -s /etc/php5/php5-apache.ini /etc/php5/apache2/conf.d/01-php5-apache.ini
ln -s /etc/php5/php5-cli.ini /etc/php5/cli/conf.d/01-php5-cli.ini
ln -s /etc/php5/php5-fpm.ini /etc/php5/fpm/conf.d/01-php5-fpm.ini

rm /etc/apache2/sites-enabled/000-default
a2enmod rewrite
a2enmod php5

apt-get install nodejs nginx -y

# Configs
if [ ! -f ~/.bashrc_old ]
then
    mv ~/.bashrc ~/.bashrc_old
    cp -R new/etc / -v
    cp -R new/usr / -v
    cp -R new/root / -v
    cp -v create-apache-vhost /usr/local/bin/create-apache-vhost
    cp -v create-nginx-vhost /usr/local/bin/create-nginx-vhost
fi

# Cache
apt-get install varnish -y

# Composer
curl -skS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer.phar

# igbinary
pecl install igbinary
ln -s /etc/php5/mods-available/igbinary.ini /etc/php5/apache2/conf.d/20-igbinary.ini
ln -s /etc/php5/mods-available/igbinary.ini /etc/php5/cli/conf.d/20-igbinary.ini
ln -s /etc/php5/mods-available/igbinary.ini /etc/php5/fpm/conf.d/20-igbinary.ini

# Twig
git clone https://github.com/twigphp/Twig.git ~/Twig
cd ~/Twig/ext/twig
phpize;./configure;make;make install
ln -s /etc/php5/mods-available/twig.ini /etc/php5/apache2/conf.d/20-twig.ini
ln -s /etc/php5/mods-available/twig.ini /etc/php5/cli/conf.d/20-twig.ini
ln -s /etc/php5/mods-available/twig.ini /etc/php5/fpm/conf.d/20-twig.ini
cd ~

mkdir /var/log/php
chmod 0777 /var/log/php

wget http://get.sensiolabs.org/php-cs-fixer.phar -O /usr/local/bin/php-cs-fixer.phar
chmod 0777 /usr/local/bin/php-cs-fixer.phar

git clone https://github.com/KnpLabs/symfony2-autocomplete.git /usr/share/symfony2-autocomplete

# @todo pma и pga
# http://www.phpmyadmin.net/home_page/version.json
# wget https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-all-languages.zip

apt-get install postfix -y

apt-get clean
service apache2 restart
service php5-fpm restart
service mysql restart
service nginx restart

# Ruby
# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-an-debian-7-0-wheezy-vps-using-rvm
curl -L https://get.rvm.io | bash -s stable --ruby
source /etc/profile.d/rvm.sh
#source /usr/local/rvm/scripts/rvm
#apt-get install ruby ruby-dev
gem install capifony
