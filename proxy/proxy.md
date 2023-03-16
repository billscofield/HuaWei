
export http_proxy=x.x.x.x:8080
export https_proxy=$http_proxy
export ftp_proxy=user:password@x.x.x.x:8080
export no_proxy=harbor.zc.com,localhost,127.0.0.1,10.7.22.2,10.7.21.2
export http_proxy=http://10.0.0.1:1111
export all_proxy=socks5://10.0.0.1:1111

http_proxy：http协议使用代理服务器地址；
https_proxy：https协议使用安全代理地址；
ftp_proxy：ftp协议使用代理服务器地址；
no_proxy：不使用代理的主机或IP。
all_proxy: 所有设置

unset http_proxy
unset https_proxy

命令行查询(详细):
    UNIX/Linux:#curl cip.cc
    Windows:>telnet cip.cc
            >ftp cip.cc
命令行查询(纯ip):
            UNIX/Linux:#curl ip.cip.cc

## apt

vim /etc/apt/apt.conf

Acquire::http::Proxy 'http://proxyAddress:port'

## git

使用ss/ssr来加快git的速度

git config --global http.proxy 'socks5:127.0.0.1:1080'

git clone https://github.com/user/repository.git --config "http.proxy=host:port"
