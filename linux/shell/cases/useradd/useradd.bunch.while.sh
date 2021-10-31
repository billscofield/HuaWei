#!/usr/bin/bash
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	Used for debian/ubuntu to add bunch of users

while true;do
    read -p "请输入用户前缀|数目|密码: " User_Prefix User_Num User_Pass

    if [[ ! $User_Num =~ ^[0-9]+$ ]];then
        echo "ERROR"
    else
        if [[ $User_Prefix =~ ^[0-9]+.* ]];then
            echo "Prefix Cannot start with NUMBER"
        else
            # 添加帐号和密码
            for i in `seq $User_Num`;do
                User_Name=${User_Prefix}${i}
                useradd -m -s /bin/sh $User_Name &>/dev/null
                if [ $? -eq 0 ];then
                    echo "添加用户${User_Name}成功"
                else
                    echo -e "\033[31m添加用户${User_Name}失败\033[0m"
                fi
                
                # 添加密码
                echo $User_Name:$User_Pass | chpasswd &>/dev/null
                if [ $? -eq 0 ];then
                    echo "添加用户${User_Name}密码成功"
                else
                    echo -e "\033[31m添加用户${User_Name}密码失败\033[0m"
                fi
            done
        fi
    fi
done


