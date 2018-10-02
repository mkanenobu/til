#!/bin/bash
today=`date +%y%m%d`
backupdate=""
ls /media/mika/TRANSCEND/backup_ubuntu/ \
    | sed -e "s/backup.tar.gz/""/" \
#   | if test $today -gt ;then
#       echo "OK" 
#   else
#       echo "NG"
#   fi
