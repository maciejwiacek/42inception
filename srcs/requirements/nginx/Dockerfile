FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default

COPY ./tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
