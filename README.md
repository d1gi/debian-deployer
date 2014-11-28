Debian 7.x Deployer
===================

Installation
------------

```
apt-get update && apt-get upgrade
apt-get install git screen lsb-release -y
git clone https://github.com/d1gi/debian-deployer.git
cd debian-deployer
./install.sh
```

or in one line command

```
apt-get update && apt-get upgrade -y && apt-get install git screen lsb-release -y && git clone https://github.com/d1gi/debian-deployer.git && cd debian-deployer && ./install.sh
```

Alternative via zip

```
apt-get update && apt-get upgrade
apt-get install zip screen lsb-release -y
wget https://github.com/d1gi/debian-deployer/archive/master.zip -O debian-deployer.zip
unzip debian-deployer.zip
cd debian-deployer-master
./install.sh
```

Default installed soft
----------------------

```
apache2
php5.5
php5.5-fpm
oracle-java7
redis-server
mariadb-server
igbinary
nginx
nodejs
postfix
varnish
```

**Deactivated packages:**
```
cassandra
elasticsearch
mongodb-org
postgresql
rabbitmq-server
```

Use screen
----------

List all screens

```
screen -ls
```

Connect to screen

```
screen -r <screen_name>
```

Detach current screen
```
Ctrl+a, d
```

Create virtual hosts
--------------------

```
create-apache-vhost.php mysite.ru
```

@todo
-----

 *  Install latest phpmyadmin via http://www.phpmyadmin.net/home_page/version.json
 *  IonCube Loader (https://www.digitalocean.com/community/tutorials/how-to-install-ioncube-loader)
 *  Install via tar archive
 *  HTTPS
 *  PECL uploadprogress и/или apc.rfc1867 = 1
 *  http://www.shellhacks.com/ru/Ustanovka-i-Nastroyka-Fail2ban-v-CentOS-Ubuntu
