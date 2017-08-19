#!/bin/sh

# create the name file
NAME_FILE=backup-$(date "+%b_%d_%Y_%H.%M.%S").zip

# variables
STORAGE=/opt/storage
TO_BACKUP=/opt/backups
TO_BACKUP_SAFE=/opt/backups-safe

# zipping recursive
zip -r $TO_BACKUP/$NAME_FILE $STORAGE/

# setting permissions
chmod +x $TO_BACKUP/$NAME_FILE
chmod +x $TO_BACKUP_SAFE/$NAME_FILE

# copying to backups-safe folder
cp $TO_BACKUP/$NAME_FILE $TO_BACKUP_SAFE

# -mtime +15 // days
# -mmin +5 // minutes
# find $TO_BACKUP -mtime +15 -exec rm -rf  "{}" \;
# find $TO_BACKUP_SAFE -mtime +15 -exec rm -rf  "{}" \;

find $TO_BACKUP -mmin +2 -exec rm -rf  "{}" \;
find $TO_BACKUP_SAFE -mmin +2 -exec rm -rf  "{}" \;


# SAMBA
# https://bayton.org/docs/linux/ubuntu/set-up-samba-ubuntu-12-04/