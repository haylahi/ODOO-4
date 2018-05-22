# odoo
Odoo Refferences

Ascii Characters Removal in python:
-----------------------------------
Ref : https://stackoverflow.com/questions/9942594/unicodeencodeerror-ascii-codec-cant-encode-character-u-xa0-in-position-20/9942822

yourstring = yourstring.encode('ascii', 'ignore').decode('ascii')
