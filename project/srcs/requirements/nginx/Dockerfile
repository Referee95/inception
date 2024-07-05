FROM debian:latest


RUN apt-get update -y \ && \
    apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout /etc/nginx/ssl/referee.key -out /etc/nginx/ssl/referee.crt -subj "/C=MA/ST=referee/L=martil/O=1337/OU=42network/CN=ykhalil-.42.fr"

COPY index.html /var/www/html/

COPY conf/nginx.conf /etc/nginx/conf.d/

# Expose port 443
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
