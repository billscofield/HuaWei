top -s 20
    -s delay-secs       // 刷新间隔

    
    ocpu                // 按照 CPU 排序
    orsize              // 按照 内存排序

open
    -a application
        specifies the application to use for opening the file
        
        open -a Preview file.pdf


The following commands helped in clearing the extended attribute at file / folder(recursive) level.

    xattr -c <file/directory>
    xattr -cr <file/directory>







http://www.senra.me/data-backup-series-netatalk-and-avahi-build-your-own-timemachine/

https://blog.csdn.net/weixin_34520503/article/details/116626786

Netatalk 是一个免费开源的 AppleTalk 通信协议的实现，Linux 或者 BSD 系统通过它可
以充当 Mac 的文件服务器 (AppleShare File Server, 网络协议是 AFP)、AppleTalk 路
由、打印服务器等。而Avahi是Zeroconf规范的开源实现，常见使用在Linux上。它可以在
没有 DNS 服务的局域网里发现基于zeroconf协议的设备和服务。


Avahi 是 Apple’s Zeroconf 协议的开源实现

