
FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/nginx/ssl/inception.key \
-out /etc/nginx/ssl/inception.crt \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=apernot.42.fr/UID=apernot"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]