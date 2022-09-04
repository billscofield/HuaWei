Truncate命令通常用于将文件缩小或扩展到指定的大小。如果文件大于指定的大小，则会
丢失额外的数据。如果文件较短，则会对其进行扩展，并且扩展部分的读数为零字节。

通常操作系统会安装truncate命令，该命令在coreutils安装包里面


-s, --size=SIZE
    set or adjust the file size by SIZE bytes


这对于清除日志文件很有用。truncate过程基本上删除了文件的所有内容。它不会删除文
件本身，但会将它作为零字节文件保留在磁盘上。例如，让我们使用truncate将
/var/log/yum.log清除为0个字节

    truncate -s 0 /var/log/yum.log


truncate命令将保留文件所有权。可以使用ll -h命令进行确认：


使用truncate将文件设置为指定大小,下面的示例将文件填充为10K个字节

    truncate -s 10K file.txt


    The SIZE argument is an integer and optional unit (example: 10K is 10*1024)

    Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000)

    Binary prefixes can be used, too: KiB=K, MiB=M, and so on.



使用truncate扩展文件大小
    使用-s选项，在数字前面加上+

    通过添加额外的200K，这会将文件大小从1K扩展到201K。


使用truncate减小文件大小
    将使用-s选项，在数字前面加上-



