
# Font

在linux，把字体文件拷贝到字体目录后，执行fc-cache命令，fc-cache扫描字体目录并生成字体信息的缓存，然后应用程序就可以立即使用这些新安装的字体。

## 查看字体

fc-list   #字体列表

fc-list :lang=zh  #中文字体

fc-match -v "字体名" # 查看字体详情


## 安装字体

apt-cache show xfonts-utils

第一步：查看安装了那些字体  命令：fc-list :lang=zh

安装方法：

1、先从你本机 C:\Windows\Fonts 拷贝或者网络上下载你想要安装的字体文件（.ttf文件）（把.ttc重命名为.ttf）

    到/usr/share/fonts/chinese/TrueType 目录下（如果系统中没有此目录，则自行mkdir创建，亦可重命名为自己喜欢的文件夹名）

2、修改字体文件的权限，使root用户以外的用户也可以使用

    ```
    cd /usr/share/fonts/chinese/TrueType
    chmod 755 *.ttf
    ```

3、建立字体缓存

    ```
    mkfontscale  （如果提示  mkfontscale: command not found ，需自行安装  # yum install mkfontscale  ）
    mkfontdir  
    fc-cache -fv  （如果提示  fc-cache: command not found ，则需要安装 # yum install fontconfig  ）
    ```

    mkfontscale - create an index of scalable font files for X
    mkfontdir   - create an index of X font files in a directory

4、重启计算机（似乎必须重启才会有效）

    reboot


## font Examples

Fira Code

    Zero Style:Slashed
    Serif:No
    Weights:Light, Regular, Medium, Bold, Retina

Source Code Pro

    Zero Style:Dotted
    License:SIL Open Font 1.1
    Serif:No
    Weights:Extra Light, Light, Regular, Medium, Semibold, Bold, Black

Ubuntu Mono

    Zero Style:Dotted
    License:Ubuntu Font 1.0
    Serif:Sans
    Weights:Thin, Regular, Bold




