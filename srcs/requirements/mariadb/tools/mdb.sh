#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod 777 /run/mysqld

service mariadb start;

until mysqladmin ping -h"localhost" --silent; do
        echo "Waiting for MariaDB to be ready..."
        sleep 2
 done

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PWD shutdown

exec mysqld_safe