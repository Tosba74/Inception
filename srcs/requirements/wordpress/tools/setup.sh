
if  [ ! -f /var/www/wordpress/wp-config.php ]; then 
    
    wp core --allow-root download --locale=fr_FR --force 
    sleep 5;
    while  [ ! -f /var/www/wordpress/wp-config.php ]; do   

        
        wp core config --allow-root --dbname=wordpress --dbuser=bmangin --dbpass=bmangin42 --dbhost=mariadb:3306
        

    done 
    wp core install --allow-root --url='bmangin.42.fr' --title='Inception' --admin_user=bmangin --admin_password=bmangin42  --admin_email="bmangin@student.42lyon.fr" --path='/var/www/wordpress';
    wp  user create --allow-root user2 user2@user.com --user_pass=user --role=author
    wp theme install --allow-root dark-mode --activate     
fi 
php-fpm7.3 --nodaemonize
