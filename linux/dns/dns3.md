


查询方式
1. 递归查询：客户机与本地DNS服务器之间
1. 迭代查询：本地DNS服务器与根等其他DNS服务器的解析过程





named.root 需要到根域上去下载。如下：

```
ftp rs.internic.net
Connected to rs.internic.net.

Name (rs.internic.net:root): anonymous
331 Please specify the password.

ftp&gt; cd domain

ftp&gt; get root.zone
local: named.root remote: named.root
227 Entering Passive Mode (199,7,52,73,189,56)
150 Opening BINARY mode data connection for named.root (3048 bytes).
226 File send OK.
3048 bytes received in 7.9e-05 seconds (3.8e+04 Kbytes/s)
ftp&gt; bye
```


bind9
https://edu.51cto.com/center/course/lesson/index?id=92374
