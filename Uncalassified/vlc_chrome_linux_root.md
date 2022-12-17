
https://www.tecmint.com/run-vlc-media-player-as-root-in-linux/

## Alternative Ways to Run VLC as Root User

Run the sed command below to make changes in the VLC binary file, it will
replace the geteuid variable (which determines the effective user ID of the
calling process) with getppid (which will determine the parent process ID of
the calling process).

In this command, ‘s/geteuid/getppid/‘ (regexp=geteuid, replacement=getppid)
does the magic.

$ sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc

Alternatively, edit the VLC binary file using a hex-editor such as bless,
hexeditor. Then search for geteuid string and replace it with getppid, save the
file and exit.


Yet again, another way around this is to download and compile the VLC source
code by passing the --enable-run-as-root flag to ./configure and VLC should be
able to run as root.

That’s all! You should now run VLC as root user in Linux. To share any thoughts,
use the feedback form below.


程序中用到的函数是geteuid()。geteuid就是get essensial user id，获取有效用户id。
每一个用户都有一个id，root用户id为0，普通用户id为1000以上。

知道原理后就可以得出解决办法了，就是将geteuid替换成getppid。getppid是获取此进程
的父进程id，由于它是独立进程，它的父进程就是init进程（启动后的第一个进程），进
程id为1，永远不可能为0。
