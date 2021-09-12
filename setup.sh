#!/bin/bash

pkg up -y;
pkg i php apache2 php-apache mariadb -y;
cp php.conf $PREFIX/etc/apache2/conf.d/php.conf;
echo "success cp php.conf to $PREFIX/etc/apache2/conf.d/php.conf";

