## 关于xrdp远程桌面 tab 键被占用的问题

/etc/bash.bashrc

    ```
    #enable bash completion in interactive shells
    #if ! shopt -oq posix; then
    #      if [-f  /usr/share/bash-completion/bash_completion ]; then
    #          . /usr/share/bash-completion/bash_completion
    #      elif [ -f /etc/bash_completion ]; then
    #           . /etc/bash_completion
    #      fi
    #fi

    去掉注释
    ```

source /etc/bash.bashrc

打开远程桌面 的 设置 -> windows manager(窗口管理器)
    application > settings > windows manager
    xfwm4-settings 将tab键占用的快捷方式更换

https://blog.csdn.net/u014447845/article/details/80291678




## xrdp 搭建

apt-get install tightvncserver
apt-get install xrdp

apt-get install vnc4server
apt-get install xubuntu-desktop
echo "xfce4-session" >~/.xsession(每个用户)
    ubuntu18之后的版本，不写这个就是默认的unity界面

service xrdp restart





### 
1. "Xfce" 的名字最初是代表的是"XForms Common Environment"，这是因为起初开发使用XForms作为工具包。 但是之后Xfce被重写了两次并且放弃了使用XForms工具包。
这个名字虽然仍被保留下来，但是它的全名英文缩写不再是 "XFCE"，而变成了"Xfce"。

1. sesman is xrdp session manager

### xubuntu 中 terminal 不能用的问题

Settings Manager -> Preferred Applications

Utilities > Terminal Emulator 更改为 Xface Terminal


### xrdp_mm_process_login_response: login failed

问题原因：远程桌面没有正确关闭，虽然在windows 系统关闭远程桌面连接，但是在里linux上的进程还在运行，导致连接数量达到上限，出现问题。
解决：通过设置sesman.in文件内的参数解决：

vi /etc/xrdp/sesman.ini

可以修改会话设置
    将最大会话限制该大 MaxSessions=50; 
    将KillDisconnected=1；则每次断开连接时，linux都会关闭会话进程。 
    
    然后重启/etc/init.d/xrdp restart 就可解决问题





## xrdp 18

开启桌面共享功能
    设置-> 共享->屏幕共享:

apt install xrdp

用户在系统上远程登录，将无法在本地登录，反之，在本地登录将不能远程登录。
