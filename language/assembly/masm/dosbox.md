https://blog.csdn.net/weixin_40390964/article/details/98082252

## 安装

1. 预编译包:

    apt install -y dosbox


2. 源码安装:

    [dosbox官网](https://www.dosbox.com/download.php?main=1)

    yum install -y SDL SDL-devel

    mkdir build && cd build
    ../configure
    make
    make install

    /usr/local/bin/dosbox

3. 配置 dosbox

    vi $(dosbox -printconf)     //编辑dosbox配置文件
        /root/.dosbox/dosbox-0.74-3.conf

    ```
    mount c /root/dos
    c:
    ```

第一步只安装了虚拟环境，但是汇编的编译器和链接器等还没有就位。此处使用老师提供的 masm.7z
https://sst.st/p/530


解压 masm 

    dosbox
    mount c /home/bill/masm

    debug                       验证
    -r
