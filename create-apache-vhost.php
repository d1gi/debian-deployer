#!/usr/bin/env php
<?php

if (!isset($argv[1])) {
    echo "You need to set domain name, for example; ";
    echo "  create-apache-vhost.php mysite.ru\n";
    exit(1);
}

$domain = $argv[1];

if (file_exists('/var/www/' . $domain)) {
    echo "Domain $domain is exists.\n";
    exit(1);
}

$conf = "
<VirtualHost *:88>
    ServerAdmin webmaster@{$domain}
    ServerName {$domain}

    DocumentRoot /var/www/{$domain}/web

    <Directory /var/www/{$domain}/web/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log

    # Possible values include: debug, info, notice, warn, error, crit, alert, emerg.
    #LogLevel warn
    #CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
";

file_put_contents('/etc/apache2/sites-enabled/' . $domain, $conf);

mkdir("/var/www/{$domain}");
mkdir("/var/www/{$domain}/web");

system('service apache2 reload');
