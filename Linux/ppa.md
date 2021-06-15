## Personal Package Archive 个人软件包存档

软件仓库是一组文件，其中包含各种软件及其版本的信息，以及校验和等其他一些详细信息。每个版本的 Ubuntu 都有自己的四个官方软件仓库：

    main:  canonical [kəˈnɒnɪkl] 支持的自由开源软件

    restricted

    universe

    multiverse

main:           完全的自由软件。

restricted:     不完全的自由软件。

universe:       ubuntu官方不提供支持与补丁，全靠社区支持。

muitiverse：    非自由软件，完全不提供支持和补丁。



    ```

    deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse

    deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse

    ```

    整个结构是遵循以下格式：

    deb/deb-src [ options ] uri suite [component1] [component2] [...]

        1. deb 这一栏只有两种写法，分别为deb与deb-src，
        
            前者表示所指向的为存放 binary 格式 ( 编译好执行文件的软件套件 ) 软件
            套件的服务器位置，
        
            后者则为 sources 格式 ( 包含原始码的软件套件 ) 软件套件的服务器位置。 
        
            简言之，一般我们只想要安装该软件而不想要去重新编译它时，就在这一栏填
            入deb， 如果你想取得某软件的原始码 ( sources code ) ，就得加入
            deb-src， 当然也可以两行都写。
        
        1. uri 指的就是软件套件来源位置，这些位置可以为系统内的某个位置 ( file )
           、可以为 CD-ROM ( cdrom ) 、可以为网络远程位置 ( http 、 ftp )..等等，
           当你下 apt-get 指令时，就会到这些位置去搜寻软件数据库。总括来说一共有
           file 、 cdrom 、 http 、 ftp 、copy 、rsh 、ssh 等几个参数，当然，用
           的最多的是http/https/ftp，从网上指定源获取软件包。
        
        1. suite指你打开uri链接，访问到dists目录下有个你对应linux发行版的套件名
           称目录（每个发行版对应的名称各不相同，ubuntu14.04为trusty），后面多个
           component1为suite目录下的多个指定组件库（上面示例为main、restricted、
           universe 、multiverse）


https://www.toutiao.com/i6648088832497418759/?from=qrcode7

http://baijiahao.baidu.com/s?id=1578857355620858850&wfr=spider&for=pc
