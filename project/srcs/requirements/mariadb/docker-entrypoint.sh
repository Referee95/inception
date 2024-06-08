#!/bin/bash
set -e

# Initialize the MariaDB data directory
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

# Start the MariaDB server in the background
mysqld_safe --skip-networking &

# Wait for the server to start
while ! mysqladmin ping --silent; do
    sleep 1
done

# Create the root user with the specified password
mysql -u root <<-EOSQL
    DELETE FROM mysql.user WHERE User='';
    CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    GRANT ALL ON *.* TO 'root'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Bring the MariaDB server to the foreground
wait
