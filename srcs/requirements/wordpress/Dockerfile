FROM debian:buster 

LABEL   maintainer="bmangin@student.42lyon.fr"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.3-fpm php7.3-common \
    php7.3-mysql php7.3-gmp  php7.3-curl php7.3-intl \
    php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml \
    php7.3-cli php7.3-zip php7.3-soap php7.3-imap php7.3-fpm \
    wget curl openssl sendmail mariadb-client vim procps;  
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "access.log = /var/www/wordpress/access.log" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /var/www/wordpress 
RUN chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/
RUN mkdir -p /run/php/
COPY tools/setup.sh /
WORKDIR /var/www/wordpress
ENTRYPOINT ["sh", "/setup.sh"]
