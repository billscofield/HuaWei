## stty

https://www.ibm.com/docs/en/zos/2.2.0?topic=descriptions-stty-set-display-terminal-options

Print or change terminal characteristics, such as baud rate. Synopses:

stty [-F DEVICE | --file=DEVICE] [SETTING]...
stty [-F DEVICE | --file=DEVICE] [-a|--all]
stty [-F DEVICE | --file=DEVICE] [-g|--save]


If given no line settings, stty prints the baud rate, line discipline number
(on systems that support it), and line settings that have been changed from the
values set by ‘stty sane’. 


```stty
speed 38400 baud; line = 0;
erase = ^H;
-brkint ixany -imaxbel iutf8
```

-a：以容易阅读的方式打印当前的所有配置；


speed 38400 baud; rows 63; columns 206; line = 0;
    ```
    intr = ^C; quit = ^\; erase = ^H; kill = ^U; eof = ^D; eol = <undef>;
    eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R;
    werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
    -parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
    -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl -ixon -ixoff
    -iuclc ixany -imaxbel iutf8
    opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
    isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
    echoctl echoke -flusho -extproc
    ```

-g：以stty可读方式打印当前的所有配置。
    
    4900:5:bf:8a3b:3:1c:8:15:4:0:1:0:11:13:1a:0:12:f:17:16:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0


Many settings can be turned off by preceding them with a ‘-’. Such arguments
are marked below with “May be negated” in their description.


echoe
    Enable the ERASE character to visibly erase the latest character.
–echoe
    Do not enable the ERASE character to visibly erase the latest character.

    ````
    stty -echo
    read -p "Plz input ur password:"

    echo
    read -p "Plz input ur name:"

    echo $name
    echo $password
    ````


1. 屏蔽显示
    echo
        Echo every character typed.
    –echo   // shell 中输入密码时就要用到这个
        Do not echo every character typed.

1. 在命令行下，禁止输出大写的方法：

    stty iuclc     //开启
    stty -iuclc    //恢复

1. 在命令行下禁止输出小写：

    stty olcuc    //开启
    stty -olcuc   //恢复

1. 打印出终端的行数和列数：

    stty size
        63 206

1. 忽略回车符：

    stty igncr     //开启
    stty -igncr    //恢复
