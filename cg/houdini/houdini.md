# Houdini

## 下载

官网下载安装文件

破解可以使用网上的方法


## crack

1. Unzip and unrar to a temp directory

2. ` Unpack houdini-19*.tar.gz (tar -xzvf)
    Run "./houdini.install" (without "") and follow instructions ..

    ./houdini.install --auto-install --accept-EULA 2021-10-13

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


端口号:
    1715 : houdini-lm   (Licese服务器上的)
    1714 : hserver      (client上的)


如果将 houdini 安装在共享存储上，并且在本地也安装了, hkey-bin 的默认服务器指向

/opt/hfs17/houdini/sbin/sesinetd.startup 中有个服务器地址


## 关于 active

/root/.sesi_licenses.pref 已经修改, 但还是隔一段时间就会掉 license

    `netstat -tnpu | grep 1715`

    查看又是监听到了本地的 1715

    ```
    mv /usr/lib/sesi{,.ori}

    systemctl stop sesinetd
    systemctl disable sesinetd

    还要注意下边这两个文件

    /etc/rc.d/init.d/sessinetd 这个脚本要删除, 有可能是这个的问题
    /etc/init.d/houdini                             // 应该就是它了
        #! /bin/bash
        #chkconfig: 2345 23 65

        pkill hserver
        /usr/lib/sesi/sesinetd.startup restart
        /opt/hfs17.5/bin/hserver                    // 改成正确的应该比较好一些
        /opt/hfs17.5/bin/hserver -S 127.0.0.1

    ```


/opt/hfs19.0/houdini/hserver.opt
    一些配置信息


/opt/hfs19.0/houdini/sbin/sesinetd_safe

```
[14:45:42]root@cuicen: /etc/init.d# ps -ef | grep sesinetd
root      10989      1  0 Feb22 ?        00:00:00 /bin/sh /usr/lib/sesi/sesinetd_safe --sesi=/usr/lib/sesi --sesinetd=/usr/lib/sesi/sesinetd --log-file=/var/log/sesinetd.log -V 2 -z 1048576
root      11220  10989  0 Feb22 ?        00:21:43 /usr/lib/sesi/sesinetd -l /var/log/sesinetd.log -D -V 2 -z 1048576
root      90883  77163  0 14:45 pts/15   00:00:00 grep --color=auto sesinetd
[14:45:51]root@cuicen: /etc/init.d# ps -p 10989
   PID TTY          TIME CMD
   10989 ?        00:00:00 sesinetd_safe

