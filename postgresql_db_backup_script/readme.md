PostgreSQL Database Manual backup script for linux
-----------------------------------------------------

		sudo su postgres -c "pg_dump db_name | gzip -c > /home/DBBACKUP/newtech_$(date +"%Y_%m_%d_%H_%M_%S").dump.out.gz"

PostgreSQL Database Automatic backup script for linux
-----------------------------------------------------


Create Backup Directory

		sudo mkdir /home/ubuntu/DBBACKUP/
	
Assign Permission For Backup Directory

		sudo chmod -R 777 /home/ubuntu/DBBACKUP/
	
Create Backup Script Directory

		sudo mkdir /opt/odoo_scripts/

Assign Permission For Backup Script Directory

		sudo chmod -R 777 /opt/odoo_scripts/

To Edit crontab
	
	sudo crontab -e

Add Cron Job in Crontab
	
	(sudo crontab -l; echo "00 03 * * * sh /opt/odoo_scripts/backup_cron/backup_and_ftp_upload.sh") | sudo crontab -

After crontab modification restart 

	sudo service cron restart

Final Command:
	
		sudo mkdir /home/ubuntu/DBBACKUP/ && sudo chmod -R 777 /home/ubuntu/DBBACKUP/ && sudo mkdir /opt/odoo_scripts/ && sudo chmod -R 777 /opt/odoo_scripts/ && (sudo crontab -l; echo "00 03 * * * sh /opt/odoo_scripts/backup_cron/backup_and_ftp_upload.sh") | sudo crontab -

		sudo service cron restart

To check backup
	
	ls -l /home/ubuntu/DBBACKUP/


Copy script to server

	scp -r /home/workspace/odoo_scripts/* username@ip:/opt/odoo_scripts/
