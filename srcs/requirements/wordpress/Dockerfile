FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget php8.2 php-fpm php-mysql mariadb-client curl

RUN wget https://wordpress.org/latest.tar.gz && \
tar -xvzf latest.tar.gz && \
rm latest.tar.gz && \
mv wordpress /var/www/ && \
chown -R www-data:www-data /var/www/ && \
chmod -R 755 /var/www/

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN  chmod +x /usr/local/bin/wordpress.sh

# Exposer le port de PHP-FPM
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]