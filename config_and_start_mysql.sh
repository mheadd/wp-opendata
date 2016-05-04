#!/bin/bash

if [ ! -f /mysql_configured ]; then
    echo "=> MySQL not configured yet, configuring MySQL ..."

    echo "=> Starting MySQL"
    /etc/init.d/mysql start &

    echo "=> Waiting till MySQL is started"
    mysqladmin --wait=30 ping > /dev/null 2>&1

    echo "=> Creating WordPress db"
    mysqladmin create wpopendata

    echo "=> Creating MySQL WP user and granting external access";
    mysql -uroot -e "CREATE USER '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON wpopendata.* TO '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD';"

    touch /mysql_configured
else
    echo "=> MySQL is already configured"

    echo "=> Starting MySQL"
    /etc/init.d/mysql start
fi