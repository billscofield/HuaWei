
X是一个协议, 实现该协议的软件有很多,如 Xfree86, Xorg, Xnest等

1987年更改X版本到X11, 这一版本取得了明显的进步,后来的窗口接口改进都是基于此版本, 因此后来 X Window System 也被称作 X11

1992年, XFree86 计划顺利展开, 该计划持续在维护X11R6的功能性

    早期定名为XFree86 是根据 X + Free Software + x86硬件而来

    早期Linux所使用的X Window System 的内核都是由XFree86这个计划提供的,因此，我们常常将X和XFree86画上等号

1994年发布了X11R6, X11R6 实际上是 X Protocol version 11 Release 6

XFree86 由于 license 和组织规划的原因, 不太得民心, 开发者又加入到了 X.org 基金会继续进行 X11 的维护
    

    the industry group that was the successor to the MIT X Consortium in
    producing the main X11 releases and managing the standards

    这个行业组织是MIT X协会的继承者，它生产主要的X11版本并管理这些标准

    As a result, the once moribund X.Org was revitalized and reformed as an
    open source foundation, and many developers & distributors have joined it
    and plan to use it to replace XFree86.

    结果，曾经垂死的X.Org重新焕发了生机，并被改造为一个开源基金会，许多开发人员
    和分销商加入了它，并计划用它来取代XFree86。

    https://blogs.oracle.com/solaris/post/the-difference-between-xorg-and-xfree86

2005年, X.org 发布了 X11R7.x 版本


---


1. X server

    X Server 负责管理鼠标,键盘,显卡,显示器等硬件,而X-client则负责处理程序的运行。

    由于x-server负责鼠标、键盘、显卡、显示器这些输入输出部件，你必须在安装好以
    后，告诉x-server你当前系统使用的是什么样的鼠标、键盘、显卡、显示器。由于当
    前硬件厂商众多，所以不要指望x-server自动识别出所有需要的参数，通常你需要编
    辑一下/etc/X11/xorg.conf这个文件来提示它一下

2. X Client 

    X Client 应用程序会将想要呈现的图形告知X Server, 最终由X Server 来将结果通
    过它所管理的硬件绘制出来

    如果我用电脑A远程服务器B, 则 X Server 运行于电脑A, 而 X Client 运行于服务器B

    由于X Client 的目的在于生产绘图的数据，因此我们也称呼 X Client 为 X Application

3. X Window Manager

    X Client 的主要任务是将来自 X Server 的数据处理成绘图数据, 再返回给 X
    Server, 所以 X Client 并不知道它在 X Server 当中的位置。

    为了解决这个问题, 因此就产生了 Window Manager(WM, 窗口管理器). 窗口管理器本
    身也是 X Client, 只是它主要负责全部 X Client 的管理

    gnome   (GNU Network Object Model Environment)
    kde     (K Desktop Environment)
    Xface   (XForms Common Environment)
    twm     (Tab Window Manager)


    启动 X Window Manager 的两种方式
        
        1. 进入命令行模式后, 输入 startx 来启动 X 窗口, /usr/bin/startx 其实是一个 shell 脚本
           真正起作用的是 /usr/bin/xinit
        
        2. 通过 Display Manager 提供的登陆界面，输入帐号密码来启动 X 窗口



4. Display Manager, 提供登录需求

    在本机的命令行模式下面我们可以输入 startx 来启动X, 此时由于我们已经登录系统
    了, 因此不需要重新登录即可取得X环境

    但如果是 graphical.target 环境呢? 你会发现 tty1 或其它 tty 的地方有个可以让
    你使用图形用户界面模式登录的东西, 这个就是 Display Manager

    Display Manager 最大的任务就是提供登录环境, 加载用户的 Window Manager

    




startx - initialize an X session

SYNOPSIS
    startx  [  [  client ] options ... ] [ -- [ server ] [ display ]
    options ... ]

DESCRIPTION
    The startx script is a front end to  xinit(1)  that  provides  a
    somewhat  nicer  user  interface for running a single session of
    the X Window System.  It is often run with no arguments.


## xinit - X Window System initializer

SYNOPSIS
    xinit [ [ client ] options ... ] [ -- [ server ] [ display ] options ... ]

DESCRIPTION

    The  xinit program is used to start the X Window System server and a first
    client program on systems that are not using a display manager such as
    xdm(1) or in environments that use multiple window systems.  When this
    first client exits, xinit will kill the X server and then terminate.

    If no specific client program is given on the command line, xinit will look
    for a file in the user's home directory called .xinitrc to run as a shell
    script  to  start  up client programs.  If no such file exists, xinit will
    use the following as a default:

        xterm  -geometry  +1+1  -n  login  -display  :0

    If  no specific server program is given on the command line, xinit will
    look for a file in the user's home directory called .xserverrc to run as a
    shell script to start up the server.  If no such file exists, xinit will
    use the following as a default:

        X  :0

    Note that this assumes that there is a program named X in the current
    search path.  The site administrator should, therefore, make a link to the
    appropriate type of server on the machine, or create a shell script that
    runs xinit with the appropriate server.

    Note, when using a .xserverrc script be sure to ``exec'' the real X server.
    Failing to do this can make the X server slow to start and exit.  For
    example:

        exec Xdisplaytype

    An  important  point  is  that programs which are run by .xinitrc should be
    run in the background if they do not exit right away, so that they don't
    prevent other programs from starting up.  However, the last long-lived
    program started (usually a window manager or terminal emulator) should be
    left in the foreground so that the  script  won't exit (which indicates
    that the user is done and that xinit should exit).

    An  alternate  client and/or server may be specified on the command line.
    The desired client program and its arguments should be given as the first
    command line arguments to xinit.  To specify a particular server command
    line, append a double dash (--) to the xinit command line (after any client
    and arguments) followed by the desired server command.

    Both  the client program name and the server program name must begin with a
    slash (/) or a period (.).  Otherwise, they are treated as an arguments to
    be appended to their respective startup lines.  This makes it possible to
    add arguments (for example, foreground and background colors) without
    having to retype the whole command line.

    If an explicit server name is not given and the first argument following
    the double dash (--) is a colon followed by a digit, xinit will use that
    number  as  the  display number instead of zero.  All remaining arguments
    are appended to the server command line.



