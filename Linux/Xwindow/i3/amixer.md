
## amixer

command-line mixer for ALSA soundcard driver

ALSA是Advanced Linux Sound Architecture的缩写，高级Linux声音架构的简称,它在
Linux操作系统上提供了音频和MIDI（Musical Instrument Digital Interface，音乐设备
数字化接口）的支持。

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

