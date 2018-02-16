#!/bin/sh

FILE="$1"
 
if [ -f "$FILE" ];
then
   echo "File $FILE exist."
else
   echo "File $FILE does not exist, create template" >&2
   touch $FILE
   # echo "BACKUP_START_TIME,BACKUP_END_TIME,LOCAL_BACKUP_PATH,FILE_SIZE,FTP_UPLOAD_START_TIME,FTP_UPLOAD_END_TIME,EMAIL_NOTIFICATION" >> $FILE
   echo "BACKUP_START_TIME,BACKUP_END_TIME,LOCAL_BACKUP_PATH,FILE_SIZE" >> $FILE
fi