## 终端模拟器

1. Xterm

    如果感觉Xterm它很古老，没错，因为它的确很古老。Xterm出生于1984年，Xterm是X
    Window系统的默认终端模拟器，需要避开任何的图形工具包，否则它可能会显示在你
    的窗口管理器上。但这种简约的做法也相应的缺乏特色；这是非常简单的一个终端。
    不过，对于一个非常小的带有图形系统的Linux，Xterm中仍有一席之地。Xterm基于
    MIT许可。

    Xterm 也是 Xinit 的默认

2. gnome-terminal

3. Konsole : KDE 默认的终端模拟器

4. rxvt / urxvt

5. Kvt

6. Nxterm

7. eterm

8. Guake : 下拉式

9. terminator

10. Tilda
    为 GTK 涉及的另一种下拉样式(Quake-style)的终端模拟器

11. Yakuake
    另一个下拉终端模拟器, KDE家族



## 关于composite

Xomposite是一Xserver的一个扩展。 composite可以完全用软件来实现，比如metacity，
xfwm，等等现在基本都可以自己支持composite了，composite下面实际上也可以调用硬件
加速，比如metacity的实现是使用的Xrender。XrenderComposite实际上这个跑到驱动里面
去的话，如果有exa就会调用到 exapreparecomposite,checkcomposite， composite,
donecomposite这些实现，如果要加速composite的话，就需要实现这些exa的扩展了，
composite的运作机制，实际上所有的画面都是先离屏画的，也就是说画在一块内存/显存
里面，这块内存是不直接显示的,然后到最后把所有的窗口做 alpha blending。 然后才显
示到屏幕上面，这样我们就可以看到透明效果了。 

composite为什么打开之后系统变慢？
原因很明显，因为所有的画图结果都不能直接显示到屏幕，要先画到后台，然后
windowmanager把当前所有window的buf 做alpha blending之后才显示出来，本身这个框架
就导致延迟，然后就是alpha 运算本身很慢了。



## 1.linux图形界面框架

参考至：http://dzdl.ipchina.org/site/?uid-9-action-viewspace-itemid-49

linux图形界面又称x系统,其主要包含如下几个部分：

    a)xserver

    b)显示管理器 (Display Manager) 例如（gdm kdm xdm等）

    c)窗口管理器 (Window Manager) 例如（metacity ,fluxbox等）

    d)DM 和 WM之上的一些图形应用程序

在使用中一般都是b,c,d三者集合起来构成一个完整的集成工作环境，例如KDE ,GNOME等,这就是我们平时所说的广义上的xclient


### a) xserver 主要提供基本的显示接口共xclient使用，并将用户的操作等也反映给xclient，是xclient与硬件的一个中间层。xserver相关的两个主要部分是

(1) xorg.conf

xorg.conf是X Server的主要配置文件，它包含一个当前系统的硬件资源列表。X Server就是根据这些硬件资源“组织”出基本的图形能力。xorg.conf文件在/etc/X11/xorg.conf，主要包含几个字段：
    Files: X系统使用的字体存放目录(字体的具体使用由FontConfig工具主持)
    InputDevice: 输入设备，如键盘鼠标的信息
    Monitor: 显示器的设置，如分辨率，刷新率等
    Device: 显示卡信息
    Screen: 由Monitor和Device组装成一个Screen，表示由它们向这个Screen提供输出能力
    ServerLayout: 将一个Screen和InputDevice组装成一个ServerLayout
在具有多个显示设备的系统中，可能有多个Screen和多个ServerLayout，用以实现不同的硬件搭配。
在最近的xorg版本中，X Server已经开始自动侦测硬件，现在的xorg.conf已经都成了默认名称。具体细节还待查，但基本原理还是不变的。


(2) X session(X会话)

X session是指X server启动后直到X server关闭之间的这段时间。这期间一切跟X相关的动作都属于X session的内容。管理X session的程序称为Display Manager，常听说的gdm或kdm就是gnome/kde所分别对应的Display Manager。
开启一个X session，也就是开始了图形界面的使用。在开启的过程中，Display Manager会对用户进行认证(也就是用户名密码的输入)，运行事先设置好的程序(比如scim输入法就是这个时候启动的)等等。
这个开启过程要执行的一系列操作都可以在/etc/X11/Xseesion以及/etc/X11/Xsession.d/目录下看到，其他还有一些配置文件如Xsession.options, Xresource等，都是执行的X session的初始化过程。仔细阅读这些脚本或配置文件，可以帮助你更好地理解X


### b), Display Manager

上面说过，Display Manager(后简称DM)是管理X session的程序，常见的有gdm, kdm, xdm等。对于默认进入X界面的Linux系统，必须将DM程序在开机时执行，即：/etc/rc2.d/S13gdm。下面我们从手工启动X的过程，看一下DM为我们做了哪些工作。
如果没有设置DM在开机时运行的话，手动启动X使用startx命令。
man startx
可以知道，startx的作用可以看作是Display Manager的一种隐性实现。它使用xinit命令，分别根据/etc/X11/xinit/xinitrc和/etc/X11/xinit/xserverrc中所指定的设置唤起X。
其中，xserverrc执行X server的运行任务；xinitrc则运行Xsession命令。从/etc/X11/Xsession脚本的内容可以看出，它也就是进入/etc /X11/Xsession.d/目录轮询地执行所有脚本。很明显，这些也就是前面所说的Xsession初始化工作。
综合起来说，Display Manager完成三个任务：1, X Server的启动; 2, X session的初始化; 3, X session的管理。


