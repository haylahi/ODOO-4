# odoo
Odoo Refferences

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


Ascii Characters Removal in python:
-----------------------------------
Ref : https://stackoverflow.com/questions/9942594/unicodeencodeerror-ascii-codec-cant-encode-character-u-xa0-in-position-20/9942822

yourstring = yourstring.encode('ascii', 'ignore').decode('ascii')


How to Install Wkhtmltopdf 12.4 with patched Qt?
------------------------------------------------
https://gist.github.com/kai101/99d57462f2459245d28b4f5ea51aa7d0
