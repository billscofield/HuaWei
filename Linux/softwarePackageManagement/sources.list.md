

```
##deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
##deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free

deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
```

## 档案类型 Archive type

deb:二进制
deb-src:源代码

## 仓库地址 repository URL

http://mirrors.aliyun.com/kali

## 发型版本 distribution

发行版有两种分类方法，
    一类是发行版的具体代号，如 xenial,trusty, precise 等；

    还有一类则是发行版的发行类型，如oldstable, stable, testing 和 unstable。

另外，在发行版后还可能有进一步的指定，如 xenial-updates, trusty-security, stable-backports 等


## 软件包分类 component

跟在发行版之后的就是软件包的具体分类了，可以有一个或多个。

不同的 Linux 发行版对软件有着不同的分类，如：

Debian
    main
        包含符合 DFSG 指导原则的自由软件包，而且这些软件包不依赖不符合该指导原则的软件包。这些软件包被视为 Debian 发型版的一部分。
    contrib
        包含符合 DFSG 指导原则的自由软件包，不过这些软件包依赖不在 main 分类中的软件包。
    non-free
        包含不符合 DFSG 指导原则的非自由软件包。
Ubuntu
    main
        官方支持的自由软件。
    restricted
        官方支持的非完全自由的软件。
    universe
        社区维护的自由软件。
    multiverse
        非自由软件。





## /etc/apt/sources.list.d

The /etc/apt/sources.list.d directory provides a way to add sources.list entries in seperate files that end with .list. The format is the same as for the regular sources.list file.

Using the directory you can easily add new repositories without the need to edit the central /etc/apt/sources.list file. I.e. you can just put a file with a unique name and the same format as /etc/apt/sources.list into this folder and it is used by apt.

In order to remove this source again you can just remove that specific file without the need for handling side effects, parsing or mangling with /etc/apt/sources.list. It's mainly for scripts or other packages to put their repositories there automatically - if you manually add repositories you could add them to /etc/apt/sources.list manually.
