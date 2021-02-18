links:

    https://www.bilibili.com/video/BV1f5411E7Vy?p=20&t=13

### && || 

ping -W2 -c1 $1 && echo -e "\033[31mThe network to $1 is ok\033[0m" || echo -e "\033[31mErrors occurs while connecting to $1 \033[0m"


### 加载另一个shell脚本中的变量

```file1.sh
name=liujiao
```

```file2.sh
source ./file1.sh   或  . ./file1.sh
echo $name
```


### 

```
ping -W2 -c1 $1>/dev/null

if [ $? -eq 0 ];then
    echo "the target $1 is \033[32mreachinable\033[0m"
else
    echo "\033[31merror\033[0m while connecting to $1"
fi

```


---


```

read -p "Plz input a website:" ip

ping -W2 -c1 $ip>/dev/null

if [ $? -eq 0 ];then
    echo "the target $1 is \033[32mreachinable\033[0m"
else
    echo "\033[31merror\033[0m while connecting to $1"
fi

```

---


```
if [ $# -eq 0 ];then
    echo "echo "Usage: /etc/init.d/networking {start|stop|reload|restart|force-reload}"
elif [ $# -eq 1 ];then
    echo 'ok'
fi
```


--- 字符串变量的执行,以及$的转义

```
a="df -h | awk 'NR==2' | awk '{print \$(NF-1)}'"        //$ 要加转义

echo $a | sh

--- -x debug参数

practice echo $a | sh -x
+ df -h
+ awk NR==2
+ awk {print $(NF-1)}
18%

```




```
ip={1:-z.cn}
count=1

while [ $count -le 3 ];do       //[] 和内容之间必须有空格
    if [ $? -eq 0 ];then
        echo "$ip is up"
        break
    fi
    let count++
done

./c.sh                          //相当于$1没有使用1=, 所以 :- 和 - 都可以

```


```磁盘使用率
df -h | awk 'NR==2{print $(NF-1)}' | awk -F '%' '{print $1}'

diskUsage=$(df -h | awk 'NR==2{print $(NF-1)}' | awk -F '%' '{print $1}')

if [ $diskUsage -gt 30 ];then
    echo "Disk is ${diskUsage}%">>/log/diskUsage.log
fi

```


打印当前系统版本

    System=$(hostnamectl | grep System)

内核

    Kernel=$(hostnamectl | grep Kernel)

虚拟平台

    Vt=$(hostnamectl | grep Virtualization)

静态主机名

    Static_Hostname=$(hostnamectl | grep "Static hostname" | awk -F':' '{print $2}')
    Static_Hostname=$(hostnamectl | grep "Static hostname" | awk -F: '{print $2}')

动态主机名

    DomainHostname=$(hostnamectl | grep "Transient")

CPU负载

    load1=uptime | awk '{print $(NF-2)}' | awk -F, '{print $1}'
    load5=uptime | awk '{print $(NF-1)}' | awk -F, '{print $1}'
    load15=uptime | awk '{print $NF}' | awk -F, '{print $1}'
    load15=uptime | awk '{print $NF}'



根分区
    df -h | grep "/$"
    df -h | grep -e "/$"



检测centos7 能否上网，如果可以，则更换yum源

```
ping -W2 -c1 z.cn &>/dev/null

if [ $? -eq 0 ];then
    echo "Internet is ok"

    yum install -y wget &>/dev/null

    if [ $? -eq 0 ];then
        echo "YUM is ok"
    else
        rm -rf /etc/yum.repos.d/Centos-Base.repo
        wget -O /etc/yum.repos.d/CentOS-Base.repo     http://mirror.aliyun.com/repo/Centos-7.repo &>/dev/null
    fi

    echo "-------------------安装httpd---------------------"
    Httpd_install=$(rpm -q httpd | wc -l)

    if [ $Httpd_install -eq 0 ];then
        yum install httpd -y &>/dev/null
    else
        echo "已经安装过了"
    fi

    if [ $? -eq 0 ];then
        systemctl restart httpd
        Service_stat=$(systemctl status httpd | grep ...)
    fi
fi
```

批量添加用户

```

```



安装Apache/nginx

1. 网络
1. yum
1. 安装、启动

```

ping -W5 -c1 z.cn

if [ $? -ne 0 ];then
    echo "network error"
fi

yum_repo=$(yum repolist | grep nginx | wc -l)

if [ $yum_repo -eq 0 ];then
    cat > /etc/yum.repos.d/nginx.repo <<-EOF
    [nginx]
    name=nginx repo
    baseurl=http://ngxin.org/packages/centos/7/\$basearch/
    gpgcheck=0
    enabled=1
    EOF
    yum makecache
else
    echo "不知道什么错误"
fi


if [ $yum_repo -eq 1 ];then
    yum install nginx -y &>/dev/null
    Install_nginx=$(rpm -q nginx | wc -l)
    if [ $Install_nginx -eq 1 ];then
        echo "安装成功"   
fi

systemctl start nginx &>/dev/null
if [ $? -eq 0 ];then
    echo "Nginx 启动完毕"
    Nginx_status=$(systemctl status nginx | grep Active | awk '{print $1 $2}')
    echo "Nginx 当前状态 ${Nginx_status}"
else
    pkill -9 httpd &>/dev/null
    pkill -9 nginx &>/dev/null
    systemctl restart nginx
    if [ $? -eq 0 ];then
        echo "重启成功"
    else
        echo "重启失败"
    fi
fi



```

