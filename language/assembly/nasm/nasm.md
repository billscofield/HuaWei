# NASM

Netwide Assembler （简称 NASM）是一款基于x86架构的**汇编**与**反汇编**软件。

它可以用来编写16位（8086、80286等）、32位（IA-32）和64位（x86_64）的程序。 

NASM被认为是Linux平台上最受欢迎的汇编工具之一。

1. General-purpose x86 assembler Netwide Assembler.

    apt install -y nasm
    yum install -y nasm

2. simple IDE for NASM, GAS and FASM assembly languages

    apt install -y sasm

3. bochs - IA-32 PC emulator

    386 simulator

    apt install -y bochs

## NASM 安装

1. 编译好的包

    apt / yum

2. 源码编译

    https://www.nasm.us/

    wget https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.gz

    ./configure    configure脚本会寻找最合适的C编译器，并生成相应的makefile文件
    make           创建nasm和ndisasm 的二进制代码
    make install   进行安装（这一步需要root权限）,会将 nasm 和ndisasm 装进/usr/local/bin 并安装相应的man pages
