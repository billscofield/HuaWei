
https://learngitbranching.js.org/

## centos6 源代码安装 git

因为 Centos6 源中git最高版本为 1.7, 所以只能采用源代码安装

1. 安装依赖

    yum groupinstall "Development Tools"
    yum install zlib-devel


2. [安装步骤](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git)

    [下载 git 源代码](https://github.com/git/git/releases)

    make configure
    ./configure --prefix=/usr
    make all doc info
    make install install-doc install-html install-info

3. 验证

    git --version

## git server 是非常规端口, 比如922 980


