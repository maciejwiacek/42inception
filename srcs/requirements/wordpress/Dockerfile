FROM debian:buster

# Install packages
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    default-mysql-client \
    sendmail && \
    sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    mkdir -p /run/php && \
    apt-get clean

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp-run.sh /usr/bin/
RUN chmod +x /usr/bin/wp-run.sh

CMD ["/usr/bin/wp-run.sh"]
