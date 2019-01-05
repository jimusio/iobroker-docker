#!/bin/sh

cd /opt/iobroker

while [ 1 ]
do
    sleep 600
    ./iobroker backup >/opt/scripts/auto_backup_iobroker_log.txt 2>&1
    # Delete old backups (delete all "*backupiobroker.tar.gz" files in the folder that are older than 30 days per "rm")
    find -P "backups/" -maxdepth 1 -type f \( -name '*backupiobroker.tar.gz' \) -ctime +30 -exec rm {} \;
done
