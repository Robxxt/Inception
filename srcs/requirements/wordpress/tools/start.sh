#!/bin/bash

mkdir -p /var/www/html && cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

sed -i "s/define( 'DB_NAME', 'db1' );/define( 'DB_NAME', '$DB_NAME' );/" /wp-config.php
sed -i "s/define( 'DB_USER', 'user' );/define( 'DB_USER', '$DB_USER' );/" /wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'pwd' );/define( 'DB_PASSWORD', '$DB_PASSWORD' );/" /wp-config.php

mv /wp-config.php /var/www/html/
rm /var/www/html/wp-config-sample.php

sleep 6

wp core install --url=$AUTHOR.$DOMAIN/ --title=$WP_TITLE --admin_user=$AUTHOR --admin_password=$DB_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_SECOND_USER $WP_SECOND_USER_EMAIL --role=author --user_pass=$WP_SECOND_PASSWORD --allow-root
wp theme install astra --activate --allow-root
wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.4 -F