Debian 7 and 8 Deployer
===================

Installation
------------

```
apt-get update
apt-get install git screen lsb-release -y
git clone https://github.com/d1gi/debian-deployer.git
cd debian-deployer
./install.sh
```

or in one line command

```
apt-get update && apt-get install git screen lsb-release -y && git clone https://github.com/d1gi/debian-deployer.git && cd debian-deployer && ./install.sh
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
php5.6
php5.6-fpm
oracle-java8
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
create-symfony-nginx-vhost mysymfony-project.ru
create-nginx-vhost mysite.ru
create-apache-vhost mysite.ru
```

Linux Add a Swap File – Howto
-----------------------------

http://www.cyberciti.biz/faq/linux-add-a-swap-file-howto/


**Step #1: Create Storage File**

Type the following command to create 512MB swap file (1024 * 512MB = 524288 block size):
```
dd if=/dev/zero of=/swapfile1 bs=1024 count=524288
```

**Step #2: Secure swap file**

Setup correct file permission for security reasons, enter:
```
chown root:root /swapfile1
chmod 0600 /swapfile1
```

**Step #3: Set up a Linux swap area**

Type the following command to set up a Linux swap area in a file:
```
mkswap /swapfile1
```

**Step #4: Enabling the swap file**

Finally, activate /swapfile1 swap space immediately, enter:
```
swapon /swapfile1
```

**Step #5: Update /etc/fstab file**

To activate /swapfile1 after Linux system reboot, add entry to /etc/fstab file. Open this file using a text editor such as vi:
```
mcedit /etc/fstab
```
Append the following line:
```
/swapfile1 none swap sw 0 0
```

@todo
-----

 *  Backup resolf.conf default config
 *  Install latest phpmyadmin via http://www.phpmyadmin.net/home_page/version.json
 *  IonCube Loader (https://www.digitalocean.com/community/tutorials/how-to-install-ioncube-loader)
 *  Install via tar archive
 *  HTTPS
 *  PECL uploadprogress и/или apc.rfc1867 = 1
 *  http://www.shellhacks.com/ru/Ustanovka-i-Nastroyka-Fail2ban-v-CentOS-Ubuntu
 *  apache-autoconf.conf (https://github.com/helios-ag/symfony-website-config)
 *  MUnin (http://habrahabr.ru/post/30494/)
 *  https://developers.google.com/speed/pagespeed/module
