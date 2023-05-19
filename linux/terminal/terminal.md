
/usr/share/terminfo

linux的终端信息放在 /usr/share/terminfo下，在这个目录的子目录v下就有许多的如vt100,vt102,vt200


## terminal

Terminals usually support a set of escape sequences for controlling color,
cursor position, etc. Examples include the family of terminal control sequence
standards known as ECMA-48, ANSI X3.64 or ISO/IEC 6429

Linux Documentation Project
    https://tldp.org/HOWTO/pdf/Text-Terminal-HOWTO.pdf

## [vt100](https://en.wikipedia.org/wiki/VT100)

The VT100 is a video terminal, introduced in August 1978 by Digital Equipment
Corporation (DEC). It was one of the first terminals to support ANSI escape
codes for cursor control and other tasks, and added a number of extended codes
for special features like controlling the status lights on the keyboard. This
led to rapid uptake of the ANSI standard, which became the de facto standard
for hardware video terminals and later terminal emulators

The VT100 series, especially the VT102, was extremely successful in the market,
and made DEC the leading terminal vendor at the time. The VT100 series was
replaced by the VT200 series starting in 1983, which proved equally successful.
Ultimately, over six million terminals in the VT series were sold, based
largely on the success of the VT100

**DEC's first video terminal was the VT05 (1970)**, succeeded by the VT50 (1974),
and soon upgraded to the VT52 (1975). **The VT52 featured a text display with 80
columns and 24 rows, bidirectional scrolling, and a custom control protocol
that allowed the cursor to be moved about the screen.** These "smart terminals"
were a hit due both to their capabilities and to their ability to be run over
inexpensive serial links, rather than custom proprietary connections as in the
case of systems like the IBM 3270, which generally required expensive
controllers for distributed applications. In contrast, "**dumb terminals**" or
"**glass teletypes**" like the **ADM-3A** (1976) lacked advanced features such as full
cursor addressability, and competed mostly on lowest possible hardware cost.

**The VT100 was introduced in August 1978, replacing the VT50/VT52 family**.
Like the earlier models, it communicated with its host system over serial lines
at a minimum speed of 50 bit/s, but increased the maximum speed to 19,200 bit/s,
double that of the VT52. The terminal provided an option for "smooth scrolling",
whereby displayed lines of text were moved gradually up or down the screen to
make room for new lines, instead of advancing in sudden "jumps". This made it
easier to scan or read the text, although it somewhat slowed down the maximum
data rate

In 1983, the VT100 was replaced by the more powerful VT200 series terminals
such as the VT220



vt05    1970  DEC's first video terminal
vt50    1974
vt52    1975
vt100   1978
vt200   1983


## ANSI escape code

**ANSI escape sequences** are a standard for **in-band signaling** to control cursor
location, color, font styling, and other options on video text terminals and
terminal emulators. Certain sequences of bytes, most starting with an ASCII
escape character and a bracket character, are embedded into text. The terminal
interprets these sequences as commands, rather than text to display verbatim.

**ANSI sequences were introduced in the 1970s to replace vendor-specific
sequences** and became widespread in the computer equipment market by the early
1980s. They are used in development, scientific, commercial text-based
applications as well as bulletin board systems to offer standardized
functionality.

Although **hardware text terminals** have become increasingly rare in the 21st
century, the relevance of the ANSI standard persists because a great majority
of terminal emulators and command consoles interpret at least a portion of the
ANSI standard.


注:
    1. In telecommunications, **in-band signaling** is the sending of control
       information within the same band or channel used for data such as voice
       or video. This is in contrast to out-of-band signaling which is sent
       over a different channel, or even over a separate network

    2. hardware text terminal

        https://hackaday.io/project/13273-diy-vt100-a-miniature-hardware-terminal


## xterm

XTerm是一个X Window System上的终端模拟器，用来提供多个独立的SHELL输入输出。最先
是Jim Gettys的学生Mark Vandevoorde在1984年夏天为VS100写的独立虚拟终端，当时X的
开发刚刚开始。

## xrdb

xrdb - X server resource database utility

Xrdb does not load any files on its own, but many desktop environments use xrdb
to load **~/.Xresources** files on session startup to initialize the resource
database, as a generalized replacement for **~/.Xdefaults** files.

配置文件 .Xdefaults

    The file called .Xdefaults in your home directory is loaded into the X
    server using the xrdb program when you start your X session.

    In this file, each X application has a number of options which can be set,
    such as reverse video, window size, window location, and many others.

    You can set these options so that they are set every time you start up an
    application. A line in your .Xdefaults file follows this format:

        name.class.resource: value


### 1. name

name is usually the name of the program (e.g., xterm, or xclock). You can,
however, change the name a program uses to find its options in the .Xdefaults
by invoking the command with -name argument.

### 2. class

is used for grouping resources together. For example, the class Geometry would
contain all the resources which affect the geometry of any of the application's
windows. 

The names of classes conventionally start with an upper-case letter.


!!! xprop

    xprop - property displayer for X

    The xprop utility is for displaying window and font properties in an X server.

    Those classes, which are understood by each application program, are
    described in the manual entry for that program or you can use xprop.

    Simply start up the X program in question, type "xprop" at a unix prompt,
    and click in the window of the X program. This will give you the class and
    instance of the program.

    For example, using xprop on an "xterm" window gives:

