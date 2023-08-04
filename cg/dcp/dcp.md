# DCP

[Digital Cinema Package](https://en.wikipedia.org/wiki/Digital_Cinema_Package)


A Digital Cinema Package (DCP) is a collection of digital files used to store
and convey digital cinema (DC) audio, image, and data streams.

目前在数字电影发行包（DCP）命名方面存在着一些问题。命名者和查找者一般都会希望在
DCP名字包含更多的属性信息，但目前数字电影播放服务器在操作屏上一屏只能显示有限字
符，不能完全显示长文件名文件。如果命名过长，一些信息将不可见，除非进行滚屏操作。
如果服务器的存储中同时有好几部影片，那么查找起来会遇到困难，尤其是有许多版本的
预告片，还和影片正片 拥有同样名字的时候。 

比如，一部影片的正片DCP文件名如下：

    Pirates_Of_The_Caribbean_At_World`s_End_Feature_2.39_English_Spanish_subtitles_United_States_Rated_PG-13_5.1_Audio_2K

    （该名字所包含的属性信息有：《加勒比海盗：在世界的尽头》2.39变形宽银幕版，英语，西班牙语字幕，美国评级PG-13,5.1声道，2K清晰度） 


数字电影播放服务器却只能显示40个英文字符，你将只能看到：
Pirates_Of_The_Caribbean_At_World`s_End_从以上名字的信息，无法得知影片是正片还
是预告片，是遮幅宽银幕还是变形宽银幕。 

因此，制片厂和合作协会数字电影论坛（ISDCF）共同编写了《数字电影命名规范》，用
“内容-标题-正文”元素来对播放列表进行命名。

## 命名格式

1. 语言代码

    语言代码主要表示DCP中影片的声轨和字幕所用语言的种类。例如： EN-FR（英语原声
    配法语字幕）

    第一个语言代码（EN）代表音频的语言，第二个语言代码（FR）代表字幕的语言。通
    常情况下，数字电影发行包将有两种字幕语言。例如： GSW-FR-IT（瑞士德语原声配
    法语和意大利语字幕）。 

    字幕有两种显示方式：由影院数字电影放映机生成或者由制片厂制作在图像画面上。
    如果语言代码是“UPPER CASE”，则说明字幕是由放映机实时生成的，如果语言代码是
    “LOWER CASE”，则说明字幕已经在图像之上。 

    在命名规范中的许多语言代码来自于ISO 639-1、639-2、639-3，可在ISO进行相关查
    找。

    "LAS"代表拉丁美洲西班牙语，但是LAS在639-3中还代表多哥的语言。由于“LAS”在电
    影发行中代表拉丁美洲西班牙语已经约定俗成，在此还沿用此命名方法。

2. 地区和评级

    表示地区和评级方面信息的内容由2~6个字符组成。前两个字符表示发行区域，根据
    ISO 3166-1国家代码命名。后面加上连字符“-”和2~3个字符，代表地区分级（如果该
    地区存在分级的话）比如“US-13”代表美国地区评级为PG-13的影片。

    美国地区的预告片中，“GB”代表非限制级（Green Band）预告片，“RB”代表限制级
    （Red Band）预告片。非限制级预告片是由MPAA认可能放映给所有观众看的预告片，
    但并不说明影片正片的分级等级。

    对于国际发行版本，需要用以下代码来替换地区和分级代码： INT-TD：国际多国字幕
    版 、 INT-TL：国际无字幕版

    虽然“XX”经常在语言领域被用于表示“无字幕”，但在分级领域不能表示“无分级”，因
    为容易被误解为“X”级

3. 内容类型和版本号

    内容类型和版本信息将标识DCP包含的内容的种类——是正片、预告片、短片等等，以及
    该内容的版本情况。这一部分信息可以占据7个字符。

    FTR=Feature正片
    TLR=Trailer预告片
    TSR=Teaser短版本影院预告片
    TST=Test测试片(图像、色彩表等)
    RTG=Rating Tag分级标签(“RTG”必须在表示正片的“-F” 或者表示预告片的“-T”之前)
    SHR=Short Subject短片 
    ADV=Advertisement广告包括音乐视频
    XSN=Transitional过渡片(包括间隔的黑场以及“请戴上3D眼镜”等标识)
    PSA=Public Service Announcement公共服务通知（公益预告片）
    POL=Policy Trailer观影注意事项 ("请关闭手机"等等.)

    在内容种类代码后面加上版本号非常重要，比如正片版本2“FTR-2”，这样可以方便找
    到正确的版本，也方便为“VF”版本文件找到匹配的“OV”



## DCP 包制作

dcp-o-matic

    - There are .rpm packages for Fedora, Centos and Mageia on https://dcpomatic.com/

    - Packages for Arch Linux are available from https://aur.archlinux.org/packages/dcpomatic/, thanks to Stefan Karner.

    - Since DCP-o-matic is open-source you can also build it yourself, though this can be quite a difficult process (especially on Windows and macOS). There are instructions for how to do it on https://dcpomatic.com/building

    ```
     the low-resolution trailer  低分辨率预告片
    ```


卷
    签名卷：不对视频进行分割
    根据内容进行分割：每个原视频一个卷
    分卷|自定义：当视频特别大时

标准
    SMPTE: 新的标准，用这个即可
    Interop: 老的标准，兼容性差

封装格式
    DCP Flat(遮幅/1.77/1.78/1.85) 1998x1080
    DCI Scope(宽银幕/2.35/2.39) 2048x858
    Full(全幅/1.90)