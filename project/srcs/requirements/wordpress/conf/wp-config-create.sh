#!/bin/bash

wp core download --path=/var/www/html --allow-root

wp config create --dbname==$DB_NAME --dbuser=$DB_USER --dbhost=mariadb:3306 --path=/var/www/html --allow-root

wp core install --url=$DOMAIN_NAME --title="ykhalil" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --path=/var/www/html --allow-root

wp user create $WP_USER $WP_EMAIL --role=editor --user_pass=$WP_PASS --path=/var/www/html --allow-root

php-fpm8.2 -F