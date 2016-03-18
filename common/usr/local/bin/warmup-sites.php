#!/usr/bin/env php
<?php
// */5 * * * * root /usr/local/bin/warmup-sites.php &> /dev/null

$directory = '/var/www';

foreach (array_diff(scandir($directory), ['..', '.']) as $dir) {
    if (is_dir($directory . '/' . $dir)) {
        system("curl http://{$dir}/?__warmup__ > /dev/null");
    }
}
