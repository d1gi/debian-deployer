Debian 7.x Deployer
===================

Installation
------------

```
apt-get install git -y
git clone https://github.com/d1gi/debian-deployer.git
cd debian-deployer
./install.sh
```

Alternative via zip

```
apt-get install zip -y
wget https://github.com/d1gi/debian-deployer/archive/master.zip -O debian-deployer.zip
unzip debian-deployer.zip
cd debian-deployer-master
./install.sh
```

Create virtual hosts
--------------------

```
./create-apache-vhost.php mysite.ru
```

@todo
-----

Install via tar
