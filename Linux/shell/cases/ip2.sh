#!/usr/bin/bash
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

for i in {1..193}
do
    ( ping -c1 -i0.2 -w1 172.16.30.$i &>/dev/null
    if ((  $?==0  ))
    then
            echo "172.16.30.$i up"    >>2.txt
    else
            echo "172.16.30.$i down"    >>3.txt
    fi )&    --》这样就把这一段放到后台去执行了，大大加快了速度。
done
sleep 2
live_pc_num=`cat 2.txt|wc -l`
down_pc_num=`cat 3.txt|wc -l`
echo "there are $down_pc_num is down"
echo "there are $live_pc_num is up"
echo "list:"
cat 2.txt
rm -rf 2.txt 3.txt


