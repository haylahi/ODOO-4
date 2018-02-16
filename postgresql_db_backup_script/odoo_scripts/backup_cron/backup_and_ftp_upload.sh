#!/bin/sh

# Note : change owner to root
# sudo chown root:root backup_and_ftp_upload.sh


# HOST='FTPHOST'
# USER='FTPUSER'
# PASSWD='FTPPASSWORD'
DB_NAME='DBNAME'
BACKUP_DIR='/opt/DBBACKUP/'
# FTP_DIR='DBBACKUP/'
FILE_EXTN='dump.out.gz'
# FTPLOG_PATH='/opt/odoo_scripts/backup_cron/log_ftp_upload/'
BACKUPLOG_PATH='/opt/odoo_scripts/backup_cron/log_backup/'



MONTH=$(date +"%Y_%m")
DATETIME=$(date +"%Y_%m_%d_%H_%M_%S")
FILE_NAME=$DB_NAME'_'$DATETIME
# FTPLOG=$FTPLOG_PATH'log_ftp_'$MONTH'.log'
BACKUP_LOG=$BACKUPLOG_PATH'log_backup_'$MONTH'.csv'


# Check backup log file ,if not exist create log template
sudo sh /opt/odoo_scripts/backup_cron/check_log_file_exists.sh $BACKUP_LOG

# Check backups before 10 days to be deleted
sudo sh /opt/odoo_scripts/backup_cron/clean_up.sh

# echo '---------------- '$DATETIME' ----------------' >> $BACKUP_LOG
BACKUP_START_TIME=$(date +"%Y-%m-%d %H:%M:%S")
# echo $(date +"%Y-%m-%d %H:%M:%S")',Backup Started...' >> $BACKUP_LOG
# echo $(date +"%Y-%m-%d %H:%M:%S")',pg_dump '$DB_NAME' | gzip -c > '$BACKUP_DIR$FILE_NAME.$FILE_EXTN >> $BACKUP_LOG

sudo su postgres -c "pg_dump $DB_NAME | gzip -c > $BACKUP_DIR$FILE_NAME.$FILE_EXTN"

BACKUP_END_TIME=$(date +"%Y-%m-%d %H:%M:%S")
# echo $(date +"%Y-%m-%d %H:%M:%S")',Backup Completed ( '$BACKUP_DIR$FILE_NAME.$FILE_EXTN' )' >> $BACKUP_LOG
LOCAL_BACKUP_PATH=$BACKUP_DIR$FILE_NAME.$FILE_EXTN
FILE_SIZE=`sudo du -h $BACKUP_DIR$FILE_NAME.$FILE_EXTN | awk '{ print $1; }'`
# sudo du -h $BACKUP_DIR$FILE_NAME.$FILE_EXTN | awk '{ print $1; }' >> $BACKUP_LOG

#FTP connect and upload backp file
# FTP_UPLOAD_START_TIME=$(date +"%Y-%m-%d %H:%M:%S")
# echo $(date +"%Y-%m-%d %H:%M:%S")',Ftp upload started...' >> $BACKUP_LOG


# cd $BACKUP_DIR
# ftp -nv $HOST>>$FTPLOG <<END_SCRIPT
# quote USER $USER
# quote PASS $PASSWD
# cd $FTP_DIR
# put $FILE_NAME.$FILE_EXTN
# quit
# END_SCRIPT


# FTP_UPLOAD_END_TIME=$(date +"%Y-%m-%d %H:%M:%S")
# echo $(date +"%Y-%m-%d %H:%M:%S")' FTP Upload completed.' >> $BACKUP_LOG

# Send mail notification
# EMAIL_NOTIFICATION=`sudo python /Odoo/odoo_scripts/backup_cron/send_mail_notification.py $FILE_NAME.$FILE_EXTN $BACKUP_DIR$FILE_NAME.$FILE_EXTN`

# echo "$BACKUP_START_TIME,$BACKUP_END_TIME,$LOCAL_BACKUP_PATH,$FILE_SIZE,$FTP_UPLOAD_START_TIME,$FTP_UPLOAD_END_TIME,$EMAIL_NOTIFICATION" >> $BACKUP_LOG
echo "$BACKUP_START_TIME,$BACKUP_END_TIME,$LOCAL_BACKUP_PATH,$FILE_SIZE" >> $BACKUP_LOG
