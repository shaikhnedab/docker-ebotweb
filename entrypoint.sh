#!/bin/bash

EBOT_WEB_HOME='/var/www/html'

MYSQL_HOST="${MYSQL_HOST:-mysql}"
MYSQL_PORT="${MYSQL_PORT:-3306}"
MYSQL_USER="${MYSQL_USER:-ebotv3}"
MYSQL_PASS="${MYSQL_PASS:-ebotv3}"
MYSQL_DB="${MYSQL_DB:-ebotv3}"


EBOT_ADMIN_USER="${EBOT_ADMIN_USER:-admin}"
EBOT_ADMIN_PASS="${EBOT_ADMIN_PASS:-password}"
EBOT_ADMIN_MAIL="${EBOT_ADMIN_MAIL:-admin@ebot}"

# for usage with docker-compose
while ! nc -z $MYSQL_HOST $MYSQL_PORT; do sleep 3; done

if [ ! -f .installed ]
then
    php symfony configure:database "mysql:host=${MYSQL_HOST};dbname=${MYSQL_DB}" $MYSQL_USER $MYSQL_PASS
    php symfony doctrine:insert-sql
    php symfony guard:create-user --is-super-admin $EBOT_ADMIN_MAIL $EBOT_ADMIN_USER $EBOT_ADMIN_PASS

    touch .installed
fi

php symfony cc

apache2-foreground