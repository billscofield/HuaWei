#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-28
# Description:	

work_dir='/mnt/temp/farmdata/'
temp_dir="${work_dir}/tempcal"

if [ ! -e $temp_dir  ];then
    mkdir $temp_dir
else
    echo "文件夹已经存在"
fi


# 获取所有ip日志文件
ips=$(ls -l ${work_dir} | grep -v '^total' | awk '{print $NF}' | egrep '^10')


# 分析每个日志文件，提取 distinct 内容, 至子目录同名新文件
for ip in $ips;do
    # distinct_row_file will be stored in temp_dir
    cat $ip | grep -v '^20' | grep -v '^---' | sort -u > ${temp_dir}/$ip
done

