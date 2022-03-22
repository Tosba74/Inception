FROM debian:buster

LABEL	maintenaire="bmangin@student.42lyon.fr"

WORKDIR /

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils nginx openssl

COPY ./tools/nginx.conf /etc/nginx/sites-available/. 

RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/key.key -out /etc/ssl/certs.crt -subj "/C=FR/ST=69/L=LYON/O=42/OU=IT/CN=bmangin.com"
RUN chmod 755 /etc/ssl/certs.crt
RUN	chown -R www-data /var/log/nginx/

EXPOSE 443

VOLUME ["wpdata:/var/log/nginx/"]
# VOLUME ["/var/log/nginx/"]
# VOLUME ../tools/:/var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]
