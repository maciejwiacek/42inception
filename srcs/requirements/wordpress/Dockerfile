FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    php-mysql \
    default-mysql-client \
    curl && \
    sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    mkdir -p /run/php && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp-install.sh /
RUN chmod +x /wp-install.sh
ENTRYPOINT [ "/wp-install.sh" ]
