#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    mysql_install_db
    service mysql start
	mysql -e "CREATE DATABASE IF NOT EXISTS ${WP_DATABASE};" &&\
    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWORD}';" &&\
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
	mysql -e "FLUSH PRIVILEGES;"
    service mysql stop 
fi
mysqld_safe
