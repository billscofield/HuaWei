# GPG



要了解什么是GPG，就要先了解PGP。

## PGP

1991年，程序员Phil Zimmermann为了避开政府监视，开发了加密软件PGP。这个软件非常
好用，迅速流传开来，成了许多程序员的必备工具。但是，它是商业软件，不能自由使用。
所以，自由软件基金会决定，开发一个PGP的替代品，取名为GnuPG。这就是GPG的由来。

Pretty Good Privacy (PGP), the most widely used email encryption software in
the world

## GPG(GNU Privacy Guard, GnuPG)

GPG (GnuPG 或 GNU Privacy Guard) 是一个自由开源的命令行程序，可以用于替代赛门铁
克的 PGP 加密软件

安装

    apt install gnupg

创建密钥对

    gpg --gen-key

查看公钥

    gpg --list-keys | gpg -k
    `~/.gnupg/pubring.gpg` 中的内容

查看私钥：

    gpg --list-secret-keys | gpg -K
    `~/.gnupg/secring.gpg` 中的内容


一些缩写

    sec => 'SECret key'
    ssb => 'Secret SuBkey'
    pub => 'PUBlic key'
    sub => 'public SUBkey'
