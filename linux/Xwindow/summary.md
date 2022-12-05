
X Window 时 Unix 的图形界面标准，随着 Intel x86 体系结构的计算机的普及，为了能
够将 X Window 移植到 Intel x86 的平台上，成立了 XFree86 Project Inc.

    Inc. 有限公司（incorporated / ɪnˈkɔːrpəreɪtɪd / 包含，合并；组成公司；掺和，
    混合（成分））

XFree86 时该组织的注册商标

    1991.1  X11R4
    1994.4  X11R6



    Window Manager: 面向终端用户的操作界面
        |
       /|\
        |
    Xlib 函数接口: X Window 应用程序的功能实现是通过调用该层的函数实现的。掌握
    Xlib 函数及其调用方法时进行 X 应用程序开发的基础
        |
       /|\
        |
    网络通信的 X 协议
        |
       /|\
        |
    X Server


    X是协议，不是具体的某个软件。
        Xfree86 ，Xorg ，Xnes,
        MOTIF

    difference of Xfree86 and Xorg
        XFree86 added terms that identified to be **GPL incompatible**. That's why most major distros discarded XFree86 and switched to Xorg.

    实现X协议的软件也并不只有 XFree86，XFree86只是实现X协议的一个免费X服务器软
    件.商业上常用MOTIF，现在还有XORG，还有很多很小的由爱好者写的小的X服务器软件

    甚至可以在WINDOWS上有X服务器运行，这样你可以在linux系统上运行一个X应用程序
    然后在另一台windows系统上显示

    苹果电脑的图形界面用的也是X协议，而且被认为是做的最好的X协议图形界面，并且
    他对X协议的实施是做在系统内核里的，所以性能明显好很多，这就是为什么很 多大
    型三维图形设计软件都是在苹果平台上的原因.






KDE: 基于 QT



文件管理器
    nautlus (GNOME)

    Xfe 是 X File Explorer 的简称
        http://roland65.free.fr/xfe/index.php?page=docs
        需要梯子
        Xfe is written in C++ and built using the FOX graphical toolkit library

        The system-wide configuration file xferc is located in /usr/share/xfe,
        /usr/local/share/xfe or /opt/local/share/xfe, in the given order of
        precedence.

        Starting with version 1.32, the location of the local configuration
        files has changed. This is to be compliant with the Freedesktop
        standards.
    
        The local configuration files for xfe, xfw, xfv, xfi, xfp are now
        located in the ~/.config/xfe directory. They are named xferc, xfwrc,
        xfvrc, xfirc and xfprc

        At the very first xfe run, the system-wide configuration file is copied
        into the local configuration file ~/.config/xfe/xferc which does not
        exists yet. If the system-wide configuration file is not found (in case
        of an unusal install place), a dialog asks the user to select the right
        place. It is thus easier to customize xfe (this is particularly true
        for the file associations) by hand editing because all the local
        options are located in the same file.

        Default PNG icons are located in /usr/share/xfe/icons/xfe-theme or
        /usr/local/share/xfe/icons/xfe-theme, depending on your installation.
        You can easily change the icon theme path in Preferences dialog.




图形图像处理
    GIMP(General Image Manipulation/ məˌnɪpjuˈleɪʃn /操作，处理 Program)
    
    网络上的一些著名的图标，如 Linux 的企鹅, Gnome的标志, KDE的标志，GNU 的标志，
    都是由这个软件来完成的


