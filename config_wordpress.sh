#!/bin/sh

if ! $(wp core is-installed  --allow-root --path='/var/www/html'); then
   echo "=> WordPress is not configured yet, configuring WordPress ..."

   echo "==> Installing WordPress"
   sudo -E -u www-data wp core install --path='/var/www/html' --url="$WP_URL:$WP_PORT" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
   echo "==> Deleting Hello Dolly plugin"
   sudo -E -u www-data wp plugin delete hello --path='/var/www/html'
   echo "==> Installing Jet Pack plugin"
   sudo -E -u www-data wp plugin install jetpack --path='/var/www/html'
   echo "==> Installing and activating WP Open Data plugin"
   sudo -E -u www-data wp plugin install wp-opendata --path='/var/www/html' --activate
   echo "==> Installing and activating GovPress theme"
   sudo -E -u www-data wp theme install govpress --path='/var/www/html' --activate
   echo "==> Deleting inactive themes"
   sudo -E -u www-data wp theme delete twentyfourteen twentyfifteen twentysixteen --path='/var/www/html'
   echo "==> Deleting default post, page and comment"
   sudo -E -u www-data wp comment delete 1 --path='/var/www/html'
   sudo -E -u www-data wp post delete 1 --path='/var/www/html'
   sudo -E -u www-data wp post delete $(sudo -E -u www-data wp post list --post_type='page' --format=ids --path='/var/www/html') --path='/var/www/html'

   # Remove WP CLI
   rm -fr /usr/bin/wp

else
   echo "=> WordPress is alread configured.";
fi


