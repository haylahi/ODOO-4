# odoo
Odoo Refferences

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
https://gist.github.com/kai101/99d57462f2459245d28b4f5ea51aa7d0
