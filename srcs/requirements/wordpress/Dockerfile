FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y  php8.2-fpm php8.2-mysql curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \ 
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html 

COPY ./conf/wp-config-create.sh /

RUN chmod 777 /wp-config-create.sh

ENTRYPOINT ["sh", "/wp-config-create.sh"]

CMD ["php-fpm8.2", "-F"]