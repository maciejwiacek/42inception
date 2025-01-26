#!/bin/bash

while ! mysqladmin ping -h"mariadb" --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done
echo "MySQL is ready!"

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "WordPress is not installed yet. Installing..."

    wp core download --allow-root

    wp config create \
        --dbname=$DB_NAME \
        --dbuser=$DB_ADMIN_LOGIN \
        --dbpass=$DB_ADMIN_PASSWORD \
        --dbhost=mariadb:3306 \
        --allow-root

    wp core install \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_LOGIN \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    echo "WordPress installed!"
else
    echo "WordPress is already installed!"
fi

php-fpm7.3 -F
