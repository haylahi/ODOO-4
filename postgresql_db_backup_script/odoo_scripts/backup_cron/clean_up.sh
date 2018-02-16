#!/bin/sh
path=/opt/DBBACKUP/
logfile=/opt/odoo_scripts/backup_cron/log_backup/clean_up.log


for file in `find /opt/DBBACKUP/ -mtime +10 -type f -name *.out.gz`
do
  echo "deleting: " $file >> $logfile
  rm -f $file
done

exit 0
