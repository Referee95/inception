FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN apt install -y curl

RUN mkdir -p /var/run/mysqld

RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

COPY ./tools/mr_db.sh /

RUN chmod +x /mr_db.sh

ENTRYPOINT ["sh", "/mr_db.sh"]

CMD ["mariadbd" , "--user=mysql", "--bind-address=0.0.0.0"]