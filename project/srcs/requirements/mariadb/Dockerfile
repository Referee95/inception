FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysql /run/mysqld

RUN chmod  777 /run/mysqld

COPY ./tools/mr_db.sh /

RUN chmod +x /mr_db.sh

ENTRYPOINT ["sh", "/mr_db.sh"]

CMD ["mariadbd" , "--user=mysql", "--bind-address=0.0.0.0"]