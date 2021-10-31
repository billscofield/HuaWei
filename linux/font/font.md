
# Font

在linux，把字体文件拷贝到字体目录后，执行fc-cache命令，fc-cache扫描字体目录并生
成字体信息的缓存，然后应用程序就可以立即使用这些新安装的字体。


## TTF or OTF

1. TTF（TrueType） 

    Windows和Mac系统最常用的字体格式，其最大的特点就是它是由一种数学模式来进行
    定义的基于轮廓技术的字体，这使得它们比基于矢量的字体更容易处理，保证了屏幕
    与打印输出的一致性。同时，这类字体和矢量字体一样可以随意缩放、旋转而不必担
    心会出现锯齿。 

    TTF was created by Apple and Microsoft in the 1980s and currently is the
    most famous font file. TTFs include all of the needful for screen viewing
    and printing right in the same file. Conviction: Everyday use font.

2. OTF（OpenType）

    OTF was developed out of TTF in the late 1990s by Apple and Microsoft
    again. It can store up to 65 000 characters including special characters,
    letters, digits, and glyphs with extended typographic features. OTFs are
    useful when working at the same time with multiple languages. They are
    sometimes a bit more expensive, because of this reason. Conviction:
    Suitable for designers looking for bigger freedom.


## Bitmap and Vector

Bitmap is a raster-based format

Those fonts are the first generation of font technologies. They are raster(光栅
)-based which means that each glyph([ɡlɪf]字符) (letter, number or symbol) is a
set of pixels that form the picture of the glyph.




3. PostScript

    It’s a programming language, developed by Adobe Systems around 1980, that
    describes digital artwork so that digital printers can reproduce it in the
    highest quality possible. It was invented in order to create a format which
    is undependable by the printer itself.  

    PostScript (yep, you thought it’s just OTF and TTF, right?)  was developed
    by Adobe in the late 1980s. These fonts contain two separate parts that are
    required to be installed, thus their setup is a bit harder. They are
    considered with higher resolution than OTF and TTF and thus used for
    quality literature printing. Conviction: Most beneficial, when in need of
    the highest quality possible.

    The PDF (Adobe Portable Document Format) is a more structured, compact
    subset of the PostScript language and now is one of the most used file
    formats worldwide. 

3. TTF和OTF哪个好？

    OTF是基于TTF制订出的延伸版本，但这不代表TTF 就是不好，或是低质量，完全取决
    于字库定位，如果你想精确控制每个像素点的话，TTF比OTF好。

    .TTF (True Type Font) is a better choice when you will use it mainly for
    web design or mobile design on desktop or mobile displays. Or if you work
    with PowerPoint 2007 (or older) on Windows machine.  

    .OTF (Open Type Font) is a better choice when you’re designing materials
    for print.


## 查看字体

fontconfig 软件包

fc-list   #字体列表

fc-list :lang=zh  #中文字体

fc-match -v "字体名" # 查看字体详情


## 安装字体1

apt-cache show xfonts-utils

第一步：查看安装了那些字体  命令：fc-list :lang=zh

安装方法：

1. 先从你本机 C:\Windows\Fonts 拷贝或者网络上下载你想要安装的字体文件（.ttf文件）（把.ttc重命名为.ttf）

    到/usr/share/fonts/chinese/TrueType 目录下（如果系统中没有此目录，则自行mkdir创建，亦可重命名为自己喜欢的文件夹名）

2. 修改字体文件的权限，使root用户以外的用户也可以使用

    ```
    cd /usr/share/fonts/chinese/TrueType
    chmod 755 *.ttf
    ```

3. 建立字体缓存

    ```
    mkfontscale  （如果提示  mkfontscale: command not found ，需自行安装  # yum install mkfontscale  ）
    mkfontdir  
    fc-cache -fv  （如果提示  fc-cache: command not found ，则需要安装 # yum install fontconfig  ）
    ```

    mkfontscale - create an index of scalable font files for X
    mkfontdir   - create an index of X font files in a directory

4. 重启计算机（似乎必须重启才会有效）

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


Bitstream Vera Sans Mono






## 中文字体支持

```
1. apt-get install xfonts-intl-chinese wqy*
2. apt-get install locales
3. dpkg-reconfigure locales

4. 在稍后弹出的语言列表中选择：
    zh_CN GB2312
    zh_CN.GBK GBK
    zh_CN.UTF-8 UTF-8

5. 默认编码选用：zh_CN.UTF-8 UTF-8  或者使用 export LC_ALL=C

```




apt-cache search xfonts-intl
    emacs-intl-fonts - fonts to allow multilingual PostScript printing from Emacs
    xfonts-intl-arabic - international fonts for X - Arabic
    xfonts-intl-asian - international fonts for X - (south-east) Asian
    xfonts-intl-chinese - international fonts for X - Chinese
    xfonts-intl-chinese-big - international fonts for X - large Chinese
    xfonts-intl-european - international fonts for X - European
    xfonts-intl-japanese - international fonts for X - Japanese
    xfonts-intl-japanese-big - international fonts for X - large Japanese
    xfonts-intl-phonetic - international fonts for X - International Phonetic Alphabet
    langdrill - language drills to test vocabulary


    xfonts-intl-chinese
        这个软件包包括了一些 GB2312、GB8565-88、BIG5 (ETen)、和 SiSheng 中文字体。 
        如果您要用中文浏览、打印或创作文档和使用以上几种编码方式，将需要使用这些字体。
        这些字体用于 X Window 系统。



