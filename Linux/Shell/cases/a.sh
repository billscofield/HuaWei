#!/usr/bin/bash
# Author:	Bill Scofield 
# Ctime:	2021-02-18
# Author:	Bill Scofield 
# Ctime:	2021-02-18
# Description:	


# 1. 获取ip

>ip.txt

for i in {1..10};do

    ip=192.168.1.$i

    {
    ping -W1 -c1 $ip &>/dev/null

    if [ $? -eq 0 ];then
        echo $ip >> ip.txt
    fi
    }&
done

    wait
    echo "Get ip done"


# 2. 生成本机秘钥

if [ -f ~/.ssh/id_rsa ];then
    ssh-keygen -P "" -f ~/.ssh/id_rsa
fi

# 3. 批量分发秘钥

while read line;do
    /usr/bin/expect <<END

    set timeout 4

    spawn ssh-copy-id -i ~/.ssh/id_rsa.pub root@$line

    expect{
        "yes/no" {send "yes\r"; exp_continue}
        "password:" {send password\r}
    }
END
done<ip.txt
