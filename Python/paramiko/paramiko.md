
## paramiko

最开始 ssh 的简单封装

基于 paramiko 二次开发的工具

    fabic


### 安装

pyenv

pip install paramiko


### ssh 连接步骤

1. ssh server 建立 server public key, 对应文件: 

    /etc/ssh/ssh_host_ 文件

1. ssh client 发出连接请求

1. ssh server 发送 server public key 给 ssh client [client 如何反应]

1. ssh client 比较 server public key, 同时计算自己的 client public/private key

1. ssh client 发送 client public key 给到 ssh server

1. 开始连接，双向加解密


### 控制方式

通常有两种控制方式，使用SSHClient和使用terminal，这两种的差别分别为：

1. 使用SSHClient发送命令后，ssh通道自动关闭

1. 使用terminal发送命令后，ssh通道不会自动关闭


### SSHClient 使用流程

import paramiko

1. 创建 SSH 对象

    ssh = paramiko.SSHClient()

1. 允许连接不在 known_hosts 文件中的主机

    ssh.set_missing_host_key_policy(paramiki.AutoAddPolicy())

1. 连接服务器

    ssh.connect(                    // help(ssh.connect)
        hostname, 
        port=22, 
        username=None, 
        password=None, 
        timeout=None, 
        allow_agent=True, 

        pkey=None, 
        key_filename=None, 
        look_for_keys=True, 
        compress=False, 
        sock=None, 
        gss_auth=False, 
        gss_kex=False, 
        gss_deleg_creds=True, 
        gss_host=None, 
        banner_timeout=None, 
        auth_timeout=None, 
        gss_trust_dns=True, 
        passphrase=None, 
        disabled_algorithms=None
    )


1. 执行命令
    
    stdin, stdout, stderr = ssh.exec_command('COMMAND')


1. 获取命令结果

    result = stdout.read()

1. 关闭连接

    ssh.close()



### terminal 使用流程

import paramiko

1. 创建 SSH 对象

    ssh = paramiko.SSHClient()

1. 允许连接不在 known_hosts 文件中的主机

    ssh.set_missing_host_key_policy(paramiki.AutoAddPolicy())

1. 连接服务器

    ssh.connect(                    // help(ssh.connect)
        hostname, 
        port=22, 
        username=None, 
        password=None, 
        timeout=None, 
        allow_agent=True, 

        pkey=None, 
        key_filename=None, 
        look_for_keys=True, 
        compress=False, 
        sock=None, 
        gss_auth=False, 
        gss_kex=False, 
        gss_deleg_creds=True, 
        gss_host=None, 
        banner_timeout=None, 
        auth_timeout=None, 
        gss_trust_dns=True, 
        passphrase=None, 
        disabled_algorithms=None
    )

1. 激活 terminal
    
    ch = ssh.invoke_shell()

1. 执行命令

    ch.send(cmd)

1. 获取命令结果

    result = ch.recv(10000).decode()

1. 关闭连接

    ssh.close()


获取从terminal的返回数据，只能通过recv指定接收的数据量，遇到数据量大的时候，可以采用循环接收的方式.同时加入超时的判断，让程序的逻辑更为完善，代码如下：

```
def ssh_cmd(conn, cmd, timeout):
    result = ''
    if conn != None:
        conn.send(cmd)
        time1 = time.time()
        while(1):
            result = result + conn.recv(10000).decode()
            time.sleep(0.01)
            time2 = time.time()
            if(time2 - time1 > timeout):
                break
    return result
```
当然，你可以加入结束符的控制，遇到接收的字符串中有特定的结束符，则跳出接收循环即可。



对交换机的控制，如果一个逻辑中包含了一个操作，则直接使用SSHClient控制即可；但事实上，对交换机的操作往往是需要执行一系列的命令，如果还是使用SSHClient就会
显得力不从心，虽然SSHClient可以一次性发送多条命令，但同时发送命令会导致有些命令会执行不成功。因此，使用terminal发送命令，更为适合，控制起来也会更方便。



```
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiki.AutoAddPolicy())
    ssh.connect(...)
    ch = ssh.invoke_shell()

    ssh_cmd(ch,"system-vie",1)
    ssh_cmd(ch,"sys router",1)
    ssh.close()
```




### 华为交换机

```huawei.py
import paramiko

ssh_RT = paramiko.SSHClient()
ssh_RT.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh_RT.connect(
        sIP,
        port=22,
        username=uuu,
        password=sss,
        timeout=5,
        look_for_keys=False,
        allow_agent=False
        )

sComando = 'dis arp'
stdin, stdout, stderr = ssh_RT.exec_command(sComando)
sOut = stdout.read().decode()
print (sOut)
ssh_RT.close()

```

this code runs perfectly with cisco's router but with huawei router, it stays put and doesn't finish ?

https://stackoverflow.com/questions/63514413/paramiko-in-router-huawei




华为官方的代码


https://forum.huawei.com/enterprise/en/python-run-multiple-commands-in-huawei-routers-switches-network-automation-scripts/thread/626847-100179

```
import paramiko
import time

conn = paramiko.SSHClient()                                 # High-level representation of a session with an SSH server
conn.set_missing_host_key_policy(paramiko.AutoAddPolicy())  # When 1st connection, ask to trust this server or not
# Change SSH key authentication as "Trust All". Add untrusted hosts
conn.connect("129.9.0.104", 22, "root", "Test1234.")        # Initiate SSH connection with IP, Port, Username, Password

commands = conn.invoke_shell()                              # Request an interactive shell session on this channel.

commands.send("display device\n")                           # Send command to device
time.sleep(.5)                                              # Wait for 0.5seconds, I put time.sleep as 0.5 sec after each command to avoid overlap between commands
output = commands.recv(65535)                               # .recv() - The maximum amount of data to be received at once is specified by nbytes
output = output.decode("utf-8")                             # Change file type from bytes to string
print (output)

commands.send("display memory \n")
time.sleep(.5)
output = commands.recv(65535)
output = output.decode("utf-8")
print (output)

commands.send("display alarm all \n")
time.sleep(.5)
output = commands.recv(65535)
output = output.decode("utf-8")
print (output)


commands.send("sys \n")
commands.send( "interface g0/1/3 \n" )
commands.send( "undo shutdown \n" )
commands.send( "di th \n" )
time.sleep(.5)
output = commands.recv(65535)
output = output.decode("utf-8")
print (output)

```