```


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

/var/log/messages
Mar 31 12:06:14 cuicen systemd-sysv-generator[56952]: Overwriting existing symlink /run/systemd/generator.late/sesinetd.service with real service

Configuration file /etc/systemd/system/runsunloginclient.service is marked executable. Please remove executable permission bits. Proceeding anyway.

    chmod -x /etc/systemd/system/runsunloginclient.service


avahi-daemon 服务


同时安装了 17 18 19
/var/log/message 有一条报错:
    
```
Mar 31 10:17:16 yanzixiang journal: Failed to find one package for sesi_hkey19.0.531.desktop, /usr/share/applications/sesi_hkey19.0.531.desktop, [0]
Mar 31 10:17:16 yanzixiang journal: Failed to find one package for sesi_houdinifx19.0.531.desktop, /usr/share/applications/sesi_houdinifx19.0.531.desktop, [0]
Mar 31 10:17:16 yanzixiang journal: Failed to find one package for sesi_houdinicore19.0.531.desktop, /usr/share/applications/sesi_houdinicore19.0.531.desktop, [0]
Mar 31 10:17:16 yanzixiang journal: Failed to find one package for sesi_hindie19.0.531.desktop, /usr/share/applications/sesi_hindie19.0.531.desktop, [0]
Mar 31 10:17:16 yanzixiang journal: Failed to find one package for sesi_mplay19.0.531.desktop, /usr/share/applications/sesi_mplay19.0.531.desktop, [0]
Mar 31 10:17:17 yanzixiang journal: Failed to find one package for sesi_happrentice19.0.531.desktop, /usr/share/applications/sesi_happrentice19.0.531.desktop, [0]
Mar 31 10:17:17 yanzixiang journal: Failed to find one package for sesi_pilotpdg19.0.531.desktop, /usr/share/applications/sesi_pilotpdg19.0.531.desktop, [0]
Mar 31 10:17:17 yanzixiang journal: Failed to find one package for sesi_uninstall19.0.531.desktop, /usr/share/applications/sesi_uninstall19.0.531.desktop, [0]
Mar 31 10:17:20 yanzixiang avahi-daemon[71911]: Invalid legacy unicast query packet.
M
```

    1. /usr/share/applications/sesi_hkey19.0.531.desktop

    ```
    [Desktop Entry]
    Name=License Administrator 19.0.531
    GenericName=License Administrator 19.0.531
    Comment=3D Animation Tools
    Exec=/opt/hfs19.0.531/bin/hkey %F
    Icon=/opt/hfs19.0.531/houdini_logo.png
    Type=Application
    Terminal=false
    Encoding=UTF-8
    Categories=Houdini Administrative Tools 19.0.531;
    ```

    2. /usr/share/applications/sesi_houdinifx19.0.531.desktop

    ```
    [Desktop Entry]
    Name=Houdini FX 19.0.531
    GenericName=Houdini FX 19.0.531
    Comment=3D Animation Tools
    Exec=/opt/hfs19.0.531/bin/houdinifx %F
    Icon=/opt/hfs19.0.531/houdini_logo.png
    Type=Application
    Terminal=false
    Encoding=UTF-8
    Categories=Houdini 19.0.531;
    ```

    3. /usr/share/applications/sesi_houdinicore19.0.531.desktop

    ```
    [Desktop Entry]
    Name=Houdini Core 19.0.531
    GenericName=Houdini Core 19.0.531
    Comment=3D Animation Tools
    Exec=/opt/hfs19.0.531/bin/houdinicore %F
    Icon=/opt/hfs19.0.531/houdini_logo.png
    Type=Application
    Terminal=false
    Encoding=UTF-8
    Categories=Houdini 19.0.531;

    ```

    4. /usr/share/applications/sesi_hindie19.0.531.desktop

    ```
    [Desktop Entry]
    Name=Houdini Indie 19.0.531
    GenericName=Houdini Indie 19.0.531
    Comment=3D Animation Tools
    Exec=/opt/hfs19.0.531/bin/hindie %F
    Icon=/opt/hfs19.0.531/houdini_logo.png
    Type=Application
    Terminal=false
    Encoding=UTF-8
    Categories=Houdini 19.0.531;

    ```

    5. /usr/share/applications/sesi_mplay19.0.531.desktop

    6. /usr/share/applications/sesi_happrentice19.0.531.desktop

    7. /usr/share/applications/sesi_pilotpdg19.0.531.desktop

    8. /usr/share/applications/sesi_uninstall19.0.531.desktop



### 脚本分析

dir = /opt/hfs19.0/bin

hkey
    Houdini License Administrator

    1. If $0 is a symlink, resolve it to a file

    2. Initialize application environment
        
        ` source app_init.sh

    3. 调用 hkey-bin


app_init.sh

    1. 如果定义了 HFS 变量则。。。
        
        根据查看 HFS 应该是 /opt/hfs19.0 这个目录

    2. APP_DIR 应该是 /opt/hfs19.0/houdini 这个目录

    3. 调用 houdini_setup
        
        /opt/hfs19.0/houdini_setup 会调用 houdini_setup_csh || houdini_setup_bash

            主要是一些环境变量

                HFS = "$PWD"    ∴ HFS -eq /opt/hfs19.0

hindie

    1. If $0 is a symlink, resolve it to a file

    2. Initialize application environment

    3. Now run the requested binary

        hindie-bin >  elf 文件


hmaster软链接到 -> houdinifx

