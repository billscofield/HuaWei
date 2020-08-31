##

## grub-install 

install GRUB to a device

查看当前 grub 版本
    grub-install --version

    dpkg -l | grep grub

    dpkg -l | grep grub-pc

    grub-probe --version 


## grub2

redhat 系列是同时包含了 grub 和 grub2
    /boot/grub
    /boot/grub2

debian 系列默认是 grub2
    /boot/grub


grub1 是直接编辑 /boot/grub/grub.conf(centos6) 那种原始的

grub2 是编辑 /etc/default/grub, 

    ```
    GRUB_DEFAULT=0
    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
    GRUB_CMDLINE_LINUX_DEFAULT="quiet"
    GRUB_CMDLINE_LINUX=""

    ```

    然后 update-grub 用来更新 /boot/grub/grub.cfg
    或者 grub2-mkconfig -o /boot/grub/grub.cfg(debian)
    或者 grub2-mkconfig -o /boot/grub2/grub.cfg(redhat)

## grub 加密

centos6 

    grub-md5-crypt 生成密文

    /boot/grub/grub.conf 或 /etc/grub.conf 文件中的 title 字段上面新增一行

        password --md5 密文     (md5方式加密)
        password PASSWD (明文方式加密)

    reboot

    提示输入p 输入密码

找回密码 kernel 行 最后 输入 "1"


centos7
    grub2-mkpasswd-pbkdf2   生成密文

    vi /etc/grub/00_header

    最后一行添加 

        ```
        cat <<<EOF
        set superusers='root' 自己设的用户名
        password_pbkdf2 root 密文
        EOF
        ```
    grub2-mkconfig -o /boot/grub2/grub.cfg

    reboot

    e 直接提示用户名和密码


