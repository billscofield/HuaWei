
readlink - print resolved symbolic links or canonical file names

readlink是linux系统中一个常用工具，主要用来找出符号链接所指向的位置。


系统中的awk命令到底是执行哪个可以执行文件呢？

 
```
$ readlink /usr/bin/awk  
    /etc/alternatives/awk  ----> 其实这个还是一个符号连接  
    $ readlink /etc/alternatives/awk  
    /usr/bin/gawk  ----> 这个才是真正的可执行文件  


-f 选项：

    -f 选项可以递归跟随给出文件名的所有符号链接以标准化，除最后一个外所有组件必须存在。

    简单地说，就是一直跟随符号链接，直到直到非符号链接的文件位置，限制是最后必须存在一个非符号链接的文件。


$ readlink -f /usr/bin/awk  
    /usr/bin/gawk  

```  
