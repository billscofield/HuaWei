
## rxvt terminal

RXVT 

    our extended virtual terminal

    is a terminal emulator for X11. 

    It is a popular replacement for the standard ‘xterm’.


主要有以下三类，

    1. rxvt，不支持中文显示

    1. rxvt-ml，支持GB和BIG5中文编码；还有一个叫 

    1. rxvt-unicode，支持unicode编码。

        rxvt-unicode 是一个从rxvt分支出的可定制终端。 rxvt-unicode的特性包括：
        通过Unicode实现的多语言支持，透明度支持，多字体显示，Perl插件支持。


kde 环境下的 kconsole 十分之美观，gnome-terminal 也相当的好用，但是个头大的东西
都有个不足之处——过于笨重。

而 rxvt 是个轻量快速，节省内存的终端，然而不支持中文。

rxvt-unicode被收录在 debian/ubuntu 的源中，安装只需在管理员权限下输入命令：

    aptitude install rxvt-unicode

在 debian 6 wheezy中安装好后，gnome菜单中没有它，需要手动创建快捷方式。

默认安装好后的 rxvt-unicode 相当原始，需要配置一番才方便使用。它的配置文件为

~/.Xresource 或 ~/.Xdefaults

https://wiki.archlinux.org/index.php/Rxvt-unicode




## 配置

配置文件
    
    ~/.Xdefaults
