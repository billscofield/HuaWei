# ffmpeg(Fast Forward Mpeg)

来自 mpeg 视频编码标准

apt install -y ffmpeg
apt install -y x264

## ffmpeg

ffmpeg 会显示安装的选项(./configure) 

SYNOPSIS

    ffmpeg [global_options] {[input_file_options] -i input_url} ... {[output_file_options] output_url} ...

    ffmpeg -h | less

    -L                  show license
    -h topic            show help
        ffmpeg -h
        ffmpeg -h -long
        ffmpeg -h -full
    -? topic            show help
    -help topic         show help
    --help topic        show help
    -version            show version
    -buildconf          show build configuration
    -formats            show available formats              所支持的所有容器封装格式列表, D 表示支持容器的解封装(即读取) E表示支持容器的封装，即写入
    -muxers             show available muxers               封装格式的说明和参数选项
        ffmpeg -muxers -h muxer=mp4
    -demuxers           show available demuxers
    -devices            show available devices
    -codecs             show available codecs               支持哪些音频和视频编码格式
        ffmpeg -codecs
    -decoders           show available decoders             支持的所有的解码器列表(音频，视频，字幕)
    -encoders           show available encoders             支持的所有的编码器列表(音频，视频，字幕)
        ffmpeg -h -encoder=libx264

        ffmpeg -i INPUT -c:v ENCODER OPTIONS -c:a ENCODER OPTIONS OUTPUT
            -c:v ENCODER OPTIONS        视频编码器 和视频编码器参数和选项
            -c:a ENCODER OPTIONS        音频编码器 和音频编码器参数和选项

    -bsfs               show available bit stream filters
    -protocols          show available protocols
    -filters            show available filters
    -pix_fmts           show available pixel formats
    -layouts            show standard channel layouts
    -sample_fmts        show available audio sample formats
    -colors             show available color names
    -sources device     list sources of the input device
    -sinks device       list sinks of the output device
    -hwaccels           show available HW acceleration methods

    global_options
        -loglevel loglevel              set logging level
        -v loglevel                     set logging level
        -report                         generate a report
        -max_alloc bytes                set maximum size of a single allocated block

        -y                              overwrite output files
        -n                              never overwrite output files

        -ignore_unknown                 Ignore unknown stream types

        -filter_threads                 number of non-complex filter threads

        -filter_complex_threads         number of threads for -filter_complex
        -stats                          print progress report during encoding
        -max_error_rate                 maximum error rate ratio of errors (0.0: no errors, 1.0: 100% errors) above which ffmpeg returns an error instead of success.
        -bits_per_raw_sample number     set the number of bits per raw sample
        -vol volume                     change audio volume (256=normal)

    Per-file main options:
        -f fmt              force format
        -c codec            codec name 为输出文件指定编码格式 copy: 直接从输入文件中拷贝音频和视频数据, 编码保持相同
        -codec codec        codec name
        -pre preset         preset name
        -map_metadata outfile[,metadata]:infile[,metadata]  set metadata information of outfile from infile
        -t duration         record or transcode "duration" seconds of audio/video
        -to time_stop       record or transcode stop time
        -fs limit_size      set the limit file size in bytes
        -ss time_off        set the start time offset
        -sseof time_off     set the start time offset relative to EOF
        -seek_timestamp     enable/disable seeking by timestamp with -ss
        -timestamp time     set the recording timestamp ('now' to set the current time)
        -metadata string=string  add metadata
        -program title=string:st=number...  add program with specified streams
        -target type        specify target file type ("vcd", "svcd", "dvd", "dv" or "dv50" with optional prefixes "pal-", "ntsc-" or "film-")
        -apad               audio pad
        -frames number      set the number of frames to output
        -filter filter_graph  set stream filtergraph
        -filter_script filename  read stream filtergraph description from a file
        -reinit_filter      reinit filtergraph on input parameter changes
        -discard            discard
        -disposition        disposition

        ffmpeg -i video.avi -c:v h264 -c:a aac video.mp4
            -c:v h264   // 视频编码格式
            -c:a aac    // 音频编码格式

        ffmpeg -i video.avi -c:v h264 -c:a aac -r 24 video.mp4
            -r 24       // 给输出文件指定视频帧率

        ffmpeg -i video.avi -c:v h264 -c:a aac -s 1920x1080 video.mp4
            -s 1920x1080    // 将输出文件的分辨率设置为 1920x1080

        ffmpeg -i video.avi -c:v h264 -c:a aac -vb 5000k video.mp4
            -vb 5000k       // 将输出的文件视频码率限制为5000k

        ffmpeg -i video.avi -c:v h264 -c:a aac -ab 320k video.mp4
            -ab 320k       // 将输出的文件音频码率限制为320k

        ffmpeg -i video4k.avi -c:v h264 -s 1280x720 720p.mp4 -c:v h264 -s 1920x1080 1080p.mp4
            生成两种

    编码

    格式:
        表示视频文件的容器封装格式






