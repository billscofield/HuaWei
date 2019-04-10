rsync --version

scp 无法备份大量数据，类似windows的复制
    rsync=变量复制，边统计，边比较

可以镜像保存整个目录树和文件系统
可以保存原来的文件的权限，时间，硬链接等
无需特殊权限即可安装
第一次同步时会复制全部内容，但下一次只传输修改过的文件
支持压缩传输，
可以使用scp,ssh等方式进行传输文件，也可以通过直接的socket连接
支持匿名传输，以方便进行网站镜像
选择性保持，符号链接，硬链接，文件属性，权限，时间等

完整备份
    每次都是从备份源将所有的文件或目录备份到目的地
差异备份
    备份上次完全备份以后有变化的数据（他针对的是上次的完全备份，他备份过程中不清除存档） 
增量备份
    备份上次备份以后有变化的数据（有变化的就备份，他会清除存档属性） 

C/S 模式,[就是点到点的传输，直接使用rsync命令]
端口 873
    

发起端：负责发起rsync同步操作的客户机，通知服务器，我要备份你的数据
备份端：负责响应客户机rsync同步操作的服务器，需要备份的服务器
服务端：运行rsync服务，需要备份的服务器
客户端：存放备份的数据


同步方式，推/拉
    推 push：一台主机负责把数据传送给其他主机，服务器开销较大，比较适合后端服务器少的情况
        目的主机配置为rsync服务器，源主机周期性的使用rsync命令把要同步的目录推过去
    拉 pull：所有主机定时去找主机拉取数据，可能会导致数据缓慢
        源主机配置为rsync服务器，目的主机周期性的使用rsync命令把要同步的目录拉过来

    [img](../materials/rsync.png)

    主服务器推几个，然后客户端去拉取

   使用rsync来同步是先通过 xineted 监听873端口，如果rsync进来的是873端口，xineted就会通知它所管辖内的rsync服务来做出回应，接下来就是rsync俩服务之间的通讯 

## 安装

apt install rsync
    // apt install xineted  : Unable to locate package xineted

## 配置

https://blog.csdn.net/zpf336/article/details/51659666

/etc/init.d/rsync
    RSYNC_ENABLE=true

到底哪个才是呢？

此时 service rsync start 发现错误，执行下面的语句
    修改配置文件
    cp /usr/share/doc/rsync/examples/rsyncd.conf /etc   #已默认安装的软件，默认不启动的似乎都要这么做

    netstat -antup | grep rsync
        -t tcp
        -u udp
        -p program




## 命令使用
rsync 和 scp 很相似
    -a, --archive archive mode  //权限保存模式 相当于 -rlptgoD
    -r, --recursive             //递归，复制下面的所有资料
    -p, --perms                 //保留档案权限，文件原有属性
    -t, --times                 //保留时间点，文件原有时间
    -g, --group                 //保留原有属组
    -o, --owner                 //保留档案所有者(root only)
    -D, --devices               //保留devices咨询(root only)
    -l, --links                 //复制所有连接，拷贝链接文件
    -z, --compress              //压缩模式，当资料在传送到目的端进行档案压缩， -azP
    -H, --hard-lins             //保留硬链接文件
    -A, --acls                  //保留acl属性文件，需要配合 --perms
    -P, 参数和--partial --progress 相同，
    --version
    -v, --verbose
    -u, --update                //仅仅进行更新，也就是跳过已经存在的目标位置，并且文件时间要晚于要备份的文件，不覆盖新的文件
    --port                      //指定端口，默认为873
    --delete                    //删除那些目标位置有的文件  而备份源没有的文件
    --password-file             //从file中得到密码
    --bwlimits=KBPS             //限制带宽
    --filter  "file"            //需要过滤的文件
    --exclude=filename          //需要过滤的文件
    --progress                  //显示备份过程


## 案例

备份 /var/www/html 目录,创建用户rget1用于下载，读；创建用户rput1用于上传，写；

useradd rget1
useradd rput1
passwd rget1
passwd rput1

指定rput1对/var/www/html 有读和写的权限
    setfacl -R -m user:rput1:rwx /var/www/html/
    getfacl /var/www/html

指定rget1用户权限rwx
    setfacl -R -m user:rget1:rwx /var/www/html/
    
默认权限
    setfacl -R -m default:user:r-x /var/www/html/


cp -r /boot/grub/ /var/www/html/
mkdir /data

rsync -azP --delete rget1@192.168.1.1:/var/www/html/ /data/
    报错的可能是权限不足,对这个文件没有读权限
    chmod 744 /var/www/html/grub.conf












