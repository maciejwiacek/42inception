#!/bin/bash

while ! mysqladmin ping -h"mariadb" --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 1
done
echo "MySQL is ready!"

echo "Installing WordPress..."
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
echo "WordPress installed!"

php-fpm7.3 -F
