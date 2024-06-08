# Use the official Debian image as the base image
FROM debian:latest

# Install necessary packages and MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=123

# Expose the default MySQL port
EXPOSE 3306

# Copy the custom MySQL configuration file if you have one
# COPY my.cnf /etc/mysql/my.cnf

# Add a script to initialize the database
COPY docker-entrypoint.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Run the MariaDB server
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
