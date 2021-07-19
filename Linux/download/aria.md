aria2c has a man page while aria2 does not. I suspect you are right in that the
"aria2c" is the "command" while "aria2" denotes the "project".

aria2c has been merged into aria2 and a synonym created

    ```
    updating post history, 8 rows affected (pipe delimited)
    updating posts, 8 rows affected  (pipe delimited)
    updating PostTags associations, 5 rows affected
    updating Documentation tag proposal commitments, 0 rows affected
    removing/renaming old tag, 0 rows affected
    updating count for master tag, 1 rows affected
    tag remapping of [aria2] and [aria2c] complete!
    remapping 0 synonyms
    1 favorite and ignored tags remapped!
    0 tracked tag badges were remapped!
    Tag Synonym aria2c -> aria2 was approved!
    `````

    aria2 is package name and aria2c is a binary file inside it. As you can see
    here, aria2c is the only executable file inside aria2 package

    many programs can use run-time parameters with the executable name or have
    a command that is different from the product name, but we generally use the
    product name for the tag rather than the executable name or command. That
    would be another rationale for using aria2 for the tag




aria2

    ria2 is a lightweight multi-protocol & multi-source command-line download utility. 

支持的协议

    It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink. 

配置

    aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.

支持的平台

    windows,linux,OSX,Android

Features

    Multi-Connection Download

    Lightweight

    Fully Featured BitTorrent Client(功能齐全的BitTorrent客户端)
    
    Remote Control

        aria2 supports RPC interface to control the aria2 process. The
        supported interfaces are JSON-RPC (over HTTP and WebSocket) and XML-RPC


Linux 

## 安装 

apt install aria2

## 下载

aria2c http://xx.com/xx


Download from WEB:

    $ aria2c http://example.org/mylinux.iso

Download from 2 sources:

    $ aria2c http://a/f.iso ftp://b/f.iso

Download using 2 connections per host:

    $ aria2c -x2 http://a/f.iso

BitTorrent:

    $ aria2c http://example.org/mylinux.torrent

BitTorrent Magnet URI:

    $ aria2c 'magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C'

Metalink:

    $ aria2c http://example.org/mylinux.metalink

Download URIs found in text file:

    $ aria2c -i uris.txt












-d, --dir=DIR                       # 文件下载目录
-o, --out=File                      # The file name of the downloaded file. When the -Z option is used, this option will be ignored.
    aria2c --out=yy http://xx.com/xx
-i, --input=File                    # 下载FILE中列出的地址,在同一行里使用制表符分隔多个地址
--ftp-user=USER                     # 设置FTP用户。此设置对所有链接有效。
--ftp-passwd=PASSWD                 # 设置FTP密码。此设置对所有链接有效。
-S, --show-files                    # 显示 .torrent, .meta4 和.metalink 等类型文件的列表然后退出.如果是torrent文件，会给出更详细信息。
-M, --metalink-file                 # The file path to the .meta4 and .metalink file
    aria2c ‘xxx.torrnet‘
    aria2c '磁力链接'
-x, --max-connection-per-server=    # NUM The maximum number of connections to one server for each download.
    aria2c -x2 "http:/host/file.zip"
-s, --split=N                       # Download a file using N connections.

列出种子内容：
    aria2c -S xxx.torrent
下载种子内编号为1、4、5、6、7的文件，如：
    aria2c --select-file=1,4-7 xxx.torrent
-k, --min-split-size=SIZE    aria2 does not split less than 2*SIZE byte range.
                              For example, let us consider downloading 20MiB
                              file. If SIZE is 10M, aria2 can split file into 2
                              range [0-10MiB) and [10MiB-20MiB) and download it
                              using 2 sources(if --split >= 2, of course).
                              If SIZE is 15M, since 2*15M > 20MiB, aria2 does
                              not split file and download it using 1 source.
                              You can append K or M(1K = 1024, 1M = 1024K).
    aria2c -x2 -k1M "http://host/file.zip"

Download a file from HTTP and FTP servers at the same time
    aria2c "http://host1/file.zip" "ftp://host2/file.zip"

https://aria2.github.io/manual/en/html/aria2c.html#http-ftp-segmented-downloads




所谓BT其实实际上并不是一个人的事，因为你的下载必然代表着一个甚至一堆人在上传。所以，如果下载慢，那么找更多上传的人不就行了？那么问题来了，如何知道有谁能给你上传？这就涉及到Tracker、本地用户发现、DHT、用户交换这些功能了。

Tracker会存储你的信息(包括正在下载或者上传的是什么种子，你的速度还有进度)，同时会将其他正在下载或者上传这个种子的用户数据给你，从而你能够根据这些信息连接对应的用户

DHT也是类似，只是它不像Tracker这样是一个个的，而是一整个网络，你可以通过接入DHT网络从而分享以及获得数据

本地用户发现不是很懂，感觉上应该是扫描局域网开放端口或者获取其他BT客户端在网内广播数据(?)从而发现其他用户

用户交换则是和你连接的用户交换所获得的其他用户的信息

在这四个中，DHT很大程度上比较不可控，因为我们不好修改程序（但是！DHT这玩意有缓存，下面会提到），而本地用户发现比较看你服务器，在某些BT扎堆的机房和地区感觉应该会比较有效，至于用户交换则是需要连接其他用户作为前提。所以我们最好下手的就是Tracker，要知道全世界一大堆Tracker服务器，如果我们连接的Tracker多了，那么就有更大的机会碰到和我们下载同一个种子的用户，这样速度不就会变快？

基于这个想法，我们需要给Aria2添加Tracker，而不是只根据从DHT网络或者种子文件中存储的Tracker信息，让下载赢在起跑线上

这里面分了好几种，有http和udp的，也有纯ip和域名的，还有选出来的前20的Tracker(基于延迟以及热门度)
