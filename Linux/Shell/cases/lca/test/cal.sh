#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-26
# Description:	

temp_dir='/git/huawei/Linux/Shell/cases/lca/test'
echo "temp_dir: ${temp_dir}"

ips_new=$(ls -l ${temp_dir} | grep -v '^total' | awk '{print $NF}' | egrep '^10')

# i 是 ip 文件
for i in $ips_new;do

    # 打印 ip 文件名称
    echo "IP $i"

    # ip文件的绝对路径
    file_to_cal="${temp_dir}/${i}"

    # 要计算的ip日志文件中的 文件大小
    for i in $(cat $file_to_cal);do
        echo $(du -hs $i) > "${temp_dir/res-${i}}"
    done
done

