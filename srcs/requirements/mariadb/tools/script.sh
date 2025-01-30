#!/bin/bash

echo "Starting Database..."

# Start MySQL service
service mysql start

# Create database if not exists
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

# Create the admin user if it doesn't exist and grant privileges
mysql -e "CREATE USER IF NOT EXISTS '${ADMIN_LOGIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_LOGIN}'@'%';"

# Ensure the user to be altered exists, then change the password (use IF NOT EXISTS if needed)
mysql -e "CREATE USER IF NOT EXISTS '${USER_LOGIN}'@'localhost' IDENTIFIED BY '${USER_PASSWORD}';"
mysql -u root -e "ALTER USER '${USER_LOGIN}'@'localhost' IDENTIFIED BY '${USER_PASSWORD}';"

# Flush privileges to apply changes
mysql -e "FLUSH PRIVILEGES;"

mysqld

echo "Database is ready!"
