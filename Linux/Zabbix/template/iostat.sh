#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-25
# Description:	

DEVICES=`iostat | awk '{ if ($1 ~ "^([sh]d[a-z])$") { print $1 } }'`

COUNT=`echo "$DEVICES" | wc -l`
INDEX=0
echo '{"data":['
echo "$DEVICES" | while read LINE; do
    echo -n '{"{#DEVNAME}":"'$LINE'"}'
    INDEX=`expr $INDEX + 1`
    if [ $INDEX -lt $COUNT ]; then
        echo ','
    fi
done
echo ']}'
