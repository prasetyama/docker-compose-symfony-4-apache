#!/bin/bash

echo "Set symfony dirs permissions"
setfacl -R -m u:www-data:rwX -m u:`whoami`:rwX var/cache var/logs var/spool 
setfacl -dR -m u:www-data:rwX -m u:`whoami`:rwX var/cache var/logs var/spool

echo "Composer install"
composer install --prefer-dist

echo "Npm install"
npm install

apache2-foreground