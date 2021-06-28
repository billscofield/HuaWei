#!/bin/bash
for((i=1;i<=10;i++))
do
    useradd jerry$i
    password=`openssl rand -base64 8 | cut -c 1-9`
    echo jerry$i:jerry$i | chpasswd
    echo jerry$i:$password >> ./userinfo.txt
done
