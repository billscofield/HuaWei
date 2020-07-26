## screenkey

it’s useful to create screencasts and is also a powerful teaching tool.

apt install screenkey

debian 10 默认python2 环境报错???

## ascii

apt install ascii   //ascii表

    od 命令也有类似


## fim

用终端打开图片

apt install fim



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
