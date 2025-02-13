#!/bin/sh

sleep 10
#telecharger CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#make phar file executable
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp --info

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress

wp --allow-root core config \
    --dbname='wordpress' \
    --dbuser='wpuser' \
    --dbpass='password' \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

