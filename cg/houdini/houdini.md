# Houdini

## 下载

官网下载安装文件

破解可以使用网上的方法


## crack

1. Unzip and unrar to a temp directory

2. ` Unpack houdini-19*.tar.gz (tar -xzvf)
    Run "./houdini.install" (without "") and follow instructions ..

3. Before Starting Houdini, you must first set up the shell environment.

    At a C shell prompt (csh, tcsh, bash), type the following:

    source houdini_setup 
    (you run this within the installed dir)
    This command initializes the current shell's environment to run
    Houdini.  You may want to add the above line to your .login file.

4. Licensing:

    Stop license server (/etc/init.d/sesinetd stop or sesictrl -q)

    Copy the sesinetd (from Crack dir) matching your version to  /usr/lib/sesi/
    (overwrite)

    Make sure you dont change file access permissions (in other words make sure
    the binary is executable chmod 755 sesinetd in case) 

    Restart license server 

    Launch the License Administrator by typing "hkey".

    In the Server Information you will find your Server Name & Server Code

    Launch XFORCE Linux keygen (Houdini-KG-lnx or Houdini-KG-lnx-static) or
    XFORCE Windows Keygen 

    Enter your Server Name & Server Code 
    (those can also be obtained this way : /usr/lib/sesi/sesictrl -n)
    and generate your license keys ...

    Go back to the License Administrator 
    Select File/Manually Enter Keys...
    Copy paste the keys you generated 5 by 5 .
    Key string #1 should be SERVER your_server_name server_code ..... 
    You can also enter your keys this way :  /usr/lib/sesi/sesictrl -I key

    Install the "other keys to play with" at your own risk, those are mainly
    for dev and debug ... so Make sure you installed the License keys first

5. To start Houdini FX, type "houdinifx".


## 关于 active

/root/.sesi_licenses.pref 已经修改, 但还是隔一段时间就会掉 license
    
    ` netstat -tnpu | grep 1715

    查看又是监听到了本地的 1715

    ```
    mv /usr/lib/sesi{,.ori}

    systemctl stop sesinetd
    systemctl disable sesinetd
    ```


/opt/hfs19.0/houdini/hserver.opt
    一些配置信息



ps -ef | grep -i sesinetd | grep -v grep

```
root      11072      1  0 Mar17 ?        00:00:00 /bin/sh /usr/lib/sesi/sesinetd_safe --sesi=/usr/lib/sesi --sesinetd=/usr/lib/sesi/sesinetd --log-file=/var/log/sesinetd.log -V 2 -z 1048576
root      11100  11072  0 Mar17 ?        00:09:36 /usr/lib/sesi/sesinetd -l /var/log/sesinetd.log -D -V 2 -z 1048576
```

/var/log/sesinetd.log
```
84272bda: Generic    Houdini-Escape 17.5                 100/100 free
a73a0905: Generic    Houdini-Escape 17.5                 0/0 free
4c03956a: Generic    Houdini-Escape 17.5                 100/100 free
9781e4c5: Generic    Houdini-Escape 18.5                 100/100 free
6dc2adf6: Generic    Houdini-Render-Plus 17.5            100/100 free
adafe398: Generic    Houdini-Render-Plus 17.5            100/100 free
514d6f03: Generic    Houdini-Render-Plus 17.5            0/0 free
356f1ccc: Generic    Houdini-Render-Plus 18.5            100/100 free


04:15:19 03/30/22 sesinetd: Usage: 0/0/0 Houdini/NonGraphic/Render [Peak 1/0/0]
04:15:19 03/30/22 sesinetd: QueueStats: 4975 requests 1/280 peak/fail
04:15:19 03/30/22 sesinetd:    Threads: 1 peak, wait: 0.00121174/2.9873
04:15:19 03/30/22 sesinetd:   Max Wait: 3.00516 (0.099844/0.049923)
04:15:19 03/30/22 sesinetd:   Avg Wait: 0.187097 (0.0190455/0.000842715)
```

avahi-daemon 服务



## 计划

搭建 nginx 负载均衡服务器, 后面堆 license servers