### c), Window Manager
X Server提供了基本的图形显示能力。然而具体怎么绘制应用程序的界面，却是要有应用程序自己解决的。而Window Manager(桌面管理器，后简称WM)就是用来提供统一的GUI组件的(窗口、外框、菜单、按钮等)。否则，应用程序们各自为政，既增加了程序开发的负担，不统一的桌面风格对视觉也是不小的挑战。
WM的启动由DM控制，在gdm的登录窗口，我们可以进行选择。常见的WM有:Metacity(Gnome默认的WM), fluxbox, fvwm, E17等。


### d), X Clients

最后，就是X Client了。X客户端程序，顾名思义，就是使用X服务的程序。firefox，gedit等等都属于X Client程序。X Client部分值得考虑一下的就是DISPLAY环境变量。它主要用于远程X Client的使用。该变量表示输出目的地的位置，由三个要素组成：
[host]:display[.screen]
host指网络上远程主机的名称，可以是主机名、IP地址等。默认的host是本地系统，你可以在自己系统上echo $DISPLAY看一下。
display和screen分别代表输出画面的编号和屏幕的编号。具体细节由于硬件的缺乏，还有待进一步研究。


## 2.xserver 和x client启动过程

参考：http://blog.csdn.net/clozxy/archive/2010/04/15/5488699.aspx

对xserver和x client的启动过程的探讨主要是对startx命令的探讨
startx脚本网上解释的很多，这里就不多做介绍，对startx介绍分以下两个部分
(1)xinit用法
startx其实是个脚本，最终调用的是xinit命令，其用法如下：
xinit 的用法为： xinit [[client] options ] [-- [server] [display] options] 。其中 client 用于指定一个基于 X 的应用程序， client 后面的 options 是传给这个应用程序的参数， server 是用于指定启动哪个 X 服务器，一般为 /usr/bin/X 或 /usr/bin/Xorg ， display 用于指定 display number ，一般 为 0 ，表示第一个 display ， option 为传给 server 的参数。
    /usr/bin/X -> /usr/bin/Xorg

如果不指定 client ， xinit 会查找 HOME ( 环境变量 ) 目录下的 .xinitrc 文件，如果存在这个 文件， xinit 直接调用 execvp 函数执行该文件。如果这个文件不存在，那么 client 及其 options 为： xterm -geometry +1+1 -n login -display :0 。

如果不指定 server ， xinit 会查找 HOME( 环境变量 ) 目录下的 .xserverrc 文件，如果存在这个文件， xinit 直接调用 execvp 函数执行该文件。如果这个文件 不存在，那么 server 及其 display 为： X :0 。如果系统目录中不存在 X 命令，那么我们需要在系统目录下建立一个名为 X 的链接，使其指向真正的 X server 命令（ Ubuntu 下为 Xorg ）。

因此startx的用法跟xinit一样：startx [ [ client ] options … ] [ – [ server ] options … ]


(2)startx的几种启动方式
由对 startx 脚本的分析，我们可以知道 startx 主要有三种启动方式：
a) 、一种是自己指定要启动的 client 和 server ， 例如： startx /usr/bin/xclock – /usr/bin/X :0 ；
b）、一种是通过在 $HOME 下新建 .xinitrc 文件来指定要启动的多个 client 和 .xserverrc 来指定要启动的 server；
c）、还有一种是直接输入 startx 而不指定参数，这也就是我们启动 gnome 桌面的方法。

在 c 这种启动方法中, startx 脚本会先去看系统目录（ /etc/X11/xinit/ ）下的 rc 文件是否存在，如果不存在就会用默认的 xterm 和 /usr/bin/X 来启动 xinit 。显然， startx 启动的不是 xterm ，而是 gnome 桌面，因此 gnome 的启动是通过系统文件 /etc/X11/xinit/xinitrc 来指定的。

而 /etc/X11/xinit/xinitrc 文件的内容如下所示：

```
#!/bin/bash  # 注意 ： 该脚本用的是 bash shell 解析的

# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession   # 在当前这个 shell 环境中执行 Xsession 脚本

```


因此， gnome 的启动应该在 Xsession 里。

而 X Server 的启动则是通过系统文件 /etc/X11/xinit/xserverrc 来指定的 ， 这个文件的内容为 ：

```
#!/bin/sh # 注意：该脚本用的是 Bourne shell 解析的

# $Id: xserverrc 189 2005-06-11 00:04:27Z branden $

exec /usr/bin/X11/X -nolisten tcp

```

***综上所述， startx 的默认启动过程为： startx 调用并将系统文件 /etc/X11/xinit/xinitrc 和 /etc/X11/xinit/xserverrc 作为参数传给 xinit ， xinit 就会先执行系统文件 /etc/X11/xinit/xserverrc 以启动 X Server ，然后执行 /etc/X11/xinit/xinitrc ，而 xinitrc 则会执行脚本 /etc/X11/Xsession ，而 Xsession 则会按顺序调用执行 /etc/X11/Xsession.d 目录下的文件，从而最终调用了 gnome-session 这个用于 启动 GNOME 桌面环境的程序***


3.图形2d，3d加速简介

为了是linux下图形更加流畅，必须使用加速。常用的加速方法如下
加速常见有三种方式

    a）ShadowFB
        
        ShadowFB是xserver自带的与体系结构无关的2D加速方式，它将系统framebuffer复制一份，并且在拷贝回framebuffer中实现图形旋转等操作，这样可以起到一定加速作用，但是效果不好。

    b) XAA
        
        XAA全称XFree86 Acceleration Architecture，是由 Harm Hanemaayer 在1996年写的一个显卡硬件2D加速的驱动结构，目前大多数的显卡去动均支持这种驱动模式

    c) EXA
        
        EXA是X.Org发起的用于取代XAA加速的驱动结构，修改的宗旨是是XRender更加好用。

