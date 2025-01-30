FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
