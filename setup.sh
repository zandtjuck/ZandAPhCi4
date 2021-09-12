pkg up -Y
pkg i php apache2 php-apache mariadb -Y
cp php.conf $PREFIX/etc/apache2/conf.d/php.conf

