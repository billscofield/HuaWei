## screenkey

it’s useful to create screencasts and is also a powerful teaching tool.

apt install screenkey

debian 10 默认python2 环境报错???

## ascii

apt install ascii   //ascii表

    od 命令也有类似

## vim-youcompleteme

YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
for Vim. It has several completion engines: an identifier-based engine
that works with every programming language, a semantic, Clang-based
engine that provides native semantic code completion for
C/C++/Objective-C/Objective-C++ and an omnifunc-based completer that uses data
from Vim's omnicomplete system to provide semantic completions for many
other languages (Ruby, PHP etc.).


## neofetch

Shows Linux System Information with Distribution Logo
Neoftech is a cross-platform and easy-to-use system information
command line script that collects your Linux system information
and display it on the terminal next to an image, it could be your
distributions logo or any ascii art of your choice.


## libimage-exiftool-perl 

library and program to read and write meta information in multimedia files

修改图片 exif 信息

exif: Exchangeable image file format

是专门为数码相机的照片设定的，可以记录数码照片的属性信息和拍摄数据。

JPEG（发音为jay-peg,IPA：[ˈdʒeɪpɛg]）


## fim

用终端打开图片

apt install fim


## cmus

lightweight ncurses audio player

You can add keybindings for just about anything - including seeking (forward/backwards 1 minute, for example) which isn't supported by all music players.

## iputils-ping

ping

## wondershaper

对网卡进行限速
wondershaper - simple traffic shaping script

wondershaper其实是tc的一个封装

apt install wondershaper

SYNOPSIS
    wondershaper [ interface  ]
        Shows the status of traffic shaping on that interface.

    wondershaper clear [ interface  ]
        Removes all traffic shaping from that interface.

    wondershaper [ interface  ] [ downlink  ] [ uplink  ]
        Configures the wondershaper on the specified interface, given the specified downlink speed in kilo‐
        bits per second, and the specified uplink speed in kilobits per second.


## ethstatus

ethstatus可以监控实时的网卡带宽占用。

这个软件能显示当前网卡的 RX 和 TX 速率，单位是Byte

安装 sudo apt-get install ethstatus

查看 网卡 的速度 sudo ethstatus -i 网卡


## GhostScript

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

如果-dPDFSERRINGS=/screen这个选项转换的PDF效果太差可以考虑更换为-dPDFSETTINGS=/ebook来获取更好的效果，如果直接去掉这个选项就是相当于默认使用-dPDFSETTINGS=/prepress

-sDEVICE=device
    Selects an alternate initial output device, as described above.

-sOutputFile=filename
    Selects an alternate output file (or pipe) for the initial output device, as described above.

-dNOPAUSE
    Disables the prompt and pause at the end of each page.  This may be desirable for applications where another program is driving Ghostscript.

-q     Quiet startup: suppress normal startup messages, and also do the equivalent of -dQUIET.


-dBATCH  exit after last file

-sOutputFile=<file> select output file: - for stdout, |command for pipe, embed %d or %ld for page #



## snort - flexible Network Intrusion Detection System



## screenfetch

screenFetch is a "Bash Screenshot Information Tool". This handy Bash script
can be used to generate one of those nifty terminal theme information + ASCII
distribution logos you see in everyone's screenshots nowadays.

It will auto-detect your distribution and display an ASCII version of that
distribution's logo and some valuable information to the right. There are
options to specify no ascii art, colors, taking a screenshot upon displaying
info, and even customizing the screenshot command.



## to disable Ctrl-s in terminal

https://unix.stackexchange.com/questions/332791/how-to-permanently-disable-ctrl-s-in-terminal#comment586158_332791

stty -ixon

or write it in .bashrc

```
As others have mentioned, the required fix is adding stty -ixon to your ~/.bashrc file. However, it should be protected from execution by non-interactive shells:

if [[ -t 0 && $- = *i*  ]]
then
    stty -ixon
    fi 
    This should avoid errors when there is no TTY or interactive session in the first place, so "internal" shell invocations of desktop environments etc. will not cause error messages.



Adding to telcoM's solution, Arch's default .bashrc has this:

# If not running interactively, don't do anything
[[ $- != *i*  ]] && return
It is worth checking if your bashrc already has such checks, therefore avoiding the need for additional ifs.
```


