
## xrandr

查看当前显示器的连接状况

    xrandr | less

        /connected  就是已连接的显示器

        笔记本自己的显示器叫做 eDP-1


## 设置双屏:

克隆模式:

    xrandr --output VGA1 --same-as HDMI1 --mode 1920x1080

扩展模式:

    xrandr --output VGA1 --right-of HDMI1 --auto

    xrandr --output HDMI1 --primary --auto --output VGA1 --auto --left-of HDMI1

     
