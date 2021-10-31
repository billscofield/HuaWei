
## 查看版本

cat /etc/apline-release


## 软件包管理

apk

1. 更换清华大学源

    sed -i 's/dl-cdn.alpinelinux.org/mirror.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

2. 更新索引
    
    apk update 

    从远程镜像源中更新本地镜像源索引，update命令会从各个镜像源列表下载
    APKINDEX.tar.gz并存储到本地缓存，一般在/var/cache/apk/(Alpine在该目录下)、
    /var/lib/apk/ 、/etc/apk/cache/下

3. 安装包

    add：命令从仓库中安装最新软件包，并自动安装必须的依赖包,也可以从第三方仓库
    添加软件包。add:安装PACKAGES并自动解决依赖关系。

    apk add openssh openntp vim
    apk add --no-cache mysql-client
    apk add docker --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.4/main/ --allow-untrusted

    安装指定版本软件包
    apk add asterisk=1.6.0.21-r0
    apk add 'asterisk<1.6.1'
    apk add 'asterisk>1.6.1

4. 卸载

    del：卸载并删除PACKAGES
    apk del openssh openntp vim

5. 升级

    upgrade命令升级系统已安装的所以软件包（一般包括内核），当然也可指定仅升级部分软件包（通过-u或–upgrade选择指定）。
    apk update #更新最新本地镜像源
    apk upgrade #升级软件
    apk add --upgrade busybox #指定升级部分软件包

6. 搜索

    search命令搜索可用软件包，-v参数输出描述内容，支出通配符，-d或–description参数指定通过软件包描述查询。
    apk search #查找所以可用软件包
    apk search -v #查找所以可用软件包及其描述内容
    apk search -v 'acf*' #通过软件包名称查找软件包
    apk search -v -d 'docker' #通过描述文件查找特定的软件包

7. 查看包信息

    info命令用于显示软件包的信息。
    apk info #列出所有已安装的软件包
    apk info -a zlib #显示完整的软件包信息
    apk info --who-owns /sbin/lbu #显示指定文件属于的包

## 



## 更新时区

1. 安装 timezone 数据包

    apk add -U tzdata

2. 拷贝需要的时区文件到localtime，国内需要的是Asia/Shanghai：

    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

3. 验证时区

    date

    CST 即为中国标准时间

4. 移除时区文件

    为了保证容器的精简和轻量，移除下载的时区文件。

    apk del tzdata

重启两边 zabbix-appliance, 时钟的时间更改为 server 后可以了, 但是数据的时间还是错位的

虽然 mysql 的也是 server 的

最后找到 /etc/php7/conf.d/99-zabbix.ini

date.timezone=Europe/Riga 修改为 Asia/Shanghai

然后 kill 掉 php-fpm7 的process id, 重新运行 /usr/sbin/php-fpm7 即可

退出容器，重启容器后，发现修改会被覆盖，因此只能重新进入容器，再次修改上述文件，
然后kill掉所有php-fpm7的进程后，再进入 /usr/sbin/目录下运行./php-fpm7刷新页面后
时区生效，时间显示正确

不知道为什么...



## 服务管理

### 安装 rc-service 服务

Alpine使用的是OpenRCinit系统，而rc-service是openrc的一部分，所以安装openrc即可，
使用如下命令安装：

    ` apk add openrc --no-cache

### 添加自定义服务

vim /etc/init.d/xxx

```
#!/sbin/openrc-run

name="actc"
command="/path/to/${name}"
#command_background="yes"

depend() {
    after sshd
}

```

alpine 的 zabbix-appliance 没有这个服务，看了linux系统的systemctl 配置文件,
restart 就是kill掉,然后启动


