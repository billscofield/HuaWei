
主机名文件:

    centos6 

        /etc/sysconfig/network  文件

    centos7

        /etc/hostname   ->  raspberrypi¬


临时修改主机名:

    hostname <new-hostname>
    然后重新连接


永久修改主机名:

    修改主机名文件

    centos7 

        hostnamectl set-hostname <new-hostname>
        
        配置文件也会被修改
        
        重新链接, 



