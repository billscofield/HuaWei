#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

clear 

cat <<END
================================
    使用方法：

    ./userdel.sh 用户名文件
    
================================
END

for i in $(cat $1);do

    id $i &>/dev/null

    # 用户存在
    if [ $? -eq 0 ];then
        userdel -r $i &>/dev/null
        if [ $? -eq 0 ];then
            echo "$i 删除成功"
        else
            echo -e "\033[31m$i 删除失败\033[0m"
        fi
    else
        echo -e "\033[31m不存在用户 $i 无法进行删除\033[0m"
    fi

done
