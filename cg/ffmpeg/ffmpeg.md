## 编译安装

绿色
解压
创建ln


## 使用

Hyper fast Audio and Video encoder
usage: ffmpeg [options] [[infile options] -i infile]... {[outfile options] outfile}...

Getting help:
    -h              -- print basic options
    -h long         -- print more options
    -h full         -- print all options (including all format and codec specific options, very long)
    -h type=name    -- print all options for the named decoder/encoder/demuxer/muxer/filter/bsf/protocol

ffmpeg -version



ffmpeg

ffplay

ffprobe



## ffmpeg

-L  show license

-codecs

    Show all codecs known to libavcodec.

    Note that the term 'codec' is used throughout this documentation as a
    shortcut for what is more correctly called a media bitstream format.



## ffplay

ffplay 文件(音频/视频)


## ffprobe

显示媒体参数信息

ffprobe 文件


## 转换文件格式

mov -> mp4
    ffmpeg -i input.mov output.mp4


## 编码

mp4封装
    H264 视频编码 + AAC 音频编码

webm封装
    VP8 视频编码 + Vorbis 音频编码
    youtube

ogg封装
    Theora 视频编码 + Vorbis 音频编码
    开源
    HTML5 默认支持
    WebM 就是基于此进行的开发


flac 开源的无损音频格式

    ffmpeg -i input.flac -acodec libmp3lame -ar 44100 -ac 2 out.mp3
        a       audio
        codec   编码器
        libmp3lame  mp3的编码器
        -ar         音频采样率
        -ab         音频的比特率, 默认128K
        -ac         channel 声道数, 默认是原音频的


        -vol        volume         change audio volume (256=normal)   // 255 是100%

    ffprobe out.mp3


    ffmpeg -i in.webm -s 1920x1080 -pix_fmt yuv420p -vcodec libx264 -preset medium -profile:v high -level:v 4.1 -crf 23 -acodec aac -ar 44100 -ac 2 -b:a 128k out.mp4

        -s 
        -pix_fmt    pixel format    视频颜色空间, yuv、nv、rgb... 可以通过 ffmpeg -pix_fmts 来查询
            yuv420p 一般的网络视频都是这个
        -preset     编码器预设
            ultrafast           superfast   veryfast    faster      fast            速度和体积的权衡
            medium(default)     slow        slower      veryslow    placebo
        
        -profile:v [high/]      压缩
            baseline(实时通信)    extended    main    high    "high 10"  "high 4:2:2"
        
        -level:v        编码器的具体

        ---
        单遍
        
        -crf            码率控制模式, constant rate factor(恒定速率因子模式)
            0...18...23...28...51
            0 是无损
            一般在18,28间选择

        -r              视频帧率

        -qp(Constant Quantizer) 恒定量化器模式
            0..20...40..51
            0 无损

        -b(bitrate) 固定目标码率模式



### 截图

ffmpeg -i in.mp4 -ss 5 -vframes 1 img.jpg
    -ss 5       第五秒
    -vframes    第五秒的第一帧

### 添加水印

ffmpeg -i in.mp4 -i logo.png -filter_complex "overlay=20:20" out.mp4

    -filter_complex 添加水印 左上角为零点，x=20px,y=20px

### gif 动图

ffmpeg -i in.mp4 -ss

### 屏幕录制

ffmpeg -f gdigrab -i desktop rec.mp4
    
    -f  格式化 gidgrab 格式的标准,这个组件只能捕获屏幕，不能捕获音频
        screen capture recorder
        obs studio
    
