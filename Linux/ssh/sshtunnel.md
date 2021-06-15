
## 隧道

### 本地端口转发 -L


                                  +-----+
                 +----<-OK->------|host3|---<-OK->---+
                 |                +-----+            |
                 +                                   +
+-----+       +-----+                             +-----+
|host0|<----> |host1|-------------NO WAY----------|host2|
+-----+       +-----+                             +-----+


host3 可以访问 host1 和 host2

host1 不可以访问 host2

如何从 host1 连接上 host2 ?

    ssh -L -g host1:port1:host2:port2  user@host3



ssh连接来说，实现方式很简单，从host1 ssh到host3，再ssh到host2，也就是将host3作为跳板的方式。但是如果不是ssh，而是http的80端口呢？如何让host1能访问host2的80端口?


ssh支持本地端口转发，语法格式为：

    ssh -L [local_bind_addr:]local_port:remote:remote_port middle_host

以上图为例，实现方式是在host1上执行：

[root@xuexi ~]# ssh -g -L 2222:host2:80 host3

其中"-L"选项表示本地端口转发，其工作方式为：在本地指定一个由ssh监听的转发端口(2222)，将远程主机的端口(host2:80)映射为本地端口(2222)，当有主机连接本地映射端口(2222)时，
本地ssh就将此端口的数据包转发给中间主机(host3)，然后host3再与远程主机的端口(host2:80)通信。

现在就可以通过访问host1的2222端口来达到访问host2:80的目的了。


#### 再来解释下"-g"选项

指定该选项表示允许外界主机连接本地转发端口(2222)，如果不指定"-g"，则host4将无法通过访问host1:2222达到访问host2:80的目的。甚至，host1自身也不能使用172.16.10.5:2222，
而只能使用localhost:2222或127.0.0.1:2222这样的方式达到访问host2:80的目的，之所以如此，是因为本地转发端口默认绑定在回环地址上。可以使用bind_addr来改变转发端口的绑定地址，例如：

[root@xuexi ~]# ssh -L 172.16.10.5:2222:host2:80 host3
这样，host1自身就能通过访问172.16.10.5:2222的方式达到访问host2:80的目的。

一般来说，使用转发端口，都建议同时使用"-g"选项，否则将只有自身能访问转发端口。

再来分析下转发端口通信的过程。


当host4发起172.16.10.5:2222的连接时，数据包的目标地址和端口为"172.16.10.5:2222"。由于host1上ssh已经监听了2222端口，并且知道该端口映射自哪台主机哪个端口，所以将会把该数据包
目标地址和端口替换为"172.16.10.3:80"，并将此数据包通过转发给host3。当host3收到该数据包时，发现是host1转发过来请求访问host2:80的数据包，所以host3将代为访问host2的80端口。

所以，host1和host3之间的通信方式是SSH协议，这段连接是安全加密的，因此称为"安全隧道"，而host3和host2之间通信协议则是HTTP而不是ssh。

现在再来考虑下，通过本地端口转发的方式如何实现ssh跳板的功能呢？仍以上图为例：

[root@xuexi ~]# ssh -g -L 22333:host2:22 host3]
这样只需使用ssh连上host1的22333端口就等于连接了host2的22端口。

最后，关于端口转发有一个需要注意的问题：ssh命令中带有要执行的命令。考虑了下面的三条在host1上执行的命令的区别。

[root@xuexi ~]# ssh -g -L 22333:host2:22 host3
[root@xuexi ~]# ssh -g -L 22333:host2:22 host3 "ifconfig"
[root@xuexi ~]# ssh -g -L 22333:host2:22 host3 "sleep 10"

第一条命令开启了本地端口转发，且是以登录到host3的方式开启的，所以执行完该命令后，将跳到host3主机上，当退出host3时，端口转发功能将被关闭。另外，host1上之所以要开启端口转发，
目的是为了与host2进行通信，而不是跳到host3上，所以应该在ssh命令行上加上"-f"选项让ssh在本机host1上以后台方式提供端口转发功能，而不是跳到host3上来提供端口转发功能。

第二条命令在开启本地转发的时候还指定了要在host3上执行"ifconfig"命令，但是ssh的工作机制是远程命令执行完毕的那一刻，ssh关闭连接，所以此命令开启的本地端口转发功能有效期只有执行ifconfig命令的一瞬间。

第三条命令和第二条命令类似，只不过指定的是睡眠10秒命令，所以此命令开启的本地转发功能有效期只有10秒。

结合上面的分析，开启端口转发功能时，建议让ssh以后台方式提供端口转发功能，且明确指示不要执行任何ssh命令行上的远程命令。即最佳开启方式为：

[root@xuexi ~]# ssh -f -N -g -L 22333:host2:22 host3


-f  Requests ssh to go to background just before command execution.  
    This is useful if ssh is going to ask for passwords or passphrases, but the user wants it in the background.  
    This implies -n.  The recommended way to start X11 programs at a remote site is with something like ssh -f host xterm.

-N  Do not execute a remote command.  This is useful for just forwarding ports.






### 远程端口转发 -R

-R [bind_address:]port:host:hostport
-R [bind_address:]port:local_socket
-R remote_socket:host:hostport
-R remote_socket:local_socket
-R [bind_address:]port



