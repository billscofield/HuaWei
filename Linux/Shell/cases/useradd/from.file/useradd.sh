#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

cat <<END
================================
    使用方法：

    ./useradd.sh 用户名文件
    
================================
END

read -p "当用户名已存在时是否删除(yes/no)" del_used_user

for i in $(cat $1);do

    # 判断是否已经存在

    id $i &>/dev/null

    # 用户已存在
    if [ $? -eq 0 ];then
        # 是否删除用户以重新添加
        case $del_used_user in
            y|yes|Y|YES)
                userdel -r $i &>/dev/null
                if [ $? -ne 0 ];then
                    echo -e "\033[31m删除用户失败\033[0m"
                else
                    useradd -m $i
                    if [ $? -eq 0 ];then
                        echo "添加用户 $i 成功"
                    fi
                fi
                ;;
            n|no|N|NO)
                ;;
        esac
    else
        useradd -m $i
        if [ $? -eq 0 ];then
            echo "添加用户 $i 成功"
        fi
    fi
done
