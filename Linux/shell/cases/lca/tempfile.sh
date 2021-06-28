#/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-26
# Description:	

work_dir='/mnt/temp/farmdata/'
temp_dir="${work_dir}/tempcal"

if [ ! -e $temp_dir ];then
    mkdir $temp_dir
fi


# 获取所有ip日志文件
ips=$(ls -l ${work_dir} |grep -v '^total' | awk '{print $NF}' | egrep '^10')


# 分析每个日志文件，提取 distinct 内容, 至子目录同名新文件
for ip in $ips;do
    distinct_row_file=$(cat $ip | swort -u > ${temp_dir}/$ip)
done
