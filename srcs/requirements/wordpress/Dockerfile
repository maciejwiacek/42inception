FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    php7.3-fpm \
    php7.3-mysqli \
    php7.3-mysql \
    default-mysql-client \
    curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/.

COPY ./tools/wp-install.sh /
RUN chmod +x /wp-install.sh
ENTRYPOINT [ "/wp-install.sh" ]
