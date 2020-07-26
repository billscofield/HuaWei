
## ranger

visual file manager


### 安装

apt install ranger


### 简单使用

可以使用vim的移动

    hjkl gg G
    [] 父目录的上下

    shift h: 后退
    shift l: 前进

复制文件: yy

删除文件: dD


### 配置

#### 配置文件

/usr/share/doc/ranger/config/

--copy-config=file

    Create copies of the default configuration files in your local configuration directory.

    Existing ones will not be overwritten.  Possible values: all, commands, commands_full, rc, rifle, scope.


    会将 /usr/share/doc/ranger/config/ 下的配置文件拷贝到 local configuration directory, 即 ~/.config/ranger/

    一般使用 ranger --copy-config=all


#### 配置自己的ranger

~/.config/ranger/scope.sh

~/.config/ranger/rc.conf    //包含快捷键map 300行开始


### 快捷键

? 帮助
    
    [m]an page
    [k]ey bindings
    [c]ommands
    [s]ettings
    q to abort

H   后退    history_go -1
L   前进    history_go 1
