
# dircolors

1. Attribute codes: 字符属性

    00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed(隐藏)

2. Text color codes: 字符颜色

    30=black 31=red 32=green 33=yellow 34=blue 35=magenta(粉红) 36=cyan(淡蓝) 37=white

3. Background color codes: 字符背景色

    40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white

4. 

NORMAL 00 # global default, although everything should be something. 普通文件 终端默认颜色
FILE 00 # normal file 普通文件 终端默认颜色
DIR 01;34 # directory 目录 粗体-蓝字
LINK 01;36 # symbolic link. (If you set this to ‘target’ instead of a 符号链接 粗体-淡蓝字

# numerical value, the color is as for the file pointed to.)
FIFO 40;33 # pipe 管道API 黑底-黄字
SOCK 01;35 # socket 套接字API 粗体-粉红字
DOOR 01;35 # door 门API 粗体-粉红字
BLK 40;33;01 # block device driver 块设备驱动 粗体-黑底-黄字
CHR 40;33;01 # character device driver 字符设备驱动 粗体-黑底-黄字
ORPHAN 40;31;01 # symlink to nonexistent file 指向文件不存在的符号链接 粗体-黑底-红字
SETUID 37;41 # file that is setuid (u+s) 指定UID的文件 红底-白字
SETGID 30;43 # file that is setgid (g+s) 指定GID的文件 黄底-黑字
STICKY_OTHER_WRITABLE 30;42 # dir that is sticky and other-writable (+t,o+w) +t,o+w权限的文件 绿底-黑字(不常用)
OTHER_WRITABLE 34;42 # dir that is other-writable (o+w) and not sticky -t,o+w权限的文件 绿底-蓝字(不常用)
STICKY 37;44 # dir with the sticky bit set (+t) and not other-writable +t,o-w权限的文件 蓝底-白字(不常用)
