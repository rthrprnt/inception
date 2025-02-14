#!/bin/bash

service mariadb start;

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PWD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PWD shutdown

exec mysqld_safe