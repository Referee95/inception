#!bin/bash

echo "\
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS datatest;
CREATE USER IF NOT EXISTS 'mariaT'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON datatest.* TO 'mariaT'@'%' IDENTIFIED BY '123';
FLUSH PRIVILEGES;" > /init_db.sql
# ALTER USER 'root'@'%' IDENTIFIED BY '123';

mariadbd --user=mysql --bootstrap < /init_db.sql;

exec "$@" 