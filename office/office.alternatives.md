# Office alternatives

## 1. onlyoffice

centos7 有bug 问题， 本地文件没有问题， nfs 共享的文件打不开，strace 卡住


## 2. io.gitlab.o20.word

https://flathub.org/apps/io.gitlab.o20.word

仅仅支持很有限的两种格式，不支持 microsoft 格式

    yum install -y flatpak
    wget https://dl.flathub.org/repo/flathub.flatpakrepo    桌面点击安装
    flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub io.gitlab.o20.word

## Dzzoffice

也是浏览器打开
