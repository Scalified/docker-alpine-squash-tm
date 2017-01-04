#!/bin/sh

SOURCE_DIR=$SQUASH_TM_DIR
BACKUP_DATA=data
BACKUP_DIR=$SQUASH_TM_BACKUP_DIR
FILE_NAME=$(date +"%d-%m-%Y").tar.gz
DAYS_TO_KEEP=7

echo [INFO]: "Started $SOURCE_DIR backup to $BACKUP_DIR/$FILE_NAME"
tar -zcf $BACKUP_DIR/$FILE_NAME -C $SOURCE_DIR $BACKUP_DATA
echo [INFO]: "Successfully backed up data"

echo [INFO]: "Cleaning up data older than $DAYS_TO_KEEP day(s)"
find $BACKUP_DIR -mtime +7 -exec rm {} \;
echo [INFO]: "Successfully cleaned"