历史上对2D 和3D加速已经做了区分，2D加速主要使用的是XAA结构，3D加速主要是通过DRM（Direct Rendering Manage) 提供.而EXA提供了比XAA更好集成XRender的结构，同时也提高了XAA的2D加速效果。
EXA采用的方法是通过实现对OpenGL的加速以实现同时对2D，3D图像的加速，这样2D图像就可以看作是3D图像的一个子集。

4.xserver 主分支代码解析

参考网站：http://xwindow.angelfire.com，
基于xorg-xserver-1.7.6版本
xserver代码是从dix/main.c中的main函数开始执行。
开始的一系列函数执行一些初始化及check的工作
InitRegions();
pixman_disable_out_of_bounds_workaround();
CheckUserParameters(argc, argv, envp);
CheckUserAuthorization();
InitConnectionLimits();
ProcessCommandLine(argc, argv);

随后main函数进入了一个死循环。每次循环均包含了
    a)xserver初始化
    b)xserver循环处理client消息
    c)xserver退出
    三个阶段

这是xserver的main函数最外层的循环，一般启动xserver只会执行一次循环：用户在图形界面操作时，实际上xserver是处在b）阶段。
这个循环就保证了xserver出现一般的异常时会自动恢复，比如在运行x时替换了其显卡驱动，xserver会触发异常结束第一次循环
并在第二次循环中重新加载替换后的显卡驱动。

以下分别对这三个阶段做解析
    a）xserver初始化
    xserver初始化函数非常多，以下仅粗略介绍几个比较熟悉的：

(1)
初始化中有如下代码：

```
if(serverGeneration == 1)
{
CreateWellKnownSockets();
InitProcVectors();
for (i=1; i<MAXCLIENTS; i++)
clients[i] = NullClient;
serverClient = xalloc(sizeof(ClientRec));
if (!serverClient)
FatalError(“couldn’t create server client”);
InitClient(serverClient, 0, (pointer)NULL);
}
else
ResetWellKnownSockets ();
```

当第一次循环时serverGeneration=1，执行的是第一个分支代码。
CreateWellKnownSockets() 初始化一系列sockets监听是否有clients申请连接。
InitProcVectors() 初始化ProcVector，SwappedProcVector结构
for循环是生成并初始化clients数组
之后便是serverClient变量的生成即初始化，serverClient是clients数组中索引为0的项，因为他是拥有root window的client。

当之后的循环时serverGeneration = 0，执行的是ResetWellKnownSockets即重置sockets工作。

(2)
InitOutput()是初始化分量较中的一环，处理过程可以分为如下部分：
1)xf86HandleConfigFile 解析xorg.con文件 ，获得xserver的配置信息。
2）xf86BusProbe 获得video的pci信息，例如framebuffer地址等。
3）DoConfigure（） 根据配置文件 ，或者传进来的参数做相应的配置
4）xf86LoadModules load xorg.conf中配置的一系列模块
5）以此遍历注册的各个driver，调用其identify，probe函数, 这样就根据显卡的型号加载了相应的驱动
6）匹配screen，主要是根据xorg.conf中配置的screen，查询是否有与其匹配的device
7）遍历screen，调用其匹配device驱动的PreInit函数。这样就完成了显卡驱动的预初始化
8）遍历screen，调用AddScreen函数，分配screenInfo.screen[]的一项，并做初始化ScreenInit.这样驱动的初始化基本完成。

（3）
InitInput()是初始化输入设备，例如键盘和鼠标等。如果xorg.conf中有Section InputDevice配置，会按照
其配置扫描加载设备

b)xserver循环处理client消息
在初始化结束之后xserver便进入了循环处理阶段即
Dispatch()函数

该函数的流程主要是一个循环结构
while (!dispatchException)
即当不出现异常时循环会不断进行下去
每一次循环可以分为如下部分
(1)接受用户的输入，并发送给client
if (*icheck[0] != *icheck[1])
{
ProcessInputEvents();
FlushIfCriticalOutputPending();
}

(2)等待clients发送事件过来
nready = WaitForSomething(clientReady);

(3)遍历每个发送信息的client，做如下处理
1）接受用户输入并发送
if (*icheck[0] != icheck[1])
ProcessInputEvents();
FlushIfCriticalOutputPending();
2）获得client的请求号
result = ReadRequestFromClient(client);
3) 根据请求号调用队列中相应的处理函数
if (result > (maxBigRequestSize << 2))
result = BadLength;
else {
result = XaceHookDispatch(client, MAJOROP);
if (result == Success)
result = ( client->requestVector[MAJOROP])(client);
XaceHookAuditEnd(client, result);
}
4)若处理函数返回异常则做异常处理
if (result != Success)
{
if (client->noClientException != Success)
CloseDownClient(client);
else
SendErrorToClient(client, MAJOROP,
MinorOpcodeOfRequest(client),
client->errorValue, result);
break;
}
}
5)提交处理结果
FlushAllOutput();

由此Dispatch函数解析结束

c)xserver退出
包含了一系列释放内存，关闭clients等操作，这里就不多做解析。

5.xserver,xclient协议简介
由上文对Dispatch函数的分析可以看出，xserver对client的处理主要是三步：
(1)获得事件信息
nready = WaitForSomething(clientReady);
(2)获得操作号
result = ReadRequestFromClient(client);
(3)根据操作号处理
result = (* client->requestVector[MAJOROP])(client);

因此其操作号和操作的对应是xserver与client的协议的一部分，类似操作
系统的系统调用号和系统调用之间的关系。

