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

打开远程桌面 的 windows manager
    application > settings > windows manager
    xfwm4-settings 将tab键占用的快捷方式更换

https://blog.csdn.net/u014447845/article/details/80291678




## xrdp 搭建

apt-get install tightvncserver
apt-get install xrdp
apt-get install vnc4server
apt-get install xubuntu-desktop
echo “xfce4-session” >~/.xsession(每个用户)
service xrdp restart


sesman is xrdp session manager

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
