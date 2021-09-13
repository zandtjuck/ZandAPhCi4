#!/bin/bash

pkg up -y;
echo "install dependencies";
pkg i php apache2 php-apache mariadb composer termux-service termux-api -y;
cp php.conf $PREFIX/etc/apache2/conf.d/php.conf;
echo "success cp php.conf to $PREFIX/etc/apache2/conf.d/php.conf";
termux-setup-storage;
mkdir /sdcard/htdocs;
echo "success make dir /sdcard/htdocs";
cp index.html /sdcard/htdocs;
ln -s /sdcard/htdocs ~/htdocs;
echo "success linking /sdcard/htdocs/ to ~/htdocs";
composer create-project --working-dir=/sdcard/htdocs phpmyadmin/phpmyadmin;
composer update --working-dir=/sdcard/htdocs/phpmyadmin;
echo "success install phpmyadmin with composer";
composer create-project --working-dir=/sdcard/htdocs codeigniter4/appstarter ci4 --no-dev;
composer update --working-dir=/sdcard/htdocs/ci4;
echo "success install codeigniter 4 with composer";
composer require --working-dir=/sdcard/htdocs/ci4 myth/auth;
echo "success install apache mariadb php phpmyadmin and codeigniter4 with myth/auth";
cp run-httpd-mysqld.sh ~/run-httpd-mysqld.sh;
cp stop-httpd-mysqld.sh ~/stop-httpd-mysqld.sh;
echo "success copy paste script run and stop httpd mysqld";
echo "now, you have to configure mysql by typing mysqld_safe and type";
echo "";
echo "CREATE USER 'root' IDENTIFIED BY '';";
echo "GRANT ALL ON db.* TO root@localhost IDENTIFIED BY '';";
echo "FLUSH PRIVILEGES;";
echo "quit;";
echo "";