在上面介绍InitClients()中有对requestVector初始化
client->requestVector = InitialVector;

InitVector如下：
int (* InitialVector[3]) (
ClientPtr
) =
{
0,
ProcInitialConnection,
ProcEstablishConnection
};

其只有两个函数，一个是初始化Connection，一个是确立Connection
在ProcEstablishConnection中调用SendConnSetup寒酸，
SendConnSetup函数有：
client->requestVector = client->swapped ? SwappedProcVector : ProcVector;
即初始化requestVector为SwappedProcVector或ProcVector
ProcVector如下：
_X_EXPORT int (* ProcVector[256]) (
ClientPtr
) =
{
ProcBadRequest,
ProcCreateWindow,
ProcChangeWindowAttributes,
ProcGetWindowAttributes,
ProcDestroyWindow,
ProcDestroySubwindows,
ProcChangeSaveSet,
ProcReparentWindow,
ProcMapWindow,
ProcMapSubwindows,
ProcUnmapWindow,
。。。。。。。。。。。。。
ProcGetModifierMapping,
0,
0,
0,
0,
0,
0,
0,
ProcNoOperation
};
SwappedProcVector类似。

也就是说Client与server交互时，先按照固定的协议初始化Connector，并且告诉xserver其适合的协议。
然后server按照该协议解析client发送过来的操作号。

6.一个基于Xlib的简单例子了解Client流程
Xlib是对X协议的的一个简单的封装，可以让程序员不用了解细节而编写图形相关程序。实际上程序员直接调用Xlib的很少，更多使用的是
GTK+ ,QT等图形库。这些又是基于Xlib的图形库。
一个简单的Xlib例子如下

#include <X11/Xlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
Display *d;
Window w;
XEvent e;
char *msg = “Hello, World!”;
int s;

d = XOpenDisplay(NULL);
if (d == NULL) {
fprintf(stderr, “Cannot open display\n”);
exit(1);
}

s = DefaultScreen(d);

w = XCreateSimpleWindow(d, RootWindow(d, s), 10, 10, 100, 100, 1,
BlackPixel(d, s), WhitePixel(d, s));

XSelectInput(d, w, ExposureMask | KeyPressMask);

XMapWindow(d, w);

while (1) {
 XNextEvent(d, &e);


 if (e.type == Expose) {
   XFillRectangle(d, w, DefaultGC(d, s), 20, 20, 10, 10);
   XDrawString(d, w, DefaultGC(d, s), 50, 50, msg, strlen(msg));
 }

 if (e.type == KeyPress)
   break;
}

XCloseDisplay(d);

return 0;
}
这个程序就可以看作一个简单的client，包含client的大体流程。
编译： gcc input.c -o output -lX11
程序执行方式有两种：
1.在图形界面下直接执行程序
2.在用户目录下新建一个.xinitrc文件，写入
exec input
之后startx，执行的不是默认的图形界面程序而是input程序

7.radeon驱动初始化代码解析.
由上面对xserver初始化的介绍，可以看到，在初始化过程中主要是显卡驱动的三个函数的调用
Probe , PreInit , ScreenInit
以下以radeon驱动为例（xorg-xserver-video-ati-6.13.1),介绍驱动对显卡的初始化过程，以及图形加速中使用的函数。

(1)Probe函数
在radeon驱动中，probe函数主要是
static Bool
radeon_pci_probe(
DriverPtr pDriver,
int entity_num,
struct pci_device *device,
intptr_t match_data
)
{
return radeon_get_scrninfo(entity_num, (void *)device);
}

在radeon_get_scrninfo函数中有：主要是对pScrn和pENT的初始化。
在pScrn的初始化中给出了将要调用的PreInit 和ScreenInit函数
#ifdef XF86DRM_MODE
if (kms == 1) {
pScrn->PreInit = RADEONPreInit_KMS;
pScrn->ScreenInit = RADEONScreenInit_KMS;
pScrn->SwitchMode = RADEONSwitchMode_KMS;
pScrn->AdjustFrame = RADEONAdjustFrame_KMS;
pScrn->EnterVT = RADEONEnterVT_KMS;
pScrn->LeaveVT = RADEONLeaveVT_KMS;
pScrn->FreeScreen = RADEONFreeScreen_KMS;
pScrn->ValidMode = RADEONValidMode;
} else
#endif
{
pScrn->PreInit = RADEONPreInit;
pScrn->ScreenInit = RADEONScreenInit;
pScrn->SwitchMode = RADEONSwitchMode;
pScrn->AdjustFrame = RADEONAdjustFrame;
pScrn->EnterVT = RADEONEnterVT;
pScrn->LeaveVT = RADEONLeaveVT;
pScrn->FreeScreen = RADEONFreeScreen;
pScrn->ValidMode = RADEONValidMode;
}
不妨已RADEONPreInit_KMS ， RADEONScreenInit_KMS为例介绍驱动PreInit和ScreenInit过程

(2)PreInit
RADEONPreInit_KMS在结构上大体可以分为三个部分（虽然不严格），
a）pScrn->driverPrivate的初始化
例如：
info = RADEONPTR(pScrn);
info->pEnt = xf86GetEntityInfo(pScrn->entityList[pScrn->numEntities - 1]);
f (!radeon_alloc_dri(pScrn))
return FALSE;

其实对pScrn->driverPrivate的初始化贯穿了整个PreInit，但是在前面比较集中。

b）drm的初始化
radeon_open_drm_master(pScrn)
调用drmOpen打开内核drm设备

drmmode_pre_init(pScrn, &info->drmmode, pScrn->bitsPerPixel / 8)
drmCommandWriteRead(info->dri->drmFD, DRM_RADEON_GEM_INFO, &mminfo, sizeof(mminfo))
等做其他方面的初始化

