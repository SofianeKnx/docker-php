#!/bin/bash

if [[ $MAILS_DOMAIN ]] && [[ $MAILS_USER ]] && [[ $MAILS_TOKEN ]]; then

# set reasonable defaults

SMTP_PORT=${MAILS_PORT:-25}
SMTP_HOST=${MAILS_HOST:-mails}
SMTP_FROM=${MAILS_FROM:-$MAILS_USER@$MAILS_DOMAIN}

conf="
defaults
auth           plain
tls            off
logfile        /var/log/msmtp.log

account        factory
host           $SMTP_HOST
port           $SMTP_PORT
from           $SMTP_FROM
user           $MAILS_USER
password       $MAILS_TOKEN

# Set a default account
account default : factory
"

echo "$conf" > "${MSMTPRC_DESTINATION:-/etc/msmtprc}"

fi