houdinifx 和 hindie 感觉一样，还没细看
houdini, houdinicore 也是, 

hindie      source hindie-bin
houdinifx   source houdinifx-bin
houdini     source houdini-bin
houdinicore source houdinicore-bin
hselect     source houdinicore
hselect-bin source houdinicore-bin

会创建一个 polkitd 的用户

## 计划

搭建 nginx 负载均衡服务器, 后面堆 license servers


## license server

The license server (sesinetd) 

When a Houdini product needs a license, it communicates with **hserver**, which is
a helper program running on the client. Hserver communicates with the license
server (sesinetd).

It is the license server (sesinetd) that grants licenses to valid clients and
collects licenses when Houdini applications terminate.

If there is no hserver running on the client, Houdini will not start.

On Linux and Mac OSX, hserver is started automatically when you start a Houdini
application, or it can be started manually.

On Windows, both hserver and the license server are started as Services named
HoudiniServer and HoudiniLicenseServer respectively.

https://www.sidefx.com/faq/question/how-houdini-licensing-works/


---

The hserver program is automatically started and used by Houdini on the client machine.

If you have setup the Houdini environment, you can tell hserver to look to the remote server:

hserver -S hostname

where hostname is the name of your license server.


the Houdini environment

cd path to Houdini installation
source houdini_setup


第一次启动 houdini 时, .sesi_license.pref=IPA, houdini 会调用 hserver , hserver 会调用这个IPA
hserver 在后台运行
此时更改 .sesi_license.pref=IPB
关掉 houdini， IPA 的license 被回收
打开 houdini, 因为 hserver 还是用的 IPA, 所有继续从 IPA 获取 license
hserver -l


如果 某个用户的 .sesi_license.pref 为空， 这个用户启动 houdini 的时候，这个 .sesi_license.pref 会被填写上 server=计算机名称

---


[What are other methods to set the license server on the client?](https://www.sidefx.com/faq/question/what-are-other-methods-to-tell-the-client-to-look-to-the-license-server/)

    1. The client hserver program.
    2. A hidden file.               // linux 的 .sesi_license.pref
    3. Windows registry entry.      // windows 注册表
    4. Using a DNS service record.
        _sesi-lm._tcp   IN      SRV     0 0 1715 your-license-server-name.yourdomain.com.
        应该得安装 avahi-daemon

License Server Log
    /var/log/sesinetd.log

### 安装

18
./houdini.install --install-license --no-install-houdini --accept-EULA 2020-05-05

19
./houdini.install --install-license --no-install-houdini --no-install-avahi --accept-EULA 2021-10-13

会出现一个选择界面，F



    --accept-EULA 2021-10-13

    --install-license | --no-install-license¬
       Select or deselect sesinetd (license server) for installation

    --install-avahi | --no-install-avahi¬
       Select or deselect Avahi for installation (Runs package management tool \`apt-get\` or \`yum\` to install Avahi)

    --install-houdini | --no-install-houdini¬
       Select or deselect Houdini and the HDK for installation

    注意给 /usr/lib/sesi/license 的权限 644, 要有r


### hserver

-l [ --info  ]                         Request information about a running hserver
-h [ --host  ] arg                     Specify a remote host to query

    hserver -h 10.0.0.1 -l


--connect-timeout-ms arg (=-1)         Max amount of time to try and connect to the server

--print-options                        output the current option values


License Server Chaining
    hserver -S "sesinetd1;sesinetd2"        // 必须有双引号


How do I enable hserver logging
    Restart hserver after modifying the options file.

    Add these options to the hserver options file:
    (linux: /mnt/usr/hfs18.5.506/houdini/hserver.opt)

    logfile=C:\hserver.log
    debugMode=1
    enableHttp=1

    Modify the logfile to the path where you would like the file to be written to.

    Please refer to www.sidefx.com/docs/houdini/ref/utils/hserver.html#optfile





hserver.opt

    logFile = ""
    debugMode = 1
    logToSystem = 1



### Which licenses are needed to run which product?
