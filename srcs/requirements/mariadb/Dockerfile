FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb-run.sh /usr/bin/mariadb-run.sh
RUN chmod +x /usr/bin/mariadb-run.sh

CMD ["/usr/bin/mariadb-run.sh"]
