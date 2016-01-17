#!/bin/bash

# Move question2answer to the virtualhost folder
if [ ! -d ${DATA_VOLUME_WWW}/q2a ]; then
	mv /tmp/q2a ${DATA_VOLUME_WWW}/
fi

# Replace default template apache
mv -f /tmp/apache.confsite /etc/apache2/templates/default.confsite

# Create mysql user and database
mysql -u root -pPASSWORD -e "create database q2a; create user 'q2a'@'localhost'; grant all on q2a.* to 'q2a'@'localhost' identified by 'password';"

# Edit question2answer configuration file for insert db informations
sed -i '/syour-mysql-username/q2a/g; /syour-mysql-password/password/g; /syour-mysql-db-name/q2a/g' ${DATA_VOLUME_WWW}/q2a/qa-config.php

# Change files owner with configured WORKER_UID (from docker run command line)
chown -R ${WORKER_UID}:${WORKER_UID} ${DATA_VOLUME_WWW}/q2a