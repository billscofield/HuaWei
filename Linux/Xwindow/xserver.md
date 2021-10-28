

## /etc/gdm/Init/Default  选项 xhost 

xhost 是用来控制X server访问权限的。

    'xhost +' 是使所有用户都能访问Xserver.

    'xhost + ip' 使ip上的用户能够访问Xserver.

    'xhost + nis:user@domain' 使domain上的nis用户user能够访问

    'xhost + inet:user@domain' 使domain上的inet用户能够访问。


DISPLAY变量是用来设置将图形显示到何处.比如CENTOS,你用图形界面登录进去,DISPLAY自
动设置为DISPLAY=:0.0表示显式到本地监视器,那么通过终端工具(例如:xshell)进去,运行
图形界面的程序,如果没有设置,系统是不允许程序启动的。

在执行xhost +命令（使得所有客户都可以访问）

正常返回信息为：
    access control disabled,clients can connect from any host

如果xhost +不能执行，报错：xhost ：  unable to open display ""

可以输入命令export DISPLAY=:0执行一下

再执行xhost +

## https://www.cnblogs.com/js1314/p/10373332.html

https://www.cnblogs.com/js1314/p/10373332.html

DISPLAY

在Linux/Unix类操作系统上, DISPLAY用来设置将图形显示到何处. 直接登陆图形界面或者
登陆命令行界面后使用startx启动图形, DISPLAY环境变量将自动设置为:0:0, 此时可以打
开终端, 输出图形程序的名称(比如xclock)来启动程序, 图形将显示在本地窗口上, 在终
端上输入printenv查看当前环境变量, 输出结果中有如下内容:

    DISPLAY=:0.0

使用xdpyinfo可以查看到当前显示的更详细的信息.

DISPLAY 环境变量格式如下hostname: displaynumber.screennumber,我们需要知道，在某
些机器上，可能有多个显示设备共享使用同一套输入设备，例如在一台PC上连接两台CRT显
示器，但是它们只共享使用一个键盘和一个鼠标。这一组显示设备就拥有一个共同的
displaynumber，而这组显示设备中的每个单独的设备则拥有自己单独的 screennumber。
displaynumber和screennumber都是从零开始的数字。这样，对于我们普通用户来说，
displaynumber、screennumber就都是0。 hostname指Xserver所在的主机主机名或者ip地
址, 图形将显示在这一机器上, 可以是启动了图形界面的Linux/Unix机器, 也可以是安装
了Exceed, X-Deep/32等Windows平台运行的Xserver的Windows机器. 如果Host为空, 则表
示Xserver运行于本机, 并且图形程序(Xclient)使用unix socket方式连接到Xserver, 而
不是TCP方式. 使用TCP方式连接时, displaynumber为连接的端口减去6000的值, 如果
displaynumber为0, 则表示连接到6000端口; 使用unix socket方式连接时则表示连接的
unix socket的路径, 如果displaynumber为0, 则表示连接到/tmp/.X11-unix/X0 .
screennumber则几乎总是0.


如果使用su username或者su - username切换到别的用户, 并且使用命令

    export DISPLAY=:0.0

设置DISPLAY环境变量, 运行图形程序(如xclock)时会收到如下错误:

    Xlib: connection to ":0.0" refused by server
    Xlib: No protocol specified
    Error: Can't open display: :0.0

这是因为Xserver默认情况下不允许别的用户的图形程序的图形显示在当前屏幕上. 如果需
要别的用户的图形显示在当前屏幕上, 则应以当前登陆的用户, 也就是切换身份前的用户
执行如下命令

    xhost +

xhost 是用来控制X server访问权限的，这个命令将允许别的用户启动的图形程序将图形
显示在当前屏幕上.。通常当你从hostA登陆到hostB上运行hostB上的应用程序时，做为应
用程序来说，hostA是client,但是作为图形来说，是在hostA上显示的，需要使用hostA的
Xserver,所以hostA是server.因此在登陆到hostB前，需要在hostA上运行xhost +，来使其
它用户能够访问hostA的Xserver.

    xhost + 是使所有用户都能访问Xserver.
    xhost + ip使ip上的用户能够访问Xserver.
    xhost + nis:user@domain使domain上的nis用户user能够访问
    xhost + inet:user@domain使domain上的inet用户能够访问。

在2台Linux机器之间, 如果设置服务器端配置文件/etc/ssh/sshd_config中包含
X11Forwarding no

客户端配置文件/etc/ssh/ssh_config包含ForwardX11 yes

则从客户端ssh到服务器端后会自动设置DISPLAY环境变量, 允许在服务器端执行的图形程
序将图形显示在客户端上. 在服务器上查看环境变量显示如下(这个结果不同的时候并不相
同)

    DISPLAY=localhost:10.0

在客户机上用netstat -lnp可以看到有程序监听了6010端口

    tcp 0 0 127.0.0.1:6010 0.0.0.0:* LISTEN 4827/1

如果希望允许远程机器上的图形程序将图形显示在本地机器的Xserver上, 除了要设置远端
机器的DISPLAY环境变量以外, 还需要设置本地机器的Xserver监听相应的TCP端口. 而现在
的Linux系统出于安全的考虑, 默认情况下不再监听TCP端口. 可通过修改
/etc/X11/xinit/xserverrc文件, 将 exec /usr/bin/X11/X -dpi 100 -nolisten tcp 修
改为 exec /usr/bin/X11/X -dpi 100

允许在直接使用startx启动图形时启动对TCP端口的监听.

修改/etc/kde3/kdm/kdmrc, 将 ServerArgsLocal=-nolisten tcp 修改为
ServerArgsLocal=

允许kdm作为显示管理器时, 启动会话时监听相应的TCP端口.

修改/etc/gdm/gdm.conf, 在[Security]一节增加 DisallowTCP=false

或者在登陆窗口选择"Options" -> "Configure Login Manager..."的Security页面, 取消
"Deny TCP connections to Xserver", 允许gdm作为显示管理器时, 启动会话时监听相应
的TCP端口.
