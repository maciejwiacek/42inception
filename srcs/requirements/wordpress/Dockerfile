FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    php-mysql \
    default-mysql-client \
    curl

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/.
COPY ./tools/wp-install.sh .
RUN chmod +x wp-install.sh
CMD [ "./wp-install.sh" ]
