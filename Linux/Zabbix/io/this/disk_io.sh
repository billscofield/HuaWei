#!/bin/bash
Disk=$1
Option=$2
case $Option in
rrqm)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $2}'
    ;;
wrqm)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $3}'
    ;;
rps)
    iostat -dxk |grep "\b$Disk\b"|tail -1|awk '{print $4}'
    ;;
wps)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $5}'
    ;;
rKBps)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $6}'
    ;;
wKBps)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $7}'
    ;;
avgrq-sz)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $8}'
    ;;
avgqu-sz)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $9}'
    ;;
await)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $10}'
    ;;
svctm)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $11}'
    ;;
util)
    iostat -dxk |grep "\b$Disk\b" |tail -1|awk '{print $12}'
    ;;
esac
