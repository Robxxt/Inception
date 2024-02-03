#!/bin/bash

# Start MariaDB service
service mariadb start

# Wait for MariaDB to start
sleep 5

# Create SQL script
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Execute SQL script
mysql < db1.sql

# Stop MariaDB service
service mariadb stop

# Start mysqld
mysqld