```
WM_STATE(WM_STATE):
		window state: Normal
		icon window: 0xc004a2
WM_PROTOCOLS(ATOM): protocols  WM_DELETE_WINDOW
WM_CLASS(STRING) = "xterm", "XTerm"
WM_HINTS(WM_HINTS):
		Client accepts input or input focus: True
		Initial state is Normal State.
WM_NORMAL_HINTS(WM_SIZE_HINTS):
		program specified size: 899 by 412
		program specified minimum size: 30 by 21
		program specified resize increment: 11 by 17
		program specified base size: 19 by 4
WM_CLIENT_MACHINE(STRING) = "america.ecn.purdue.edu"
WM_COMMAND(STRING) = { "xterm" }
WM_ICON_NAME(STRING) = "xterm"
WM_NAME(STRING) = "xterm"


There can actually be more than one class for a given object. That is, there
can be classes of classes. A good example of this is xterm which has a major
class (or "super-class") called VT100, and several minor classes (or
"sub-classes"), such as Font, Geometry, so on. Generally, if you're not sure of
how many classes and sub-classes there are, you can use the "*" character to
specify "match anything".
```


### 3. resource

indicates the name of some resource whose value can be changed. Some resources
include foreground (the foreground color), background (the background color),
geometry (the size and location of the window), ScrollBar, (indicate whether or
not scrollbars should be used) and so on.

The names of resources conventionally start with a lower-case letter. 

Each application program has a different set of resources which you can modify;
they are described in the manual entry for the program.


Note on class and resource names: Capitalization is used to distinguish class
names from resource names.

Class names always begin with a capital letter, while resource names always
begin with a lowercase letter.

Note however that if a resource name is a compound word (such as cursorColor),
the second word is capitalized.


### 4. value

can be set to three types:
integer (a whole number)
Boolean (on/off, yes/no)
string (sequence of characters, e.g., a pathname or window title).



### Changing the Foreground and Background Colors

To change the foreground color for an application, use the -fg command line
option or the foreground resource.

For example, suppose you have a color display and want the text in your xterm
windows to be blue instead of black:

```
xterm -fg blue &

---
.Xdefaults
    XTerm*foreground:blue

```

To change the background color, use the -bg command line option or the
background resource.

For example, suppose you want the same xterm window on your color display to
have a yellow background instead of white:

```
xterm -bg yellow &

---

.Xdefaults
    XTerm*background:yellow
```


### Reverse-video Option

The -rv (reverse-video) command line option specifies that a client be started
with its foreground and background colors swapped.

In many cases, this means that a window will be white on black, rather than
black on white.





### 终端 TTY

TTY 是 TeleTYpe 的缩写，叫电传打字机，一个类似电报机的设备。这个也就是最早期的终端。

它原本的用途是在电报线路上收发电报，但鉴于它既能通过键盘发送信号，又能将接受到
的信号打印在纸带上，最最最重要的是价格低廉，它就被 Unix 的创始人 Ken Thompson
和 Dennis Ritchie 用于连接到计算机上，让多个用户都可以通过终端登陆操作主机，所
以它就成了第一个 Unix 终端。


### 控制台 CONSOLE

CONSOLE 是控制台的意思，它是一种特殊的终端，特殊的地方是它和计算机主体是一体的，
是专门用来管理主机的，只能给系统管理员使用，有着比普通终端高的权限。

一般一台计算机上只有一个控制台，但可以连很多终端。 CONSOLE 和 TTY 都算是终端，
硬要说区别就是亲儿子和干儿子或 root 和非 root 用户的关系。


### 终端模拟器

终端模拟器 Terminal Emulator 也叫终端仿真器。它加上键盘和显示器共同构建了以前的
终端。它的工作流程如下：

    捕获键盘输入（ STDIN ）
    将输入发送给命令行程序（ SHELL ）
    拿到命令行程序的输出结果（ STDOUT 和 STDERR ）
    调用图形接口，将输出结果渲染到显示器上


### 终端窗口和虚拟控制台

**终端模拟器**分为两种，一种是终端窗口，就是我们一般运行在图形用户界面里的，像
GNU/Linux 下的 gnome-termial， mac 下的 iterm2, windows 下的 wsl-terminal。

另一种叫**虚拟控制台**，像 Ubuntu 系统中，通过 Ctrl+Alt+F1,F2...F6 等组合键可以切换
出全屏的终端界面（ Ctrl+Alt+F7 可以切回图形界面），这就是虚拟控制台。它是直接由
操作系统内核直接提供的。

链接：https://www.jianshu.com/p/691425a9daae



tty0就是/dev/console
只有系统或超级用户root可以向/dev/tty0进行写操作。tty0是系统自动打开的，但不用于用户登录

使用ALT+F2进行切换时，系统的虚拟控制台为/dev/tty2 ，当前控制台（/dev/tty）则指向/dev/tty2

通过ssh登录一台服务器以后，就会在/dev/pts/下生成一个控制台设备文件，对应ttyＮ，通常情况下，1<=n<=63）

    echo "test" > /dev/tty


串行端口终端(/dev/ttySn)
    COM1口

控制台终端(/dev/ttyn, /dev/console)

    在Linux 系统中，计算机显示器通常被称为控制台终端 (Console)。它仿真了类型为
    Linux的一种终端(TERM=Linux)，并且有一些设备特殊文件与之相关联：tty0、tty1、
    tty2 等。当你在控制台上登录时，使用的是tty1。使用Alt+[F1—F6]组合键时，我们
    就可以切换到tty2、tty3等上面去。

    tty1–tty6等称为虚拟终端，而**tty0**则是当前所使用虚拟终端的一个别名，系统所产生
    的信息会发送到该终端上（这时也叫控制台终端）。因此不管当前正在使用哪个虚拟
    终端，系统信息都会发送到控制台终端上。

    /dev/tty0 points to the active tty terminal
    cat /sys/devices/virtual/tty/tty0/active


    不管对那个进程来说/dev/tty0指向的都是当前的虚拟终端.


    /dev/console即控制台，是与操作系统交互的设备，系统将一些信息直接输出到控制
    台上。目前只有在单用户模式下，才允许用户登录控制台。
