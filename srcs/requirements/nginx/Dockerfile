FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/.

COPY ./tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
