#!/bin/bash

set -e

echo `service mysql status`

echo '1.start mysql....'

# start mysql
service mysql start

sleep 3

echo `service mysql status`
echo 'show databases'

DATABASES=$(mysql -e "show databases")
DATABASE="tale"
echo $DATABASES
echo $DATABASE
if [[ "$DATABASES" =~ "$DATABASE" ]];then

echo '--------mysql container initialize--------'
echo '2.database already exist....'

else

echo '--------mysql start--------'
echo '2.import data....'
#import data
mysql < /mysql/blog.sql

echo '3.data import complete....'

sleep 3
echo `service mysql status`

#renew the password of mysql
echo '4.change the password....'

mysql < /mysql/password.sql

echo '5.the password has been changed....'

#sleep 3
echo `service mysql status`
echo 'mysql set up successed!'

fi

tail -f /dev/null