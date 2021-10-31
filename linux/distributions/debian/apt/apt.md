
/var/lib/dpkg/available
    仅仅用于 dselect, 该软件包括当前系统所使用的 Debian 安装源中的所有软件包,其
    中包括当前系统中已安装的和未安装的软件包.

/var/cache/apt/archives
    目录是在用 apt-get install 安装软件时，软件包的临时存放路径

/var/lib/apt/lists/
    使用apt-get update命令会从/etc/apt/sources.list中下载软件列表，并保存到该目录
    每个 sources.list 中的条目都对应一个文件，包含所有该源的 control 信息

apt-get的更新过程:
    1. 执行apt-get update
    2. 程序分析/etc/apt/sources.list
    3. 自动连网寻找list中对应的Packages/Sources/Release列表文件，如果有更新则下载之，存入/var/lib/apt/lists/目录
        https://mirror.tuna.tsinghua.edu.cn/debian/dists/Debian11.1/Release
        
        ```
        
        Origin: Debian
        Label: Debian
        Suite: stable
        Version: 11.1
        Codename: bullseye
        Changelogs: https://metadata.ftp-master.debian.org/changelogs/@CHANGEPATH@_changelog
        Date: Sat, 09 Oct 2021 09:34:56 UTC
        Acquire-By-Hash: yes
        No-Support-for-Architecture-all: Packages
        Architectures: all amd64 arm64 armel armhf i386 mips64el mipsel ppc64el s390x
        Components: main contrib non-free
        Description: Debian 11.1 Released 09 October 2021
        MD5Sum:
         7fdf4db15250af5368cc52a91e8edbce   738242 contrib/Contents-all
         cbd7bc4d3eb517ac2b22f929dfc07b47    57319 contrib/Contents-all.gz
         37d6231ff08b9f383fba5134e90c1246   786460 contrib/Contents-amd64
         f862fd63c5e4927f91c1cc77a27c89eb    54567 contrib/Contents-amd64.gz
         098f43776cd6b43334b2c1eb867a4d64   370054 contrib/Contents-arm64
         014eca050cdd0b30df0d5a72df217c5b    29661 contrib/Contents-arm64.gz
         b6d2673f17fbdb3a5ce92404a62c2d7e   359292 contrib/Contents-armel
         d02d94be587d56a1246b407669d2a24c    28039 contrib/Contents-armel.gz
        ...
         947a7443ecde38a1a56be3c40d734033 44563444 main/source/Sources
         d636e2801f605cddded56ac4b62480f1 11419393 main/source/Sources.gz
         d38daf7c453c899d4a603da5a13fe4e0  8616784 main/source/Sources.xz
        ...
         5f624011d3b0a82f23445c2861deac99 17347341 non-free/Contents-all
         c64dcd5c2b4db85f729afa8623adb65a   888157 non-free/Contents-all.gz
         518ecaf02e30ae0154fa8571720ec601  1012087 non-free/Contents-amd64
         ad1187679dc2bfae989e2a616c1d1f43    75128 non-free/Contents-amd64.gz
         c4836acef58c9d8bb5610ccacf8f090e   421263 non-free/Contents-arm64
        
        ```
    4. 然后 apt-get install 相应的包 ，下载并安装。




apt 命令            取代的命令              命令的功能
apt install         apt-get install         安装软件包
apt remove          apt-get remove          移除软件包
apt purge           apt-get purge           移除软件包及配置文件
apt update          apt-get update          刷新存储库索引
apt upgrade         apt-get upgrade         升级所有可升级的软件包
apt autoremove      apt-get autoremove      自动删除不需要的包
apt full-upgrade    apt-get dist-upgrade    在升级软件包时自动处理依赖关系
apt search          apt-cache search        搜索应用程序
apt show            apt-cache show          显示安装细节

当然，apt 还有一些自己的命令：

新的apt命令         命令的功能
apt list            列出包含条件的包（已安装，可升级等）
apt edit-sources    编辑源列表
