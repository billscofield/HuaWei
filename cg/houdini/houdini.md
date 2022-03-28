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


## 计划

搭建 nginx 负载均衡服务器, 后面堆 license servers