ffmpeg

    -re (input)
        Read input at native frame rate.

    -i url (input)
        input file url

    -vcodec codec (output)
        Set the video codec. This is an alias for "-codec:v".
        视频解码器

    -acodec codec (input/output)
        Set the audio codec. This is an alias for "-codec:a".
        音频解码器

    -f fmt (input/output)
        Force input or output file format. 

    -movflags frag_keyframe+empty_moov

ffmpeg -re -i file.mp4 -preset ultrafast -vcodec libx264 -g 60 -b:v1500k -c:a aac -b:a 192k -strict -2 -f mp4 


## ffplay

音视频媒体播放器

ffplay a.mp4

ffplay a.mp4

ffplay video.mov -vf subtitles=hello.srt
    字幕文件




## ffprobe

音视频分析工具

ffprobe a.mp4

    Stream #0:0: Video: prores (4444) (ap4h / 0x68347061), yuv444p12le(tv, bt709, progressive), 2048x858, 224825 kb/s, SAR 1:1 DAR 1024:429, 24 fps, 24 tbr, 12288 tbn, 12288 tbc (default)

ffprobe -hide_banner a.mp4
    隐藏多余的版本以及编译参数信息

ffprobe -show_format a.mp4
    查看当前视频文件更详细的容器封装格式信息

    在 ffmpeg 中，mp4 mov 都被认为是同一个容器封装格式 mov

ffprobe -show_format -of flat a.mp4
    flat 格式输出信息
    -of xml
    -of json

ffprobe -show_treams a.mp4
    展示详细的流信息

ffprobe -show_treams a a.mp4
    仅显示音频流信息

ffprobe -show_treams v a.mp4
    仅显示视频流信息

ffprobe -show_treams s a.mp4
    仅显示字幕流信息 (subtitle 字幕)

-show_frames
    帧数据信息

-show_packets
    数据包信息


## 视频的封装与编码

容器封装格式
    以特定的方式组织和存储这些不同类型的数据
    将编码后的音频、视频、字幕再进行一次统一打包

视频编码格式
    决定了视频内容的解码、压缩和存储方式
    常见的视频编码格式有 H264、ProRes、DNxHD 等等


    -movflags faststart
        加快在网络上的加载和播放速度

    -c copy 是 -c:v cody -c:a copy 的和

    +---------+      +---------+      +---------+      +-------+
    |         |      |         |      |         |      |       |
    | demuxer | ---> | decoder | ---> | encoder | ---> | muxer |
    |         |      |         |      |         |      |       |
    +---------+      +---------+      +---------+      +-------+
      解封装            解码             编码           再封装



音频编码格式
    ffmpeg -i INPUT -c:a ENCODER -ar SAMPLE -ac CHANNEL -ab BITRATE OUTPUT
        -ar SAMPLE      音频采样率
        -ac CHANNEL     音频声道数量
        -ab BITRATE     音频码率



大多数视频网站
    mp4 封装，h264视频编码 + aac音频编码
    webM封装, VP8视频编码 + Vorbis 音频编码
    OGG封装，Theora视频编码 + Vorbis 音频编码(开源，无专利问题)

    flac 开源无损音频

    ffmpeg -i a.flac -acodec libmp3lame -ar 44100 -ab 320k -ac 2 out.mp3

    ffmpeg -i in.webm -s 1920x1080 -pix_fmt yuv420p -vcodec libx264 -preset medium -profile:v high -level:v 4.1 -crf 23 -acodec aac -ar 44100 -ac 2 -b:a 128k out.mp4

        -pix_fmt
            pixel format 颜色空间
            ffmpeg -pix_fmts

        --preset medium
            ultrafast
            superfast
            veryfast
            faster
            fast
            medium(medium)
            slow
            slower
            veryslow(较占CPU)
            placebo

        -profile:v
            编码器的配置，和压缩比关系较大

            baseline
            extended
            main
            high (视频效果较好)

        -crf 23
            码率控制
            Constant Rate Factor 恒定速率因子模式

            [0,51]
            0: 无损

    ffmpeg -i in.mp3 -ss 00:01:00 -to 00:01:10 -acodec copy out.mp3
        -ss 截取开始
        -to 截取终点

    ffmpeg -i in.mp3 -ss 00:01:00 -t 10 -acodec copy out.mp3
        -t 持续时间

    ffmpeg -i in.mp4 -ss 5 -vframes 1 img.jpg
        截取第5秒第一帧图片

    ffmpeg -i in.mp4 -i logo.png -filter_complex "overlay=20:20" out.mp4
        -filter_complex 滤镜，左上角为原点

    ffmpeg -i in.mp4 -ss 7.5 -to 8.5 -s 640x320 -r 15 out.gif
        
    ffmpeg -f gdigrab -i desktop rec.mp4
        -f gdigrab          gdigrab 只能捕获视频，不能捕获音频
        屏幕录制
