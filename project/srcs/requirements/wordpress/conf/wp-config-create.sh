#!/bin/bash


mkdir -p /run/php

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

cd /var/www/html

wp core download --path=/var/www/html --allow-root

wp config create    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASS \
                    --dbhost=mariadb:3306 \
                    --path=/var/www/html \
                    --allow-root

wp core install  --url=$DOMAIN_NAME \
                 --title="ykhalil" \
                 --admin_user=$WP_ADMIN \
                 --admin_password=$WP_ADMIN_PASS \
                 --admin_email=$WP_ADMIN_EMAIL \
                 --path=/var/www/html --allow-root --skip-email

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --path=/var/www/html --allow-root

exec php-fpm8.2 -F