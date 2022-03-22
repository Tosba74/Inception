FROM debian:buster
 
LABEL	maintenaire="bmangin@student.42lyon.fr"

WORKDIR /
 
COPY ./tools/setup.sh .
COPY ./tools/50-server.cnf .
 
RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils mariadb-server php-mysql
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf && ln -s /50-server.cnf /etc/mysql/mariadb.conf.d/
RUN	chown -R www-data /var/lib/mysql/
 
VOLUME ["dbdata:/var/lib/mysql/"]
 
EXPOSE 3306
 
CMD [bash, setup.sh]