c）一些相关模块的load
例如：
xf86LoadSubModule(pScrn, “fb”)
load framebuffer相关的so

!xf86LoadSubModule(pScrn, “ramdac”)
load 与光标显示相关模块

RADEONPreInitAccel_KMS(pScrn)
根据加速方式选择决定load shadowfb 还是exa模块

细节很多大体上可以分这三个部分理解

(3)ScreenInit
RADEONScreenInit_KMS要比RADEONPreInit_KMS杂乱
但也可以看作如下几个部分
a)对pScrn->driverPrivate的比较集中的初始化
例如：
info->bufmgr = radeon_bo_manager_gem_ctor(info->dri->drmFD);
info->cs = radeon_cs_create(info->csm, RADEON_BUFFER_SIZE/4);
等比较明显的
以及
radeon_setup_kernel_mem(pScreen);
初始化地址映射相关的info信息

b）fbScreenInit
初始化framebuffer信息

c) 显示图像像素相关的初始化及fbPictureInit
例如：
if (pScrn->bitsPerPixel > 8) {
VisualPtr visual;

    visual = pScreen->visuals + pScreen->numVisuals;
    while (--visual >= pScreen->visuals) {
        if ((visual->class | DynamicClass) == DirectColor) {
            visual->offsetRed   = pScrn->offset.red;
            visual->offsetGreen = pScrn->offset.green;
            visual->offsetBlue  = pScrn->offset.blue;
            visual->redMask     = pScrn->mask.red;
            visual->greenMask   = pScrn->mask.green;
            visual->blueMask    = pScrn->mask.blue;
        }
    }
}


fbPictureInit (pScreen, 0, 0);

#ifdef RENDER

if ((s = xf86GetOptValString(info->Options, OPTION_SUBPIXEL_ORDER))) {
if (strcmp(s, “RGB”) == 0) subPixelOrder = SubPixelHorizontalRGB;
else if (strcmp(s, “BGR”) == 0) subPixelOrder = SubPixelHorizontalBGR;
else if (strcmp(s, “NONE”) == 0) subPixelOrder = SubPixelNone;
PictureSetSubpixelOrder (pScreen, subPixelOrder);
}

#endif

这部分是fbPictureInit和对像素RGB顺序的初始化

d)BackStore相关的初始化
例如：
xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
“Initializing backing store\n”);
miInitializeBackingStore(pScreen);
xf86SetBackingStore(pScreen);

e)加速函数相关的初始化
例如：
if (info->r600_shadow_fb) {
xf86DrvMsg(scrnIndex, X_INFO, “Acceleration disabled\n”);
info->accelOn = FALSE;
} else {
xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
“Initializing Acceleration\n”);
if (RADEONAccelInit(pScreen)) {
xf86DrvMsg(scrnIndex, X_INFO, “Acceleration enabled\n”);
info->accelOn = TRUE;
} else {
xf86DrvMsg(scrnIndex, X_ERROR,
“Acceleration initialization failed\n”);
xf86DrvMsg(scrnIndex, X_INFO, “Acceleration disabled\n”);
info->accelOn = FALSE;
}
}
中的RADEONAccelInit(pScreen)函数
下面会对RADEONAccelInit(pScreen)函数做仔细的分析

f)光标显示相关的初始化
例如：

xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
               "Initializing DPMS\n");
xf86DPMSInit(pScreen, xf86DPMSSet, 0);

xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
               "Initializing Cursor\n");


xf86SetSilkenMouse(pScreen);


miDCInitialize(pScreen, xf86GetPointerScreenFuncs());

if (!xf86ReturnOptValBool(info->Options, OPTION_SW_CURSOR, FALSE)) {
    if (RADEONCursorInit_KMS(pScreen)) {
    }
}

其中xf86ReturnOptValBool(info->Options, OPTION_SW_CURSOR, FALSE)的判断决定对光标显示是否使用硬件加速

g）其他的初始化

例如CloseScreen，BlockHandler 等变量赋值
Crtc初始化xf86CrtcScreenInit (pScreen)
和colormap相关的drmmode_setup_colormap(pScreen, pScrn)。

(4)RADEONAccelInit

需要重点介绍的是RADEONAccelInit函数，因为在这个函数中引入了初始化图像加速相关的函数

以笔者调试过的RS780为例：
其调用的图形加速相关的初始化是R600DrawInit(pScreen)函数，因为驱动不支持RS780的xaa加速，而软件加速shodowfb效果不好，必须使用exa加速。
R600DrawInit()函数中包含了众多加速函数的初始化其中最重要的是如下5系列函数

a)Solid相关的函数
info->accel_state->exa->PrepareSolid = R600PrepareSolid;
info->accel_state->exa->Solid = R600Solid;
info->accel_state->exa->DoneSolid = R600DoneSolid;
Solid即是向某一区域填充色的操作

b)Copy相关的函数
info->accel_state->exa->PrepareCopy = R600PrepareCopy;
info->accel_state->exa->Copy = R600Copy;
info->accel_state->exa->DoneCopy = R600DoneCopy;
Copy是不同区域直接拷贝的函数

c）Composite函数
info->accel_state->exa->CheckComposite = R600CheckComposite;
info->accel_state->exa->PrepareComposite = R600PrepareComposite;
info->accel_state->exa->Composite = R600Composite;
info->accel_state->exa->DoneComposite = R600DoneComposite;
Composite是不同窗口组合在一起的操作

d）UploadToScreen函数
info->accel_state->exa->UploadToScreen = R600UploadToScreenCS;
UploadToScreen是向framebuffer拷贝矩形域数据的函数

e)DownloadFromScreen函数
info->accel_state->exa->DownloadFromScreen = R600DownloadFromScreenCS;
DownloadFromScreen是从framebuffer拷贝出矩形域数据的函数

