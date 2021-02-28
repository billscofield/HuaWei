#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-28
# Description:	

temp_dir='/mnt/temp/farmdata/tempcal/'

ips_new=$(ls -l ${temp_dir} | grep -v '^total' | awk '{print $NF}' | egrep '^10')

# i 是 ip 文件
for i in $ips_new;do

    # 打印 ip 文件名称
    echo "IP $i"

    # ip文件的绝对路径
    file_to_cal="${temp_dir}${i}"
    echo "绝对路径: $file_to_cal"

    # 要计算的ip日志文件中的 文件大小
    for j in $(cat $file_to_cal);do
        echo $(du -hs $j) >> "${temp_dir}final/$i"
        #echo "${temp_dir}final/$i"
    done
done

