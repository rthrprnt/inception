#!/bin/sh

#telecharger CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#make phar file executable
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

#COMMAND CLI
wp --allow-root core download

wp --allow-root core config \
   --dbname="$SQL_DB" \
   --dbuser="$SQL_USER" \
   --dbpass="$SQL_PWD" \
   --dbhost=mariadb:3306 \


until wp db check --allow-root; do
  echo "Waiting for database..."
  sleep 3
done


wp --allow-root core install \
    --url="$WP_DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_NAME" \
    --admin_password="$WP_ADMIN_PWD" \
    --admin_email="$WP_ADMIN_EMAIL"

wp --allow-root user create \
    "$WP_U_NAME" \
    "$WP_U_EMAIL" \
    --role="$WP_U_ROLE" \
    --user_pass="$WP_U_PWD"


#CONFIG PHP
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F