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
        --dbuser=wpuser \
        --dbpass=password \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=localhost \
        --title=inception \
        --admin_user=admin \
        --admin_password=admin \
        --admin_email=admin@admin.com \
        --allow-root

    wp theme install twentytwentyfour --activate --allow-root

    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    echo "WordPress installed!"
else
    echo "WordPress is already installed!"
fi

php-fpm7.3 -F
