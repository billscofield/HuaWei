
## 分辨率问题

nouveau 可以很轻松的支持自定义分辨率，但是 Nvidia 的好像不太容易

### nouveau 自定义分辨率

1. 
    ` cvt 1920 1080

    # 2560x1440 59.96 Hz (CVT 3.69M9) hsync: 89.52 kHz; pclk: 312.25 MHz
    Modeline "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

2. 
    ` xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

    而“1920x1080_60.00”是自己定义的新的模式的名称,如果你想要的分辨率是800x600,
    当然你可以改为"800x600"或者"800x600_60.00"(60.00只是标明刷新率是60，不是必
    要的)

3. 
    ` xrandr --addmode VGA-0 "1920x1080_60.00"

    注意，这里的VGA-0不是固定的，而是根据具体的设备定的，有可能是VGA-0，VGA-1又
    或者是DIV1，DIV0都有可能，可通过xrandr指令查看当前连接的是哪个设备，一般在
    xrandr指令输出信息的前几行可以看到有个 yyy connected xxxx,这个 yyy 就是你要使用
    的设备

4. 
    ` xrandr --output VGA-0 --mode"1920x1080_60.00"

    VGA-0 和“1920x1080_60.00"参数意思同上

    这步做完，就会发现分辨率已经修改好了，但是一重启之后，就会发现，又恢复到原
    来的低分辨率了，所以这里可以做一个脚本，使每次登录的时候都自动执行这个脚本
    ，那么只要一登录就会自动地把分辨率改过来了，系统会报“xxx不正常”的错误，但这
    个并不会影响使用。



### Nvidia 自定义分辨率

基础知识, 下一节讲解如何更改

https://brainwreckedtech.wordpress.com/2012/08/19/howto-get-nvidia-on-linux-to-use-custom-resolutions-over-dvi/

Video Electronics Standards Association(VESA)

The data format is defined by a standard published by the VESA

EDID,Extended display identification data，中文名称扩展显示器识别数据，是VESA在
制定DDC显示器数据通道通信协议时，制定的有关显示器识别数据的标准。EDID存储在显示
器中的DDC存储器中，当电脑主机与显示器连接后，电脑主机会通道DDC通道读取显示器DDC
存储器中的存储的EDID

EDID结构的标准从1994年发布DDC1.0时制定的EDID1.0开始，经过EDID→EDID1.1→EDID1.2→
EDID1.3

从EDID1.0→EDID1.3，EDID的容量都是128B

自EDID1.3后，VESA有制定了EDID2.0和E-EDID(增强型EDID)标准，其数据容量也扩大为
256B

EDID其中包含有关显示器及其性能的参数，包括供应商信息、最大图像大小、颜色设置、
厂商预设置、频率范围的限制以及显示器名和序列号的字符串等等。形象地说，EDID就是
显示器的身份证、户口本、技能证书等证件的集合，目的就是告诉别人我是谁，我从哪来
，我能干什么。

每种接口的特性和带宽不同，使得不同接口的EDID也不同。使用哪个接口，PC读到的就是
哪个接口的EDID。设备主要使用DVI、VGA、HDMI几种接口。

详细信息还是查看 [wikipedia](https://en.wikipedia.org/wiki/Extended_Display_Identification_Data)

---

[X Error of failed request: BadMatch](https://wiki.archlinux.org/title/Xrandr#Adding_undetected_resolutions)

xrandr --addmode might give you the error X Error of failed request: BadMatch.
NVIDIA users should read **NVIDIA/Troubleshooting#xrandr BadMatch**. BadMatch
could indicate an invalid EDID checksum. To verify that this is the case, run X
in verbose mode (e.g. startx -- -logverbose 6) and check your Xorg log for
messages about a bad EDID. 

[xrandr BadMatch](https://wiki.archlinux.org/title/NVIDIA/Troubleshooting#xrandr_BadMatch)

1. If you are trying to configure a **WQHD monitor** such as DELL U2515H using
   xrandr and xrandr --addmode gives you the error **X Error of failed request:
   BadMatch**, it might be because the proprietary([prəˈpraɪətri]专有的) NVIDIA
   driver clips(修剪) the **pixel clock maximum frequency** of HDMI output to
   225 MHz or lower. To set the monitor to maximum resolution you have to
   install nouveau drivers. You can force nouveau to use a specific pixel clock
   frequency by setting nouveau.hdmimhz=297 (or 330) in your Kernel parameters. 

   Pixel Clock Rate



2. it may be that your monitor's EDID is incorrect. See #[Override
   EDID](https://wiki.archlinux.org/title/NVIDIA/Troubleshooting#Override_EDID). 

    从windows 系统读取 edid 信息
    
    [get-edid.py](https://gist.github.com/mvollrath/9aa0198264e6b4890914)


    [Managing a Display EDID on Linux](https://nvidia.custhelp.com/app/answers/detail/a_id/3571/~/managing-a-display-edid-on-linux)
