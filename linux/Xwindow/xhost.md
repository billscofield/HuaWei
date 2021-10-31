

##

以下内容基于 redhat 6.7 

在修改了 /etc/hosts 的 loalhost 为其它名称后，在 远程主机 B 的命令行终端上不能运行 gvim 图形化程序, 报错信息如下:


```
E233: cannot open displayE852: The child process failed to start the GUI
Press ENTER or type command to continue
```


xdpyinfo - display information utility for X

Xdpyinfo  is  a utility for displaying information about an X server.  It is used to examine the capabilities of a server, 
the predefined values for various parameters used in communicating between clients and the server, and the different types 
of screens and visuals that are available.


DISPLAY用来设置将图形显示到何处.

直接登录图形界面或者登录命令行界面后使用startx启动图形，DISPLAY环境变量自动设置为:0:0，此时可以打开终端，输入图形程序的名称(比如xclock)来启动程序, 图形将显示在本地窗口上。

在终端中输入可以通过如下命令DISPLAY设置情况。

    1. echo $DISPLAY

    2. printenv

    3. xdpyinfo

DISPLAY 变量格式
    hostname: displaynumber.screennumber



在某些机器上，可能有多个显示设备共享使用同一套输入设备，例如在一台PC上连接两台CRT显示器，但是它们只共享使用一个键盘和一个鼠标。
这一组显示设备就拥有一个共同的displaynumber，而这组显示设备中的每个单独的设备则拥有自己单独的 screennumber。
displaynumber 和 screennumber 都是从零开始的数字。这样，对于我们普通用户来说， displaynumber、screennumber就都是0。 

hostname 指 Xserver 所在的主机主机名或者ip地址, 图形将显示在这一机器上, 可以是启动了图形界面的 Linux/Unix 机器, 也可以是安装了 
Exceed, X-Deep/32 等 windows 平台运行的 Xserver 的 Windows 机器. 如果Host为空, 则表示Xserver运行于本机, 

并且图形程序(Xclient)使用unix socket方式连接到Xserver, 而不是TCP方式. 
使用TCP方式连接时, displaynumber为连接的端口减去6000的值, 如果displaynumber为0, 则表示连接到6000端口; 
使用unix socket方式连接时则表示连接的unix socket的路径, 如果displaynumber为0, 则表示连接到/tmp/.X11-unix/X0 . screennumber则几乎总是0.


xhost 是用来控制X server访问权限的，这个命令将允许别的用户启动的图形程序将图形显示在当前屏幕上.。通常当你从hostA登陆到hostB上运行hostB上的应用程序时，做为应用程序来说，hostA是client,但是作为图形来说，是在hostA上显示的，需要使用hostA的Xserver,所以hostA是
server.因此在登陆到hostB前，需要在hostA上运行xhost +，来使其它用户能够访问hostA的Xserver.
xhost + 是使所有用户都能访问Xserver.
xhost + ip使ip上的用户能够访问Xserver.
xhost + nis:user@domain使domain上的nis用户user能够访问
xhost + inet:user@domain使domain上的inet用户能够访问。


设置DISPLAY环境变量：

```
export DISPLAY=:0.0
xhost +
    access control disabled, clients can connect from any host
```


https://www.cnblogs.com/kevin-boy/p/3223404.html

https://zhuanlan.zhihu.com/p/61101379

https://www.cnblogs.com/js1314/p/10373332.html

---

使用xdpyinfo可以查看到当前显示的更详细的信息.

xdpyinfo 记录下里面的name of display：后的字符串

xhost +

```
name of display:    localhost:10.0
version number:    11.0
vendor string:    Moba/X
vendor release number:    11603000
maximum request size:  16777212 bytes
motion buffer size:  256
bitmap unit, bit order, padding:    32, LSBFirst, 32
image byte order:    LSBFirst
number of supported pixmap formats:    7
supported pixmap formats:
    depth 1, bits_per_pixel 1, scanline_pad 32
    depth 4, bits_per_pixel 8, scanline_pad 32
    depth 8, bits_per_pixel 8, scanline_pad 32
    depth 15, bits_per_pixel 16, scanline_pad 32
    depth 16, bits_per_pixel 16, scanline_pad 32
    depth 24, bits_per_pixel 32, scanline_pad 32
    depth 32, bits_per_pixel 32, scanline_pad 32
keycode range:    minimum 8, maximum 255
focus:  PointerRoot
number of extensions:    21
    BIG-REQUESTS
    Composite
    DAMAGE
    DOUBLE-BUFFER
    GLX
    Generic Event Extension
    Present
    RANDR
    RECORD
    RENDER
    SGI-GLX
    SHAPE
    SYNC
    Windows-DRI
    X-Resource
    XC-MISC
    XFIXES
    XINERAMA
    XInputExtension
    XKEYBOARD
    XTEST
default screen number:    0
number of screens:    1

screen #0:
  dimensions:    3840x1080 pixels (1016x286 millimeters)
  resolution:    96x96 dots per inch
  depths (7):    24, 1, 4, 8, 15, 16, 32
  root window id:    0xe1
  depth of root window:    24 planes
  number of colormaps:    minimum 1, maximum 1
  default colormap:    0x20
  default number of colormap cells:    256
  preallocated pixels:    black 0, white 16777215
  options:    backing-store WHEN MAPPED, save-unders NO
  largest cursor:    32x32
  current input event mask:    0x80004
    ButtonPressMask          SubstructureNotifyMask   
  number of visuals:    64
  default visual id:  0x21
  visual:
    visual id:    0x21
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0xa2
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0xa3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits

    ... ...
```
