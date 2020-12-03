
minicom是一个串口通信工具，就像Windows下的超级终端。

默认情况下Ubuntu已经安装了USB转串口驱动(pl2303)

在使用minicom之前，首先要保证对串口有读/写的权限。Linux的设备对应于/dev/目录中的某个文件，串口COM1对应ttyS0，COM2对应ttyS1


**dmesg| grep usb查看串口设备，最后一行，这里设备号是ttyUSB0，用于后面的minicom串口设置**

dmesg| grep ttyUSB0，如果出现连接成功信息，则说明ubuntu系统已经识别该设备了。

lsmod| grep usbserial 如果有usbserial，说明系统支持USB转串口

cat /proc/tty/driver/serial 查看串口驱动



## 如何使用 minicom

配置 minicom

    minicom -s 

        -s, --setup
            Setup.  Root edits the system-wide defaults in /etc/minicom/minirc.dfl with this option.  When it  is
            used,  minicom  does  not initialize, but puts you directly into the configuration menu. This is very
            handy if minicom refuses to start up because your system has changed, or for the first time  you  run
            minicom. For most systems, reasonable defaults are already compiled in.


    +-----[configuration]------+
    | Filenames and paths      |
    | File transfer protocols  |
    | Serial port setup        |<---选择这个
    | Modem and dialing        |
    | Screen and keyboard      |
    | Save setup as dfl        |
    | Save setup as..          |
    | Exit                     |
    | Exit from Minicom        |
    +--------------------------+


    +-----------------------------------------------------------------------+
    | A -    Serial Device      : /dev/modem                                |   修改为  /dev/ttyUSB0
    | B - Lockfile Location     : /var/lock                                 |
    | C -   Callin Program      :                                           |
    | D -  Callout Program      :                                           |
    | E -    Bps/Par/Bits       : 115200 8N1                                |   修改为 9600 8N1
    | F - Hardware Flow Control : Yes                                       |
    | G - Software Flow Control : No                                        |
    |                                                                       |
    |    Change which setting?                                              |
    +-----------------------------------------------------------------------+



    +-----[configuration]------+
    | Filenames and paths      |
    | File transfer protocols  |
    | Serial port setup        |
    | Modem and dialing        |
    | Screen and keyboard      |
    | Save setup as dfl        | <--- 选择这个
    | Save setup as..          |
    | Exit                     |
    | Exit from Minicom        |
    +--------------------------+


    按下esc退出配置界面，此时如果串口有数据便会显示出来, 不行的话重新进入 minicom 


## Prompt

按下 Ctrl+a n 可以显示时间戳，常用的是simple的时间戳，显示到秒，

再按一次 Ctrl+a 显示extended的时间戳，精确到毫秒。



## 退出

ctrl-a x 或者 ctrl-a q 可以退出 minicom
