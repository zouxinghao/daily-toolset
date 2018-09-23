backupfolder=$1
subfolder="$backupfolder"`date '+%Y%m'/`
mkdir -p $subfolder

echo "1. Backup db"
docker exec [mysql-container-name] /usr/bin/mysqldump -u [user] --password=[password] [database-name] | gzip > $subfolder`date '+%Y%m%d'.sql.gz`

if [ $? -ne 0 ];then
    # mission imcomplete, send email 
    echo -e "Cannot backup" | mail -s 'Title' x*******u@outlook.com
    exit -1
fi
find $subfolder -mtime +7 -name 'data_[1-9].sql.,gz' -exec rm -rf {} \;

echo "2. Backup web"
cp -a /data/blog/web/images/upload/ $subfolder`date '+%Y%m%d'/`

