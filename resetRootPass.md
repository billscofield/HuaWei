# to reset root password

## centos 7

### 单用户模式

1. 使用这种模式修改root密码，前提是知道grub密码

2. 在开机过程中，快速按下键盘上的方向键↑和↓。

3. 进入grup后使用↑和↓将选择行设置为第一行（背景高亮即为选中），按下键盘上的e，进入编辑模式

4. 进入grub界面,找到 linux16 这一行，修改 ro 为 rw
   。表示只读改为读写。并再写一行：init=/sysroot/bin/sh, 修改完按 ctrl+x

5. 切换到原来的系统环境下面去，修改密码 
    
    ```
    chroot /sysroot //进入系统环境里面
    passwd root     //修改密码，小方块说明乱码
    LANG=en         //修改语系变量
    passwd root     //重新修改密码
    touch /.autorelabel     //selinux相关，不创建无法开机

    exec /sbin/reboot       //重启系统
    ```

也可在第4步中将 init=/bin/sh, 进入但用户模式后直接修改密码

链接

    http://blog.51cto.com/11060853/2089872

    https://blog.csdn.net/wcy00q/article/details/70570043


## ubuntu

1. 启动系统,在启动过程中,反复按Esc键

1. 选择Ubuntu高级选项(或者有的版本显示的是Advanced options for Ubuntu),然后按'Enter'键

1. 选中 (recovery mode) 按 e 键 进入

1. 找到linux   /boot/....... ro recovery nomodeset所在的行

1. 将 ro recovery nomodeset改为quiet splash rw init=/bin/bash, ctrl+x 重启

1. passwd

1. 输入新密码

1. reboot -f 重启，正常登陆即可

    1. 可以Ctr Alt Del

链接

    https://blog.csdn.net/weixin_37909391/article/details/80691601













