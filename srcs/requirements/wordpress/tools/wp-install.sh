#!/bin/bash

while ! mysqladmin ping -h"mariadb" --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done
echo "MySQL is ready!"

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Installing WordPress..."

    wp core download --allow-root

    wp config create \
        --dbname=wordpress \
        --dbuser=$ADMIN_LOGIN \
        --dbpass=$ADMIN_PASSWORD \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=mwiacek.42.fr \
        --title=inception \
        --admin_user=$ADMIN_LOGIN \
        --admin_password=$ADMIN_PASSWORD \
        --admin_email=$ADMIN_EMAIL \
        --allow-root

    wp user create \
        $USER_LOGIN \
        $USER_EMAIL \
        --role=author \
        --user_pass=$USER_PASSWORD \
        --allow-root

    wp theme install twentytwentyfour --activate --allow-root

    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    echo "WordPress installed!"
else
    echo "WordPress is already installed!"
fi

php-fpm7.3 -F
