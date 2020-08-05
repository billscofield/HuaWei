
## i3

i3 requires an X-server and is not supported by Wayland. It is available as a metapackage that includes i3-wm, i3lock, i3status, dunst, and suckless-tools.(https://wiki.debian.org/i3)

i3 是一种动态的平铺式窗口管理器，其灵感来自于面向开发者与资深用户的 wmii。

i3 的既定目标包括清晰可读的文档，完善的多显示器支持，基于树形结构的窗口管理，提供 vim 式的多种操作模式。

i3这类窗口管理器与Xfce,KDE,Gnome，Cinnamon这类桌面软件专注于华丽的界面不同的是，更加专注于键盘控制，和效率提升，定制化。

i3 软件包组, 其中包含:

    1. i3-wm：窗口管理器

    1. i3status 和 i3blocks：这两个软件都可以通过管道向 i3bar 输送系统状态消息

    1. i3lock 则专于锁屏

xorg-server xorg-xinit  //运行图形界面需要的库(Arch)
lightdm         ??

启动方式

    从 xinitrc 启动


exit i3

    $mod + Shift + E 

重启i3

    $mod + shift + r    

    或者  

    i3 restart

    i3 must be restarted for the changes to take effect. This will not cause any applications to close, but may occasionally cause them to move.


### 安装

apt install i3

apt install xcompmgr    //设置半透明

apt install feh         //设置背景


注销后重新进入，选择登陆桌面管理器 i3

进行 mod 键设置

mod + enter 打开terminal

vi ~/.config/i3/config

exec --no-staretup-id xcompmgr &

exec_always --no-startup-id feh --bg-scale "/home/bill/Pictures/super.jpg"


### 修改默认桌面管理器为 i3

vi /etc/X11/default-display-manager

    /usr/sbin/gdm3 -> /usr/bin/i3       这个不管用啊

update-alternatives --configure x-window-manager    这个也不管用啊


### feh 壁纸工具

feh --bg-fill 文件
    --bg-scale
    --bg-center
    --bg-tiled
    --bg-seamless

feh --randomize --bg-fill  ~/Pictures/Wallpapers/


### 窗口透明度

#### 方法1：transset

transset工具用来设置单个窗口的透明度，透明特效可能会降低系统性能。

先启动要设置透明度的程序，然后运行：

transset n
.. 此处 n 是0到1之间的数字，0表示完全透明（不可见），1表示不透明。例如：transset .25 代表75%的透明度。

运行后，鼠标会变成十字形。点击要设置的窗口，即可应用透明度设置。



#### 方法2：compton

Compton 是一个独立的合成管理器，可以给不带合成功能的窗口管理器（例如 i3）带来淡入淡出、半透明、阴影等视觉效果。

Compton 是 xcompmgr-dana 的分支，而后者又是 xcompmgr 的分支。

类似的还有: conky

dpkg --listfiles compton
    
    /usr/share/doc/compton/examples/compton.sample.conf


关于配置文件

    man compton 
    /CONFIGURATION FILES

    If --config is not used, compton will seek for a configuration file in $XDG_CONFIG_HOME/compton.conf 
    (~/.config/compton.conf, usually), then ~/.compton.conf, then compton.conf under $XDG_CONFIG_DIRS (often /etc/xdg/compton.conf).


当前聚焦的窗口透明度低一些，其他窗口透明度高一些
    inactive-opacity = 0.5;     不透明度
    active-opacity = 0.8;


接下来在我的i3配置文件中写入

    exec_always compton -b

    这样每次打开i3wm都会后台运行compton。关闭compton可以输入pkill compton。


compton 如何重载配置文件???


### 快捷键

垂直方向上创建窗口      mod + v         
水平方向上创建窗口      mod + h

激活窗口                mod + 方向键    

创建工作区workspace     mod + 数字键

switch between different layout
    1) default layout(tiling)   mod + e
    2) stack layout             mod + s
    3) tab layout               mod + w



### arch 安装 wifi 到状态栏

pacman -Ss nm-connection-editor
pacman -Ss network-manager-applet


debian 10 默认安装了，需要将 netwoking 服务关闭, 并执行 nm-applet

```
systemclt disable networking
systemclt stop networking
nm-applet

```

或者使用 NetworkManager 的 nmcli 命令进行 WiFi 的连接

```
显示附近的 wifi:
$ nmcli device wifi list

连接 wifi:
$ nmcli device wifi connect SSID password password

连接到隐藏的 wifi:
$ nmcli device wifi connect SSID password password hidden yes

通过 wlan1 wifi 网卡(interface)连接 wifi:
$ nmcli device wifi connect SSID password password ifname wlan1 profile_name

断开一个网卡(interface)上的连接:
$ nmcli device disconnect ifname eth0

重新连接一个被标记为“已断开”的网卡：
$ nmcli connection up uuid UUID

显示一个所有连接过的网络的UUID的列表:
$ nmcli connection show

查看所有网络设备及其状态:
$ nmcli device

关掉 wifi:
$ nmcli radio wifi off
```


### 多屏显示 xrandr

primitive command line interface to RandR extension

类似的有: arandr


查看当前显示器接口

    xrandr

--output:指定显示器。 
--mode:指定一种有效的分辨率。 
--rate:指定刷新率。


同步模式可以输入

    xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP --auto

    其中1920x1080是我外接显示器的分辨率

