X Window 系统最早是由 MIT (Massachusetts Institute of Technology, 麻省理工学院)和 DEC 在 1984 年发展出来的，基于斯坦福大学的W Window

由於这个 X 希望能够透过网络(TCP/IP)进行图形介面的存取，因此发展出许多的 X 通讯协议，这些网络架构非常的有趣， 所以吸引了很多厂商加入研发，因此 X 的功能一直持续在加强！一直到 1987 年更改 X 版本到 X11 ，这一版 X 取得了明显的进步， 后来的窗口介面改良都是架构於此一版本，因此后来 X 窗口也被称为 X11 。这个版本持续在进步当中，到了 1994 年发布了新版的 X11R6 ，后来的架构都是沿用此一释出版本，所以后来的版本定义就变成了类似 1995 年的 X11R6.3 之类的样式。

在用户端想要取得来自服务器的图形数据时，我们用户端使用的当然是用户端的硬件设备啊， 所以，X Server 的重点就是在管理用户端的硬件，包括接受键盘/鼠标等设备的输入资讯， 并且将图形绘制到萤幕上

绘图总是需要一些数据才能绘制吧？此时 X Client (就是 X 应用程序) 就很重要啦！他主要提供的就是告知 X Server 要绘制啥东西。

**Project Athena** was a joint project of MIT, Digital Equipment Corporation, and IBM to produce a campus-wide distributed computing environment for educational use. It was launched in 1983, and research and development ran until June 30, 1991, eight years after it began. As of 2017, Athena is still in production use at MIT. 

was initially developed as part of Project Athena

gdm(the GNOME display manager)
    gdm
    lightdm

applet 小程序

ext2(The second Extended File System)



## desktop metaphor

metaphor 隐喻

桌面比拟（Desktop metaphor）在图形用户界面（Graphical user interface）中，是一个将“人们在实际生活中的操作与计算机操作”合一的概念，帮助使用者容易地与计算机交互。

桌面比拟将计算机（computer）的监视器（monitor）比拟成使用者的桌面，其上可以放置文件与文件夹。文件可以开一个窗口体现，代表一份文本的拷贝放在桌上。也有称为办公桌配件（像是桌面计算机之类）的小程序可以使用。

The computer interface is a conceptual metaphor of a writing desk.

gdm 应该就是 desktop metaphor 的缩写




## mutter

Mutter is a window manager initially designed and implemented for the X Window System, but then evolved to be a Wayland compositor. 

It became the default window manager in GNOME 3, replacing Metacity[5] which used GTK+ for rendering.

Mutter uses a graphics library called Clutter giving it OpenGL capability. Mutter is a portmanteau of Metacity and Clutter. Mutter can function as a standalone window manager for GNOME-like desktops, and serves as the primary window manager for the GNOME Shell,[6] which is an integral part of GNOME 3. Mutter is extensible with plug-ins, and supports numerous visual effects. GNOME Shell is written as a plug-in to Mutter.

debian 10 默认的



