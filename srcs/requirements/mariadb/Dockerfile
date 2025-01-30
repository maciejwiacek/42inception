FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/script.sh .

RUN chmod +x ./script.sh

ENTRYPOINT [ "./script.sh" ]
