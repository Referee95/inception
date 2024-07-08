#!bin/bash

echo "\
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;" > /init_db.sql
# ALTER USER 'root'@'%' IDENTIFIED BY '123';

mariadbd --user=mysql --bootstrap < /init_db.sql;

exec "$@" 

