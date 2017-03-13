#!/bin/bash

# Backup Images
source="/var/www/html/wiki/images"
dest="/home/$(id -un)/extracted"
mkdir -p $dest

mkdir ${dest}/TEMP
cp -r $source ${dest}/TEMP
cd ${dest}/TEMP

date=$(date +"%Y-%m-%d")
umask 000

tar -czf ${dest}/wikiImages-${date}.tar.gz ${dest}/TEMP

rm -rf ${dest}/TEMP


# Backup Database
user=""
password="*"
host=""
db_name=""

mysqldump --user=$user --password=$password --host=$host $db_name > $dest/$db_name-$date.sql