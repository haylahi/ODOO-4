#!/usr/bin/python
import os
import time
import sys

try:
    import smtplib
except ImportError:
    raise ImportError(
        'This module needs smtplib to sending mails. Please install smtplib on your system. (sudo pip install smtplib)')

file_name = sys.argv[1]
local_db_backup_path = sys.argv[2]


def hbytes(num):
    for x in ['bytes', 'KB', 'MB', 'GB']:
        if num < 1024.0:
            return "%3.1f %s" % (num, x)
        num /= 1024.0
    return "%3.1f %s" % (num, 'TB')


# Email Function and Configuration
def send_mail(option, file_size):
    if option:
        sender = 'FROMMAIL'
        email_password = 'FROMMAIL_PASSWORD'
        receivers = ['email1', 'email2']
        # cc_list = ['email3', 'email4']
        # bcc_list = ['email5', 'email6']
        # receivers = receivers + cc_list + bcc_list
        subject = 'RMCL | ODOO Database Backup Alert'

        header = 'From: <%s>' % sender
        header += '\nTo: <%s' % '>, <'.join(receivers) + '>'
        # header += '\nCc: <%s' % '>, <'.join(cc_list) + '>'
        # header += '\nBcc: <%s' % '>, <'.join(bcc_list) + '>'
        header += '\nMIME-Version: 1.0\nContent-type: text/html'
        header += '\nSubject: %s' % subject + "\n"

        message = '<br>Database Backup Successfully.<br><b>File Name: ' + file_name + '</b><br><b>File Size: ' + file_size + '</b>'

        message = header + message
        try:
            server = smtplib.SMTP('smtp.gmail.com', 587)
            server.starttls()
            server.login(sender, email_password)
            # print time.strftime('%Y-%m-%d %H:%M:%S'), " " + subject + " Email Sending...\n"
            server.sendmail(sender, receivers, message)
            # print '-' * 50
            # print message
            # print '-' * 50 + '\n'
            # print time.strftime('%Y-%m-%d %H:%M:%S'), " " + subject + " Email Successfully Sent"
            print "True"
        except:
            # print time.strftime('%Y-%m-%d %H:%M:%S'), " Error: unable to send email"
            print "False"
    return

# Call send_mail Function
send_mail(True, str(hbytes(os.stat(local_db_backup_path).st_size)))