扩展模式则可以输入

    xrandr --output eDP-1 --left-of HDMI-A-0 --auto

    --left-of 就是eDP在HDMI的左面，对应的命令还有

    --right-of 谁在谁的右面

    --above 谁在谁的上面

    --below 谁在谁的下面

1. 将视频输出发送到某个接口设备:

    $ xrandr --output DFP1 --auto

2. 设置分辨率时需要指定设置的output及mode，如将LVDS-1的分辨率改为1920×1080，命令就是：

xrandr --output eDP1 --mode 1920x1080 
--output:指定显示器。 
--mode:指定一种有效的分辨率。 
--rate:指定刷新率。

3. 添加有效分辨率

如果xrandr查询结果中没有合适的分辨率，则可以通过newmode来

添加，下面将给出eDP1添加1280x1024x60的分辨率方法。

3.1 使用cvt生成一个modeline，命令如下：

    ```
    $cvt 1280  1024  60
    #1280x1024 59.89 Hz (CVT 1.31M4) hsync: 63.67 kHz; pclk: 109.00 MHz
    Modeline "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
    ```

3.2 使用newmode创建一个mode，参数就是上面的modeline后的内容:

    ```
    $xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
    ```

3.3 新建模式，将新模式添加至当前输出设备,如果出错，则说明不支持此模式

```
$xrandr --addmode eDP1 1280x1024_60.00
```

3.4 设置newmode为当前分辨率

```
$xrandr --output eDP1 --mode 1280x1024_60.00
```

4 . 关闭某个接口设备的视频输出。

```
$ xrandr --output LVDS --off
```

5.设置双屏幕显示：

(1)打开外接显示器，双屏幕显示相同的内容--克隆，（auto为最高分辨率）

```
xrandr --output VGA-0 --same-as DVI-D-0 --auto
```

(2）若要指定外接显示器的分辨率可以使用下面的命令（1280x1024）：

```
xrandr --output VGA-0 --same-as DVI-D-0 --mode 1280x1024
```

(3）打开外接显示器，设置为右侧扩展

```
xrandr --output VGA-0 --right-of DVI-D-0 --auto
```

（4）关闭显示器

```
xrandr --output VGA-0 --off
```

（5）打开VGA-0接口显示器，关闭DVI-D-0接口显示器

```
xrandr --output VGA-0 --auto --output DVI-D-0 --off
```

（6）设置HDMI2为主屏幕

```
$ xrandr --output HDMI2 --auto --primary
```

(7) 设置eDp1在HDMI2的右面

```
$ xrandr --output eDP1 --right-of HDMI2 --auto
```



### 音量 amixer

command-line mixer for ALSA soundcard driver

amixer set Master playback 5000+                //本身外放
amixer set Headphone playback 5000+             //耳机

amixer 查看设置的值


vi ~/.config/i3/config

```
bindsym $mod+F3 exec amixer set Master 5%+
bindsym $mod+F2 exec amixer set Master 5%-
bindsym $mod+F1 exec amixer set Master toggle
```


### 亮度

cat /sys/class/backlight/intel_backlight

#### 功能脚本

```
bright_file=/sys/class/backlight/intel_backlight

step=$1

step=$(( $step + $(cat $bright_file) ))

if [ step -gt 100 ];then
    echo step > $bright_file
fi
```

chmod +x 脚本


#### 加入 i3wm 快捷键

vi ~/.i3/config

bindcode 键码 exec 脚本路径

或

bindsym 键码 exec 脚本路径


#### 重新加载 i3wm 配置

$mod + shift + c


### 开机自动启动

debian buster 使用的是 gdm3 


### i3 /etc/i3status.conf

man i3status 上边有写配置文件路径在哪里


mkdir ~/.config/i3status/
cp /etc/i3status.conf ~/.config/i3status/


下面的显示顺序

vi ~/.config/i3status/config

    order += "ipv6"
    order += "disk /"
    order += "wireless _first_"
    order += "ethernet _first_"
    order += "battery all"
    order += "load"
    order += "tztime local"




显示网速, 好像不太好用，再看吧

https://github.com/i3/i3status/blob/master/contrib/net-speed.sh

下载 net-speed.sh, chmod +x


如何重新加载配置呢?


i3status可选方案

    https://wiki.archlinux.org/index.php/I3


### 关于 mod 键

!一下配置的目的是为了更好地使用i3wm, i3wm 默认是 win 键 或者 alt 键，但是在 ~/.config/i3/config 中配置了 Mod = lock 后提示错误，只好如此先用着，待以后找原因

vi ~/.xmodmap
```
clear lock
clear mod4
keycode 133 = Caps_Lock
keycode 66 = Super_L
add lock = Caps_Lock
add mod4 = Super_L
```




### 锁屏 i3lock 

默认的是 i3lock
    
    锁屏状态没有背景图像, 没有提示

i3lock-fancy 虚化背景，文字提示

    apt install i3lock-fancy

自动锁屏

    vim ~/.i3/config
    exec --no-startup-id xautolock -time 1 -locker blurlock


### 自动休眠 xautolock

一段时间后自动锁屏工具，好像不管用啊???

---

可以用 DPMS 实现黑屏，或是睡眠／关掉显示器。在 ~/.i3/config 添加以下，效果是显示器闲置十分钟后就会自动睡眠。

    exec —no-startup-id xset dmps 600

    https://www.zhihu.com/question/344543356/answer/818710052

    https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling







