
sudo apt install subversion

svnserve --version

创建版本库目录
mkdir /home/hjimi/

创建版本库
mkdir /home/hjimi/svn-znjj/

svnadmin create /home/hjmim/svn-znjj/

版本库  /home/hjimi/svn-znjj/

版本库的目录 /home/hjimi/

## 配置
svnadmin create /home/hjimi/svn-znjj/ 下conf目录
    /home/hjimi/svn-znjj 目录必须为空

1. authz
    1. 账号权限的管理
    
    ```
    [/home/hjimi/svn-znjj/]   //第二个链接说 写成[\]
    tomrw = rw
    tomr = r
    tomw = w
    ```
    
1. passwd
    tomrw = tomrw
    tomr = tomr
    tomw = tomw

1. svnserve.conf (svn服务配置)
    anon-access = read
    auth-access = write
    (前边的空格也去掉)
    password-db = passwd
    authz-db = authz        //第二个链接说这个不要解封
    realm = My First Repository
    

1. svn端口号3690
    (tomcat端口号8080)
    
    /sbin/iptables -I INPUT -p tcp --dport 3690 -j ACCEPT
    (ubuntu 16 server 默认没有启动iptables???)

    /etc/init.d/iptables save
    /etc/init.d/iptables restart

    ufw enable  //开启防火墙
    ufw disable //关闭防火墙
    
    svnserve -d -r /home/hjimi   //(版本库目录地址)

    netstat -apn | grep 3690


按照第二个链接的做法 发现权限没起作用，tomr 也可以上传

svn 没有直接重启的方法，具体步骤如下：
    1. ps -ef | grep svn
    1. kill -9 [进程号]
    1. svnserve -d -r /home/hjimi   (所在目录)

    -r表示将svn的目录当作根目录

add
commit  //就是向服务器提交了

update 就是 pull


SVN在服务器端的存储方式和客户端是不一样的，所以在服务器端是看不到源文件的。服务器端有两种存储方式FSFS和BDB，目前默认都是FSFS。


怎么切换用户呢?



https://www.bilibili.com/video/av40310479/?p=3

https://www.cnblogs.com/Life-Record/p/7099297.html

https://www.cnblogs.com/ygj0930/p/6623148.html