## xdotool

是一个模拟鼠标键盘操作的工具，比如用加盘模拟鼠标滚轮的滑动。



## 截图

shutter 不是官方的软件包，需要添加ppa

ksnapshot 好大，190MB

scrot


## 流量监测

1. Nethogs - Net top tool grouping bandwidth per process

hogs: n, 猪; v,独占

NetHogs是一个开源的命令行工具（类似于Linux的top命令），用来按进程或程序实时统计网络带宽使用率。

NetHogs是一个小型的net top工具，不像大多数工具那样拖慢每个协议或者是每个子网的速度而是按照进程进行带宽分组。NetHogs不需要依赖载入某个特殊的内核模块。如果发生了网络阻塞你可以启动NetHogs立即看到哪个PID造成的这种状况。这样就很容易找出哪个程序跑飞了然后突然占用你的带宽。

apt install nethogs


INTERACTIVE CONTROL
    m      cycle between display modes (kb/s, kb, b, mb)

    r      sort by 'received'

    s      sort by 'sent'

    q      quit



1. nload

回车键在多个网卡间切换



## graphviz

apt install graphviz

rich set of graph drawing tools, 代替 Viso 等画图工具

graphviz包含3中元素，图，节点和边


## 打字练习

apt install typespeed

/usr/games/typespeed


## chrome --no-sandbox

问题
    https://unix.stackexchange.com/questions/68832/what-does-the-chromium-option-no-sandbox-mean


    the sandbox removes unnecessary privileges from the processes that don't need them in Chrome, for security purposes. 
    Disabling the sandbox makes your PC more vulnerable to exploits via webpages, so Google don't recommend it 

google的说明
    https://www.google.com/googlebooks/chrome/med_26.html


### edge 

https://www.microsoftedgeinsider.com/zh-cn/download/?platform=linux

下载 deb安装包



## supervisor

守护进程



## smartmontools



## pv 

apt-cache show pv
apt-get install pv

PV 由Andrew Wood 开发，是 Pipe Viewer 的简称，意思是通过管道显示数据处理进度的信息。这些信息包括已经耗费的时间，完成的百分比（通过进度条显示），当前的速度，全部传输的数据，以及估计剩余的时间。

"要使用 PV，需要配合合适的选项，把它放置在两个进程之间的管道。命令的标准输入将会通过标准输出传进来的，而进度会被输出到标准错误输出。”"



从左到右，显示的信息是：

1. The data transferred so far.                        数据传输到此为止。

2. The time elapsed fo far.                            时间已经过去了。

3. The data transfer rate (throughput).                数据传输速率(吞吐量)。

4. A progress bar and a percentage completed figure.   进度条和完成百分比。

5. The estimated time left before completion (ETA).    完成之前预计剩余的时间(ETA)。

### 例子

pv /media/dave/SILVERXHD/gparted-live-1.0.0-1-amd64.iso | zip > gparted.zip

1. 复制单个文件
    pv /media/dave/SILVERXHD/gparted-live-1.0.0-1-amd64.iso > gparted.iso

1. 要使用pv复制多个文件和文件夹，我们需要使用一些技巧。 我们使用tar为我们移动文件。

    tar -c help-files/ | pv | tar -x -C Documents/

1. 使用pv和tar创建档案 (Using pv and tar to Create an Archive)
    tar -czf - ./help-files/ | pv > help-files.tgz



## autojump

git clone https://gitee.com/billscofield/autojump.git

python install.py   // Python v2.6+ or Python v3.3+



## tmux

mkdir ~/.tmux 
cd ~/.tmux
git clone https://github.com/tmux-plugins/tmux-resurrect.git

tmux source-file ~/.tmux.conf

### 保存会话

先按下【ctrl+b】前缀，再按下【ctrl+s】就可以保存，可以看到终端最下面有提示:
Tmux environment saved!

按下【ctrl+d】退出tmux
此时输入tmux a，会通知没有会话

### 恢复会话

先打开tmux
先按下前缀，再按下【ctrl+r】就可以恢复之前的会话啦



## net-tools


## dnsutils

dig - query the DNS in various ways
nslookup - the older way to do it
nsupdate - perform dynamic updates (See RFC2136)

