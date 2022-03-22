FROM	debian:buster

LABEL	maintenaire="bmangin@student.42lyon.fr"

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils wordpress php7.3 php-mysql mariadb-client php-fpm wget git 
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/bmangin.html /var/www/

##############################
RUN apt-get install -y vim zsh
##############################
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=/usr/src/wordpress --allow-root

VOLUME ["wpdata:/var/www/"]

EXPOSE 9000

ENTRYPOINT ["bash","setup.sh"]
