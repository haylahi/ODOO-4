# odoo
Odoo Refferences

Odoo Service Enable
-------------------
https://www.linode.com/docs/websites/cms/install-odoo-10-on-ubuntu-16-04/

Odoo 11 installation
--------------------
https://webkul.com/blog/install-odoo11-on-ubuntu/
https://www.getopenerp.com/install-odoo-11-on-ubuntu-16-04/

Create ODOO user in postgres:
-------------------------------
sudo su postgres

createuser --createdb --username postgres --no-createrole --pwprompt odoo

Unable to find python-pip -Fix
-------------------------
sudo apt-get install software-properties-common

sudo apt-add-repository universe

sudo apt-get update

sudo apt-get install python-pip

Upgrade or install postgresql latest(9.6 or above)
--------------------------------------------------

Link: https://stackoverflow.com/questions/46687645/upgrade-postgresql-from-9-6-to-10-0-on-ubuntu-16-10

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update

sudo apt-get install postgresql-9.6


Ascii Characters Removal in python:
-----------------------------------
Ref : https://stackoverflow.com/questions/9942594/unicodeencodeerror-ascii-codec-cant-encode-character-u-xa0-in-position-20/9942822

yourstring = yourstring.encode('ascii', 'ignore').decode('ascii')


How to Install Wkhtmltopdf 12.4 with patched Qt?
------------------------------------------------
Ref: https://gist.github.com/kai101/99d57462f2459245d28b4f5ea51aa7d0

    Current version of apt-get wkhtmltopdf does not come with Qt patch. There are some issue going with both Qt patched and non-patched.
    Most common use case is compatible with the patched Qt.

    ```
    wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
    tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
    sudo mv wkhtmltox/bin/wkhtmlto* /usr/local/bin 
    sudo apt-get install -y openssl libssl-dev libxrender-dev libx11-dev libxext-dev libfontconfig1-dev libfreetype6-dev fontconfig
    ```

    ## Fixing Wkhtmltopdf SSL error ##
    ### ubuntu 17.10 ###
    ```
    sudo apt-get install libssl-dev=1.0.2g-1ubuntu13.3 openssl=1.0.2g-1ubuntu13.3
    ```
    ### ubuntu 17.04 ###
    ```
    # end of life, forget   it.
    ```

    ### ubuntu 16.04 ###
    ```
    sudo apt-get install libssl1.0.0=1.0.2g-1ubuntu4.10 libssl-dev=1.0.2g-1ubuntu4.10 openssl=1.0.2g-1ubuntu4.10
    ```
    
 What are the ports open in server?
 ----------------------------------
    
    sudo netstat -ltpn
 
Install SSL with NGINX ubuntu?
-----------------------------
    https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

Postgres Server Error, connection refused error:
------------------------------------------------
    Error:
    OperationalError: could not connect to server: Connection refused
	Is the server running on host "localhost" (127.0.0.1) and accepting
	TCP/IP connections on port 5432?

    ubuntu@ip-123-34-54-321:~$ tail /var/log/postgresql/postgresql-9.5-main.log
    2018-08-27 01:42:33 UTC [7680-1] FATAL:  could not remove old lock file "postmaster.pid": Permission denied
    2018-08-27 01:42:33 UTC [7680-2] HINT:  The file seems accidentally left over, but it could not be removed. Please              remove the file by hand and try again.
    
    Solution:
    We need to change permission of postgres main folder:
    Before : 
        dr-x------ 19 postgres postgres 4096 Aug 21 09:40 /var/lib/postgresql/9.5/main
    After:
        sudo chmod -R 700 /var/lib/postgresql/9.5/main/
        drwx------ 19 postgres postgres 4096 Aug 21 09:40 /var/lib/postgresql/9.5/main

PostgreSQL - Date extract -Month start date and Month end date
------------------------------------------------------------
	SELECT date_trunc('MONTH',now())::DATE as month_start_date,(date_trunc('MONTH', now()) + INTERVAL '1 MONTH - 1 day')::DATE as month_end_date;

PostgreSQL - Date extract -YTD start date and Month end date(2018-07-01,2019-06-30)
------------------------------------------------------------
	select concat(date_part('YEAR', now()),'-07-01'),concat(date_part('YEAR', now())+1, '-06-30');
	
ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:726) - In xmlrpc
-------------------------------------------------------------------------------------
	#Add Following line at top of the program
	import ssl
	ssl._create_default_https_context = ssl._create_unverified_context

PostgreSQL - change timezone convertion example
-----------------------------------------------
ref:https://popsql.io/learn-sql/postgresql/how-to-convert-utc-to-local-time-zone-in-postgresql/
	select 
	sum(sp.line_count)
	from stock_picking sp
	where 
		(sp.date_done at time zone 'utc' at time zone 'AEDT') >= TO_TIMESTAMP(now()::DATE || ' 00:00:00','YYYY-MM-DD HH24:MI:SS')
		and (sp.date_done at time zone 'utc' at time zone 'AEDT') <= TO_TIMESTAMP(now()::DATE || ' 23:59:59','YYYY-MM-DD HH24:MI:SS')
