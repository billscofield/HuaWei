links:

    https://www.cnblogs.com/yanjieli/p/11016825.html

    https://www.magedu.com/74273.html

    https://www.jianshu.com/p/025c2cef84e0

## cobbler

[ˈkɒblə(r)]  补鞋匠；工匠

关闭防火墙
关闭 selinux

yum install -y epel-release
yum -y install cobbler dhcp tftp-server pykickstart httpd cobbler-web xinetd



/etc/cobbler/settings
    next_server: 192.168.197.175    //cobbler dhcp以及pxe server ip
    server: 192.168.197.175         //cobbler server
    manage_dhcp: 1                  //开启dhcp
    default_password_crypted:       //设置安装系统后的管理员密码
        openssl passwd -1 -salt passwd mycobbler
            passwd    Generation of hashed passwords.

        sslpasswd(openssl passwd)
            
            -crypt
                UNIX标准加密算法，此为默认算法。如果加盐(-salt)算密码，只取盐的
                前2位，2位后面的所有字符都忽略。
            
            -1  Use the MD5 based BSD password algorithm 1.
            
            -salt string
                Use the specified salt.  When reading a password from the
                terminal, this implies -noverify.
            



systemctl restart httpd.service
systemctl restart cobblerd.service


配置 dhcp
    
    /etc/dhcp/dhcpd.conf
    配置的虚拟机网卡和dhcpd.conf的网段要一致否则服务启动失败
    systemctl start dhcpd



cobbler check

yum -y install fence-agents


centos7 内存不要小于2G


配置 web 的用户名和密码
    方法一:
        htdigest [ -c  ] passwdfile realm username
        ```
        htdigest -c /etc/cobbler/users.digest "Cobbler" cobweb         // cobweb 是用户名
        https://10.0.6.140/cobbler_web
        systemctl restart cobblerd.service
        systemctl restart httpd.service
        ```

    方法二: PAM 认证
    ```
    vim /etc/cobbler/modules.conf
    module = authn_pam  '//修改pam认证'
    module = authz_ownership    '//在users.conf指定访问权限'
    useradd webuser
    passwd webuser
    vim /etc/cobbler/users.conf
    [admins]
    admin = “”
    cobbler = “”
    webuser = “”    '//添加'
    systemctl restart cobblerd.service
    systemctl restart httpd.service
    ```


collber 日志

    /var/log/cobbler/cobbler.log

导入iso镜像文件

    mount -t iso9660 -o loop /centos.iso /mnt

    cobbler import --path=/mnt --name=CentOS-7-x86_64 --arch=x86_64
        --kickstart=KICKSTART_FILE
        --path=镜像路径
        --name=安装引导名
        --arch=32位或64位,x86，x86_64,ia64

    如果遇到如下错误，执行 cobbler signature update
        No signature matched in /var/www/cobbler/ks_mirror/fedora19-x86_64 !!! TASK FAILED !!!

    /var/www/cobbler/ks_mirror/CentOS-7-x86_64  '//默认导入存放位置'

    cobbler list                        //查看导入结果
    cobbler distro list                 //查看发行版本
    tree /var/lib/tftpboot/images       //查看内核和初始化文件在tftp server 共享目录
    cobbler profile list
    cobbler profile report              //查看要修改的镜像默认使用的自动安装文件
    cobbler profile report --name=Centos7-1810-x86_64
    /var/lib/cobbler/kickstarts/sample_end.ks    //ks默认文件存放位置

    添加自定义的文件

        cobbler profile add --name=centos6.6-x86_64 --distro=centos6.6-x86_64 --kickstart=/var/lib/cobbler/kickstarts/centos6.6-x86-64.ks

        cobbler repo add --name=centos-7-base --mirror=http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/ --arch=x86_64 --breed=yum
        cobbler reposync        //同步yum源
        cobbler sync            //每次修改profile都需要同步


    cobbler setting edit --name=server --value=10.0.0.42
    cobbler setting edit --name=next_server --value=10.0.0.42
    cobbler setting edit --name=default_password_crypted --value='$1$a9fd9e61$utZcTBQcN.ClUyLsm7RF90'
    cobbler setting edit --name=manage_dhcp --value=1


cobbler删除distro

    正确的方式：

    cobbler profile remove --name=centos6.7-x86_64
    cobbler distro remove --name=centos6.7-x86_64


使用 ksvalidator 工具可以检查kickstart的文件格式是否有语法错误，来自于 pykickstart 包
    ksvalidator ks文件



为了运维的标准化，修改Cobbler Kernel Options，让网卡名由类似ens33这种命变为eth0
    cobbler profile edit --name=CentOS-7.2-x86_64 --kopts='net.ifnames=0 biosdevname=0'


自定义cobbler安装系统菜单界面 (注意不能用中文标题哦。)
    vim /etc/cobbler/pxe/pxedefault.template
    MENU TITLE Cobbler | 


## cobbler主要命令

cobbler check #检查cobbler配置 主要用于检查cobbler配置是否有错
cobbler sync #同步配置到dhcp pxe和数据目录 更改某些配置后记得执行一下，同步一下配置。
cobbler list #列出所有的cobbler元素
cobbler import #导入安装的系统光盘镜像
cobbler report #列出各元素的详细信息
cobbler distro #查看导入的发行版系统信息 不但可以查看导入的发行版系统信息还可以增加与修改等
cobbler profile #查看配置信息 不但可以查看Kickstart文件而且还可以编辑与删除此文件
cobbler system #查看添加的系统信息
cobbler reposync #同步yum仓库到本地 同步远程的yum源到本地
cobbler signature update
cobbler --help #获得cobbler的帮助
cobbler distro --help #获得cobbler子命令的帮助

## Cobbler配置文件目录：/etc/cobbler

1. /etc/cobbler/settings #cobbler主配置文件

/etc/cobbler/dhcp.template #DHCP服务的配置模板
/etc/cobbler/tftpd.template #tftp服务的配置模板
/etc/cobbler/rsync.template #rsync服务的配置模板
/etc/cobbler/iso #iso模板配置文件
/etc/cobbler/pxe #pxe模板文件
/etc/cobbler/power #电源的配置文件
/etc/cobbler/users.conf #Web服务授权配置文件
/etc/cobbler/users.digest #用于web访问的用户名密码配置文件
/etc/cobbler/dnsmasq.template #DNS服务的配置模板
/etc/cobbler/modules.conf #Cobbler模块配置文件

2. Cobbler数据目录：/var/lib/cobbler

/var/lib/cobbler/config #配置文件
/var/lib/cobbler/triggers #Cobbler命令
/var/lib/cobbler/kickstarts #默认存放kickstart文件
/var/lib/cobbler/loaders #存放的各种引导程序

3. 系统安装镜像目录：/var/www/cobbler

/var/www/cobbler/ks_mirror #导入的系统镜像列表
/var/www/cobbler/images #导入的系统镜像启动文件
/var/www/cobbler/repo_mirror #yum源存储目录

4. 日志目录：/var/log/cobbler

/var/log/cobbler/install.log #客户端系统安装日志
/var/log/cobbler/cobbler.log #cobbler日志





## 客户端自助重装系统

客户端操作：安装koan工具，这个是coobler的客户端工具

1. 安装epel源

    yum -y install epel-release

2. 安装koan工具

    yum install -y koan

3. 查看服务端的镜象名字

    koan --server=192.168.1.172 --list=profiles

4. 指定重装系统的名字

    koan --replace-self --server=192.168.1.172 --profile=centos-7-x86_64

5. 重启自动安装

    reboot



