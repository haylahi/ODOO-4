
echo "PostgreSQL Database Automatic backup script for linux"
echo "-----------------------------------------------------"

echo "Database Script initial steps"
user=`whoami`

echo "User : $user"
# Create Backup Directory

sudo mkdir /home/$user/DBBACKUP/

echo "1) Created Backup Directory"

# Assign Permission For Backup Directory

sudo chmod -R 777 /home/$user/DBBACKUP/

echo "2) Assigned Permission For Backup Directory"
	
# Create Backup Script Directory

sudo mkdir /opt/odoo_scripts/

echo "3) Created Backup Script Directory"

# Assign Permission For Backup Script Directory

sudo chmod -R 777 /opt/odoo_scripts/

echo "4) Assigned Permission For Backup Script Directory"

# To Edit crontab
	
# 	sudo crontab -e

# Add Cron Job in Crontab
	
(sudo crontab -l; echo "00 03 * * * sh /opt/odoo_scripts/backup_cron/backup_and_ftp_upload.sh") | sudo crontab -

echo "5) Cron job Added"

# After crontab modification restart 

sudo service cron restart

echo "6) Cron service restarted"
# Final Command:
	
# 		sudo mkdir /home/ubuntu/DBBACKUP/ && sudo chmod -R 777 /home/ubuntu/DBBACKUP/ && sudo mkdir /opt/odoo_scripts/ && sudo chmod -R 777 /opt/odoo_scripts/ && (sudo crontab -l; echo "00 03 * * * sh /opt/odoo_scripts/backup_cron/backup_and_ftp_upload.sh") | sudo crontab -

# 		sudo service cron restart

# To check backup
	
# 	ls -l /home/ubuntu/DBBACKUP/


# Copy script to server

# 	scp -r /home/workspace/odoo_scripts/* username@ip:/opt/odoo_scripts/

echo "Database Script initial steps Completed."
