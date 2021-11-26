
DAS
NAS
SAN




被动模式端口号：
    e x 256 + f

    需要使用  ftp 这个客户端去连接才会显示下列信息：

    ```
    226 Directory send OK.
    ftp> passive
    Passive mode on.
    ftp> ls
    227 Entering Passive Mode (10,0,5,18,135,137).
    150 Here comes the directory listing.
    ```


## ftp passive mode port number:

https://www.melvinswebstuff.com/blog/2009/04/24/calculate-ftp-data-port/

When communicating over FTP, two ports are used, one for commands and the other for data.

Here’s how to calculate the ftp data port:

227 Entering Passive Mode (10,10,1,11,19,15)

10,10,1,11 is the server’s TCP/IP address.

19,15 is the port that the server is telling the client to use during the data transfer. To calculate this port, use the formula: (first value x 256) + second value.

This example has a value of (19 x 256) + 15 = 4879.

So the data port for this FTP connection will be port number4879.

[RFC 959 – File Transfer Protocol](https://www.ietf.org/rfc/rfc959.txt)
