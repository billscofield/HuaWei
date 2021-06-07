

https://wiki.archlinux.org/title/Capabilities_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)


能力(capability) (POSIX 1003.1e, capabilities(7)) 用更小的粒度控制超级管理员权限
，可以避免使用 root 权限。软件开发者应该为二进制文件赋予最小权限，而不是使用强大
的setuid。很多软件包用了能力，比如 iputils 提供的ping 使用了 CAP_NET_RAW （能力
的一种） ，因此 ping 可以被普通用户执行（效果和使用 setuid 相似）,同时减少了ping
的潜在安全隐患。


在 Linux 中，能力通过名空间 security 下的 extended attributes（扩展属性）
(xattr(7)) 实现。


面的示例使用 getcap 显示“ping”的能力（Capabilities），以及通过 getfattr 显示编码
后的“ping”的能力信息。

    $ getcap /usr/bin/ping
    /usr/bin/ping = cap_net_raw+ep


在进行文件复制时，诸如“能力”等文件的扩展属性可以通过 cp -a 自动复制, 但是其他的
命令可能需要一个特别的参数,例如：rsync -X。
