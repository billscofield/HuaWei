#!/bin/bash
# Author:	Bill Scofield 
# Ctime:	2021-02-18
# Author:	Bill Scofield 
# Description:	


#Prompt_message="Command action\nh 显示命令帮助\nf 显示磁盘分区\nd 显示磁盘挂载\nm 查看内存使用\nu 查看系统负载\nq 退出程序"

caidan(){
cat <<END
=====================
h 显示命令帮助
f 显示磁盘分区
d 显示磁盘挂载
m 查看内存使用
u 查看系统负载
q 退出程序
=====================
END
}

caidan

while true;do

    read -p "Plz input ur choice: " users_choice

    sleep 0.5

    case $users_choice in 
        h)
            echo "--------------------h"
            ;;
        f)
            lsblk
            ;;
        d)
            df -h
            ;;
        m)
            free -m
            ;;
        u)
            uptime
            ;;
        q)
            break
            ;;
        *)
            echo "--------------------*"
            sleep 2
            ;;
    esac

done

