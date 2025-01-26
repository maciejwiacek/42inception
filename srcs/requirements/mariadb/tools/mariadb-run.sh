#!/bin/bash

# Check environment variables
echo "DB_NAME: ${DB_NAME}"
echo "DB_ADMIN_LOGIN: ${DB_ADMIN_LOGIN}"
echo "DB_ADMIN_PASSWORD: ${DB_ADMIN_PASSWORD}"

# Start MySQL service
service mysql start

# Create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create user
mysql -e "CREATE USER IF NOT EXISTS '${DB_ADMIN_LOGIN}'@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';"

# Grant privileges
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_ADMIN_LOGIN}'@'%';"

# Flush privileges
mysql -e "FLUSH PRIVILEGES;"

# Start mysqld process
mysqld
