Debian 7.x Deployer
===================

Installation
------------

```
apt-get install git screen -y
git clone https://github.com/d1gi/debian-deployer.git
cd debian-deployer
./install.sh
```

Alternative via zip

```
apt-get install zip screen -y
wget https://github.com/d1gi/debian-deployer/archive/master.zip -O debian-deployer.zip
unzip debian-deployer.zip
cd debian-deployer-master
./install.sh
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
./create-apache-vhost.php mysite.ru
```

@todo
-----

 *  Install via tar archive
