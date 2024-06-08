#!/bin/bash

service mariadb start 

mysql -e "CREATE USER 'root'@'localhost' INDENTIFED BY 'miroka';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysql_safe