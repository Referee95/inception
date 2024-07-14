#!bin/bash

echo "\
FLUSH PRIVILEGES;

ALTER USER'root'@'localhost' IDENTIFIED BY '1234';
CREATE DATABASE IF NOT EXISTS $DB_NAME ;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';

FLUSH PRIVILEGES;" > /init_db.sql

mariadbd --user=mysql --bootstrap < /init_db.sql;

exec "$@" 

