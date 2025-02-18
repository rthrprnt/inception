FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client

COPY conf/wordpress.sh /usr/local/bin/wordpress.sh

RUN  chmod +x /usr/local/bin/wordpress.sh

# Exposer le port de PHP-FPM
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
