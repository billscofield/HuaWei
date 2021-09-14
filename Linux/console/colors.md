
LS_COLORS environment variable is responsible for the colors that you see when you run the ls command.



# dircolors

    -b, --sh, --bourne-shell    output Bourne shell code to set LS_COLORS

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



## Basics of Terminal Color Codes

1. LS_COLORS key value pairs are separated by colon ( : ). The keys are
   predefined for the most part. Only the color values change.

1. The values have 2 or more parts separated by semicolon (;).
    
   For example, di=0;34, here di means the color should be applied to
   directories. 0 means it’s a normal color, and 34 means the color is green.

   If you want bold green font for the directories, the color code should be
   di=1;34. Here 1 means bold font.

   If you also want to specify a background color, you can append the code for
   it as well. For example, if you want yellow normal font on red background,
   then the code should be di=0;33;41

   字体粗细;前景色;背景色





### list of some of the available keys:

no	Global default
fi	Normal file
di	Directory
ln	Symbolic link.
bd	Block device
cd	Character device
or	Symbolic link to a non-existent file
ex	Executable file
*.extension	Example, *.mp3



### List of Available Color Codes:

31  = red	            40  = black background	            0   = default colour
32  = green	            41  = red background	            1   = bold
33  = orange	        42  = green background	            4   = underlined
34  = blue	            43  = orange background	            5   = flashing text
35  = purple	        44  = blue background	            7   = reverse field (exchange foreground and background color)
36  = cyan	            45  = purple background	            8   = concealed (invisible)
37  = grey	            46  = cyan background
90  = dark grey	        47  = grey background
91  = light red	        100 = dark grey background	
92  = light green   	101 = light red background	
93  = yellow	        102 = light green background	
94  = light blue	    103 = yellow background	
95  = light purple	    104 = light blue background	
96  = turquoise	        105 = light purple background	
97  = white	            106 = turquoise background	
107 = white background	