## Linux安装字体

https://www.cnblogs.com/dw3306/p/13722556.html


1. 安装字体命令

    yum -y install fontconfig

2. 查看已安装字体

    查看linux已安装字体

        fc-list

    查看linux已安装中文字体

        fc-list :lang=zh

3. 安装中文字体

    1. 创建目录
        
        mkdir -p /usr/share/fonts/my_fonts

    2. 将要安装的字体上传到该文件夹下
        
        这里我们安装黑体常规，即simhei.ttf。
        
        关于具体字体查找，我以windows为例。
        
        进入  C:\Windows\Fonts，该文件夹下就存放相关字体，将simhei.tty拷贝到
        linux 目录  /usr/share/fonts/my_fonts下即可

    3. 安装字体索引指令

       mkfontscale 字体目录 (或者进入到字体所在目录执行 mkfontscale)

   4. 生成字体索引

        进入目录 cd  /usr/share/fonts/my_fonts, 执行索引字体生成

        mkfontdir

4. fc-cache

    fc-cache scans the font directories on the system and builds font
    information cache files for applications using fontconfig  for  their  font
    han‐dling.

    If  directory  arguments  are  not  given, fc-cache uses each directory in
    the current font configuration. Each directory is scanned for font files
    readable by FreeType. A cache is created which contains properties of each
    font and the associated filename.  This cache is used to speed up appli‐
    cation startup when using the fontconfig library.

    Note that fc-cache must be executed once per architecture to generate font
    information customized for that architecture.

    -f     Force re-generation of apparently up-to-date cache files, overriding
           the timestamp checking.

    (https://wiki.archlinux.org/title/X_Logical_Font_Description#mkfontscale_and_mkfontdir)

5. 查看黑体常规字体是否安装成功

    fc-list :lang=zh


Two different font systems are used by X11: 
    1. the older or core X Logical Font Description, XLFD, 
    2. and the newer X FreeType, Xft, systems (see An Xft Tutorial for font names format). 

    XLFD was originally designed for bitmap fonts and support for scalable
    fonts (Type1, TrueType and OpenType) was added later. XLFD does not support
    anti‑aliasing and sub‑pixel rasterization. 

    Xft uses the FreeType and Fontconfig libraries and is more suitable when the smooth appearance of fonts is desired.





sudo mkfontscale
    创建字体的fonts.scale文件，它用来控制字体旋转缩放
    create an index of scalable([ˈskeɪləbl]) font files for X

    mkfontscale ... [directory]

    For each directory argument, mkfontscale reads all of the scalable font
    files in the directory.  

    For every font file found, an X11 font name (XLFD) is generated, and is
    written together with the file name to a file fonts.scale in the directory.

    (X Logical Font Description X逻辑字体描述规范)


sudo mkfontdir
    创建字体的fonts.dir文件
    create an index of X font files in a directory

    mkfontdir [directory]

    **The X server and font server use "fonts.dir" to find font files**


    The first line of fonts.dir gives the number of fonts in the file.  
    The remaining lines list the fonts themselves, one per  line,  in  two  fields.
        First is the name of the font file, 
        followed by a space and the name of the font.


sudo fc-cache -fv
    建立字体缓存信息，也就是让系统认识该字体




## mkfontscale and mkfontdir

To create a fonts.dir file, two programs are required, mkfontscale and mkfontdir. 

These programs were probably installed when you installed Xorg. 

Mkfontdir reads all the bitmap font files in a directory for the font names,
and creates the fonts.dir file using the font and file names it has found. 
**It also adds the entries from a file named fonts.scale.**


Because **mkfontdir cannot read scalable font files**, the program mkfontscale
is used to create the names for TrueType, OpenType and Type1 fonts. 
The font names and font filenames are stored in the file named fonts.scale. 
The structure of a fonts.scale file is identical to a fonts.dir file. 

The first line is the number of font names listed; 
the following lines contain the filename first, followed by a single space, and finally the font name.

Both fonts.scale and fonts.dir can be hand edited. However, every time
mkfontscale or mkfontdir is run, any existing fonts.scale or fonts.dir is
overwritten. Your edits are easily lost.

Any time mkfontdir is run, the font database should be updated, using the command:

    $ xset fp rehash    (没有好像也可以)

Note: Filenames that include spaces cannot be parsed correctly from the
fonts.dir and fonts.scale files. Quoting or escaping these spaces will not
work. The only solutions are to rename the files using filenames that do not
contain spaces or to delete the font listings in the fonts.dir and fonts.scale
files.
