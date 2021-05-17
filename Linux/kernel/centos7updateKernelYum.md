
升级内核需要先导入elrepo的key，然后安装elrepo的yum源：

    rpm -import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org


安装elrepo的yum源

    rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm


列出可用的内核相关包

    yum --disablerepo="*" --enablerepo="elrepo-kernel" list available


安装内核

    yum -y --enablerepo=elrepo-kernel install kernel-ml.x86_64 kernel-ml-devel.x86_64 


修改grub中默认的内核版本

    awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg


修改内核的启动顺序

    vim /etc/default/grub
    GRUB_DEFAULT=XXX


运行grub2-mkconfig命令来重新创建内核配置

    grub2-mkconfig -o /boot/grub2/grub.cfg


重启系统并查看系统内核
    
    reboot

    uname -r

