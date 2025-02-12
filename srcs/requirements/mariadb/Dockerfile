FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server netcat

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]

COPY conf/my.cnf /etc/mysql/my.cnf
