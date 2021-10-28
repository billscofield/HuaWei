
## amixer

command-line mixer for ALSA soundcard driver

ALSA是Advanced Linux Sound Architecture的缩写，高级Linux声音架构的简称,它在
Linux操作系统上提供了音频和MIDI（Musical Instrument Digital Interface，音乐设备
数字化接口）的支持。

在2.6系列内核中，ALSA已经成为默认的声音子系统，用来替换2.4系列内核中的OSS（Open
Sound System，开放声音系统）



amixer，是 alsamixer 的文本模式, 即命令行模式

简单点就用 alsamixer

我的 thinkpad t470 笔记本中常用的命令行有以下:

    amixer | less   查看设备和最大音量: Limits: Playback 0 - 127

        Simple mixer control 'Headphone',0
          Capabilities: pvolume pswitch
          Playback channels: Front Left - Front Right           
          Limits: Playback 0 - 127                              //音量调节范围
          Mono:
          Front Left: Playback 120 [94%] [-3.50dB] [off]        //当前音量
          Front Right: Playback 120 [94%] [-3.50dB] [off]       //当前音量

    amixer set Headphone playback 120

    amixer set Headphone playback 100+

    amixer set Master playback 100+


## alsamixer

是基于文本下的图形界面的

## PCM

CM的含义：

    1. PCM：Pulse Code Modulation的缩写，即是：脉冲编码调制。

    2. 脉冲编码调制的作用：将模拟的信号经过抽样、量化、编码转化成标准的数字信号。


https://www.cnblogs.com/jason-lu/articles/3123750.html

我们知道在现实生活中,人耳听到的声音是模拟信号,PCM就是要把声音从模拟转换成数字信
号的一种技术,他的原理简单地说就是利用一个固定的频率对模拟信号进行采样,采样后的
信号在波形上看就像一串连续的幅值不一的脉冲,把这些脉冲的幅值按一定的精度进行量化,
这些量化后的数值被连续地输出、传输、处理或记录到存储介质中,所有这些组成了数字音
频的产生过程.


PCM信号的两个重要指标是采样频率和量化精度,目前,CD音频的采样频率通常为44100Hz,量
化精度是16bit.通常,播放音乐时,应用程序从存储介质中读取音频数据(MP3、WMA、
AAC......),经过解码后,最终送到音频驱动程序中的就是PCM数据,反过来,在录音时,音频
驱动不停地把采样所得的PCM数据送回给应用程序,由应用程序完成压缩、存储等任务.所以,
音频驱动的两大核心任务就是:

    1. playback    如何把用户空间的应用程序发过来的PCM数据,转化为人耳可以辨别的
       模拟音频

    2. capture     把mic拾取到得模拟信号,经过采样、量化,转换为PCM信号送回给用户
       空间的应用程序

每个声卡最多可以包含4个pcm的实例,每个pcm实例对应一个pcm设备文件.pcm实例数量的这
种限制源于linux设备号所占用的位大小,如果以后使用64位的设备号,我们将可以创建更多
的pcm实例.不过大多数情况下,在嵌入式设备中,一个pcm实例已经足够了.

一个pcm实例由一个playback stream和一个capture stream组成,这两个stream又分别有一
个或多个substreams组成.


|                        +------------+
|                        |  snd_card  |
|                        +------------+
|                               |
|                              \|/
|   +----------------+--------------------------+-------------------+
|   |       pcm0     |          pcm1            |       pcm2        |
|   +----------------+--------------------------+-------------------+
|           |
|          \|/
|   +-------------------------+
|   | +---------+   +-------+ |
|   | |play back|   |capture| |
|   | |stream   |   |stream | |
|   | +---------+   +-------+ |
|   |     |             |     |
|   +-----+-------------+-----+
|         |             |
|        \|/           \|/
|   +------------+  +------------+
|   |+----------+|  |+----------+|
|   ||substream0||  ||substream0||
|   |+----------+|  |+----------+|
|   |            |  |            |
|   |+----------+|  |+----------+|
|   ||substream1||  ||substream1||
|   |+----------+|  |+----------+|
|   |            |  |            |
|   |+----------+|  |+----------+|
|   ||substream2||  ||substream2||
|   |+----------+|  |+----------+|
|   |            |  |            |
|   |+----------+|  |+----------+|
|   ||substream3||  ||substream3||
|   |+----------+|  |+----------+|
|   +------------+  +------------+
|
|   声卡中的pcm结构





## arecord,aplay

arecord, aplay - command-line sound recorder and player for ALSA soundcard driver

-l, --list-devices
    List all soundcards and digital audio devices

    当配置 ~/.asoundrc 时可以使用这个查看 card 设备号
    aplay -l

-L, --list-pcms
    List all PCMs defined

-D, --device=NAME
    Select PCM by name


## asoundrc 文件

https://www.alsa-project.org/main/index.php/Asoundrc
https://blog.csdn.net/u010312436/article/details/47839229
https://blog.csdn.net/kickxxx/article/details/8290294

.asoundrc文件和asound.conf两个配置文件并不是ALSA正常工作所必须的。大多少的应用
程序没有配置他们也能正常工作。 然而通过ALSA-lib库这两个文件能够为应用程序提供而
外的功能，如通道路由，样本rate转换。

alsa-lib 库 (at least on Debian libasound2-data 1.0.27) 将
/usr/share/alsa/alsa.conf 配置文件作为主要的入口点。其他文件在哪是否需要都由这
个文件觉定。 alsa.conf中自动加载系统全局自定义设置文件 /etc/asound.conf和用户自
定义配置文件： ~/.asoundrc。

这两个配置文件的调用是由 /usr/share/alsa/alsa.conf 定义

ALSA库定义的default 设备是 hw:0,0。 由!default指定的内容将替换ALSA lib API定义的。


PCM设备的命名规则：

    > hw:后面的数字代表声卡号和设备号。

    > hw:0,0 表示第一块声卡的第一个设备
    > hw:1,0 表示第二块声卡的第一个设备，
    > hw:2,1 表示第三块声卡的第二个设备，


    ```/root/.asoundrc
    pcm.!default {
        type hw
        card 0
    }

    ctl.!default {
        type hw
        card 0
    }
    ```
