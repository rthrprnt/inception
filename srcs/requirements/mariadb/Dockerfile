FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server netstat curl

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/mdb.sh /mdb.sh

RUN chmod +x /mdb.sh

ENTRYPOINT ["./mdb.sh"]