至此radeon驱动初始化相关的内容做了一次简单的浏览。

X Window其实是一种规范，它有很多不同的实现，在Linux系统下最流行的是实现Xorg和XFree86，微软Windows系统下也有X Window的实现，苹果的Mac也是X Window的一种。要了解自己机器上运行的X Window究竟是哪一个，可以使用查看进程的ps命令
#ps –e |grep tty
　　Ubuntu 14.04使用的X Window是Xorg。如果使用ps -ef命令，还可以看到Xorg运行时的命令行参数。
在桌面系统上，X Server和Client程序往往安装在同一台机器上，日常使用基本感觉不到它是分层的。但是很显然，X Server和Client也可以分别运行在不同的机器上，在一台机器上运行程序，而在另外一台机器上显示图形界面。
在X Window中，Server偏偏是我面前的这台Ubuntu，X Server运行在Ubuntu上。我可以在CentOS中运行GVim，但是窗口显示在Ubuntu中，这时，GVim是一个Client程序，它在远程机器上运行，而它的窗口显示在本地。
理解display和虚拟控制台
　　很多介绍X Window的文章都是先让系统进入字符界面，然后手动启动一个X Server。其实这完全没有必要，因为在同一台机器上完全可以运行多个X Server，只需要让每个X Server的display不同即可。那么display究竟是什么？
　　在X Window中，可以通过hostname:display_number.screen_number来指定一个屏幕。可以这样理解：一台计算机可以有多个display，一个display可以有多个屏幕。所以，display相当于是计算机配备的一套输入输出设备，一般情况下，一台电脑只配一套键盘鼠标和一个显示器，特殊情况下，可以配多个显示器。
　　现在问题出来了，我的电脑只有一套键盘鼠标和一个显示器，也就是只有一个display，那又怎么能运行多个X Server呢？那是因为在Linux中，还有虚拟控制台这样的高级特性。只需要同时按下Ctrl+Alt+F1、Ctrl+Alt+F2、…、Ctrl+Alt+F7，就可以在不同的虚拟控制台中进行切换。在Ubuntu 14.04中，虚拟控制台1到6运行的getty，也就是字符界面，虚拟控制台7运行的是Xorg。（Fedora/centos中不一样，虚拟控制台1运行的是图形界面，其它的是字符界面。display:1运行在tty7上）
　　我们可以直接运行X Server程序来启动X Server。/usr/bin/X和Xorg都是X Server程序。其实/usr/bin/X是Xorg的符号链接，用哪一个都是一样的。
启动X Server的时候可以指定display参数，因为可以省略掉hostname和screen_number，所以可以用:0，:1这样的格式来指定display。在我的机器上，本来就有一个X Server在运行，display :0已经被占用了，所以我使用sudo X :1 -retro来在display :1上再运行一个X Server
　　其中的-retro参数是为了让X Server的背景显示为斜纹，否则背景为纯黑色，那就看不出来是否启动了X Server。
　　按Ctrl+Alt+F7回到display :0(ubuntu)，再用ps命令看一下，会发现系统中有两个Xorg在运行，一个运行在虚拟控制台7，一个运行在虚拟控制台8。
在新启动的X Server中运行一个GVim看看效果。运行GVim时，使用-display :1参数指定窗口显示在新启动的X Server上，使用-geometry参数指定窗口的大小和位置。然后按Ctrl+Alt+F8切换虚拟控制台，看效果。
#gvim –display :1 –geometry 700X500+20+20
远程连接X Server
如果能让远程机器上的GVim也把窗口显示在本地机器的屏幕上，那就比较过瘾了。所以，使用ssh连接到CentOS-5.10，然后使用gvim -display Ubuntu-14:1命令，希望将GVim显示到Ubuntu的display :1上。由于是远程连接，所以hostname不能省略，需写成ubuntu:1，也可以使用IP地址，写成192.168.1.103:1。
#gvim –display ubuntu:1
　　很可惜，连接失败。
　　失败的原因是远程访问X Server需要安全认证。这个可以理解，就像登陆邮箱需要输入用户名和密码一样，如果X Server不要认证就可以随便连接的话，那岂不是桌面上垃圾窗口满天飞？安全认证的方式有很多种，具体请参考man Xsecurity。安全认证可以使用xhost和xauth这两个程序来进行，具体使用方法参考它们的文档。(同时注意防火墙#iptables –F清除所有规则)
先用xhost来授权，这个比较简单。为了运行xhost，需要在X Server上有一个终端，所以运行一个xterm
#xterm –display :1
　　在xterm中输入sodu xhost +192.168.1.109，这样，CentOS-5.10中运行的GUI程序都可以连接到这个新开启的X Server了。（注每一个display的安全和环境都不一样，哪一个display需远程联接，哪个就需要授一次权）
在CentOS-5.10中运行GVim
#gvim –display 192.168.1.103:1
　　新启动的X Server界面比较丑陋，我们还是想让远程机器上的GUI程序直接显示在Ubuntu的桌面环境中。所以，指定display为:0
　　结果很不幸，无法打开display。连接不上，为什么呢？是安全认证的问题吗？不是，是lightdm的问题，请继续往下看。
理解lightdm和X Window桌面环境的启动过程
　　X Server的启动方式有两种，一种是通过显示管理器启动，另一种是手动启动。在前面的例子中，我通过直接运行/usr/bin/X :1来启动了一个X Server。直接启动X Server的方法还有运行startx或者xinit。手动启动X Server的缺点就是启动的X Server不好看。而显示管理器启动的不仅有X Server，还有一大堆的Client程序，构成了一个完整的桌面环境，界面当然就漂亮多了。
显示管理器（Display Manager）是什么呢？前面我讲到display就是一个电脑配备的一套键盘鼠标和显示器，那么显示管理器就是这一套设备的管理器了。显示管理器可以直接管理这些设备，所以它可以控制X Server的运行，由它来启动X Server那是再合适不过了。系统启动过程是这样的：内核加载–>init程序运行–>显示管理器运行–>X Server运行–>显示管理器连接到X Server，显示登录界面–>用户登录后，登录界面关闭，加载桌面环境。从上面的流程可以看出，显示管理器是X Server的父进程，它负责启动X Server，当X Server启动后，它又变成了X Server的一个Client程序，连接到X Server显示欢迎界面和登录界面，最后，显示管理器又是所有桌面环境的父进程，它负责启动桌面环境需要的其它Client程序。

在Ubuntu 14.04中，使用lightdm取代了传统的xdm、gdm等显示管理器。简单来说，就是由lightdm负责启动X Server和其它的X程序。不知道为什么，lightdm在启动X Server的时候，给X Server加上了-nolisten tcp参数，所以远程计算机就没有办法连接到Ubuntu的桌面了。

在debian/kali linux的环境中edit /usr/share/gdm/gdm.schemas, setting the key security/DisallowTCP to false

打开新的使用X :1 –listen tcp 因为默认是不打开tcp端口的，只打开6000一个端口。

下一步的目标就是更改lightdm的配置，去掉这个-nolisten tcp参数。
在使用sudo dpkg -L lightdm查看该软件包的文件时，发现它的log文件放在/var/log/lightdm文件夹下，过去看看：
　　终于，从log文件中看到了lightdm启动的全过程。首先，看到它从哪几个目录加载配置文件，接着，看到它启动X Server。从下图光标所在的行可以看到X Server启动的所有参数，包括-nolisten tcp选项。
　　继续看log文件，下面光标所在的行显示lightdm怎么启动gnome-session：
　　同时，我发现/etc/lightdm/目录下没有lightdm.conf文件，而/usr/share/doc/lightdm/目录下有一个lightdm.conf.gz文件，把该文件当文档看了一下，发现里面果然就是lightdm的配置的解释。赶快将该文件复制到/etc/lightdm/目录下并解压，然后用Vim编辑/etc/lightdm/lightdm.conf文件，将xserver-allow-tcp=false一行前面的注释去掉，并且改为xserver-allow-tcp=true。如下图：
　　最后，重启系统。再用ps查看进程，发现-nolisten tcp选项已经没有了。
搞定xauth
　　搞定了-nolisten tcp之后，要想从远程计算接连接到Ubuntu桌面，还是需要安全认证。在前面的例子中，我使用了xhost。xhost是最简单的认证方式。在这里我要试一下别的认证方式，比如MIT-MAGIC-COOKIE-1。如上图，先使用xauth list命令查看一下当前的授权记录，发现只有一条，而且display是ubuntu-14/unix:0，很显然，这是一个本地授权，所以需要使用xauth add命令添加一个使用ip地址的授权，后面的key照抄就行了。最后，使用xauth extract和xauth merge配合管道和ssh将该授权记录合并到CentOS-5.10中。
　　在CentOS-5.10中启动GVim，指定display为192.168.1.103:0，GVim窗口就出现在了Ubuntu中。
X Server的配置
　　可以使用不同的方法对X Server进行配置，前面的例子是直接指定命令行参数。除了指定命令行参数，还可以使用环境变量和配置文件。X Server的配置文件为一般是/etc/X11/xorg.conf或/etc/X11/xorg.conf.d/目录下的.conf文件，当然，配置文件也可以放在其它的目录中，具体信息，请参看man xorg.conf。
　　如果没有配置文件，X Server将在启动的时候自动检测硬件，然后生成一个内置的配置。Ubuntu系统就没有配置文件。不过没关系，如果需要使用配置文件的时候，可以通过X Server的-configure参数生成一个配置文件，里面包含当前自动检测出的配置。如果需要任何个性化的配置，对该文件进行修改即可。
现有的图形界面中可以运行嵌套的X Server
　　我们上面运行的X Server都是直接占用了计算机的整个显示器和键盘鼠标，事实上，在现有的图形界面中，还可以以窗口模式运行另外一个X Server，称为nested X Server。最常用的nested X Server是Xephyr，在Ubuntu中可以通过如下命令安装它：
sudo aptitude install xserver-xephyr （yum install Xephyr）
Xephyr的使用非常简单，可以通过 man Xephyr 命令查看它的使用手册。如果输入 Xephyr :1 (display号不能和已用dsiplay号冲突)命令，就可以在现有图形界面中打开一个窗口模式的X Server
　　以后再启动GUI程序，就可以通过程序的-display选项让程序运行在这个嵌套的X Server中，如：#xterm –display :1 &
　　怎么样，是不是很好玩呢？除了好玩，还很有用，比如调试窗口管理器啊、连接远程桌面啊什么的都用得着。当然，我这里只是简单展示一下原来X Window还可以这么玩。
总结：
　　1.在一个Linux系统中存在多个虚拟控制台，所以可以启动多个X Server；
　　2.启动X Server的方式有两种，一种是使用/usr/bin/X、startx、xinit手动启动，一种是通过显示管理器启动；
　　3.Ubuntu使用的显示管理器是lightdm，这是一个比较新的、轻量级的显示管理器，但是文档不够详细；
　　4.远程计算机连接本地的X Server，需要X Server开放TCP端口，还要搞定安全认证；
　　5.X Server的配置，可以通过命令行参数，可以通过环境变量，还可以通过配置文件；
　　6.可以在现有的图形界面下以窗口模式运行嵌套的X Server，常用的软件是Xephyr；
　　7.我的《Linux入门学习教程：Linux系统折腾笔记》中介绍的方法不够用，还要加上两条：①使用ps命令查看进程；②查看程序启动的log文件。
