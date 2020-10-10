
本文基于 anarchy 安装的纯净 archlinux

## i3-gaps

1. 连接网络

    dhcpcd 命令动态分配一个IP
        dhcpcd 网卡名

1. 安装图形界面需要的库
    xorg-server
    xorg-xinit  : 并非必须的，如果你像通过 startx 启动，就需要安装这个, 如果你想通过 display manager 启动(如lightdm),则可以不安装

    pacman -S xorg-server xorg-xinit

1. 安装常用软件
    pacman -S zsh feh compton i3-gaps compton xfce4-terminal leafpad google-chrome rofi

    feh     : 用来设置背景
    compton : 用来设置透明
    leafpad : 图形化编辑器  //因为终端上的vim默认不支持系统剪切板, 可以编辑.vimrc,启动鼠标右键粘贴功能
    rofi    : 类似与苹果的启动器

1. 安装一些字体

    pacman -S ttf-liberation    
    pacman -S adobe-source-han-sans-cn-fonts    //思源宋体
    pacman -S adobe-source-han-sans-tw-fonts    //思源宋体
    pacman -S adobe-source-han-sans-jp-fonts    //思源宋体

1. 创建用户
    useradd -n -g users -G wheel -s /bin/zsh rem
    passwd rem

    su - rem

    /etc/X11/xinit/xinitrc 拷贝到 rem 用户的 home 目录，并改名为 .xinitrc

    .xinitrc 会在执行 startx 时执行, 在这里启动一些进入图形界面需要的软件

    vi ~/.xinitrc

    ```
    跳到最后，倒数第5行: 
        twn &
        xclock ...
        xterm ...
        xterm ...
        exec xterm  ...
    删掉上面这些行

    如果你配置了输入法，同样可以在这里启动

    添加下面的命令:

    exec compton -b &
    exec i3


    #启动rofi的快捷键
    #-show run 指定为运行程序, 也可以设置为 -show window 显示打开的窗口
    bindsym $mod+d exec rofi -show run

    注释掉默认的 $mod+d
    bindsym $mod+d exec dmenu_run

    修改完毕后 mod shift r 刷新下
    ```

    接着输入 startx 看是否可以启动，否则 reboot

1. 配置i3

    第一次进入i3, 会要求你配置 mod 键

    vi ~/.config/i3/config

    修改 i3 使用的字体和大小
    /font

    font pango:ttf-liberation sans 14           //Pango 是设置文本布局并呈现国际化文本的库。使用 Unicode 作为其编码，可支持世界上大多数语言的输出


1. feh 设置壁纸

    feh --bg-center 壁纸文件

    将上面的指令写到 ~/.xinitrc 中
        exec feh --bg-center 壁纸文件 &

1. polybar

    yaourt -S polybar   //AUR上安装，也可以从github下载编译安装

    查看构建文件，里边有各种依赖: 
    optdepends 
        
    makedepends

    安装完成后退出文件, 提示: Edit polybar.install ? 选择no
    接下来提示 Continue building polybar? 选择yes

    构建完成后将示例文件拷贝到

    cp /usr/share/doc/polybar/config ~/.config/polybar/
    ~/.config/polybar 没有则创建

    编辑配置文件

    音乐控制模块要正常工作需要连上MPD
        安装并启动 mpd

    polybar example  //用户临时显示???

    配置启动 polybar

    github.com/jaagr/polybar 说明文件 搜索 running 点进去

        $HOME/cofig/polybar/launch.sh
        chmod +x 

    搜索 If you are using i3, add the following lines to your configuration
        exec_always --no-startup-id $HOME/config/polybar/launch.sh

        并删除掉默认的 start i3bar to display a workspace bar

    margin效果
        $HOME/config/i3/config
            添加
            gaps inner 10
            gaps outer 5

            这两个好像报错了在我的debian buster上???

1. oh-my-zsh

    github 搜索 oh-my-zsh

    Basic Installation
    

1. neofetch
    
    使用 ASCII 显示 发行版图标和相关信息

