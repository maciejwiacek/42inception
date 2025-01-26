FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    curl \
    php

WORKDIR /var/www/html/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /usr/local/bin/wp;

COPY ./tools/wp-run.sh ./

RUN chmod +x wp-run.sh

CMD [ "./wp-run.sh" ]
