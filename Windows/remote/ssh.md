
## windows 下的 ssh


freesshd

https://www.cnblogs.com/xred/archive/2012/04/21/2461627.html


问题如下:
    1. 用户是由 freesshd 进行管理
    1. 关掉后或重启程序后，设定的用户,和验证方式就没有了，不适合做后台Daemon




windows 下查看端口程序
    netstat -ano | findstr :22          // 找到端口号的 pid

    启动任务管理器                      // 默认win7好像没有显示pid, 查看>选择进程页列>勾选PID



## win10 openssh

OpenSSH 是安全 Shell (SSH) 工具的开放源代码版本，Linux 及其他非 Windows 系统的管理员使用此类工具跨平台管理远程系统。 OpenSSH 在 2018 年秋季已添加至 Windows，并包含在 Windows 10 和 Windows Server 2019 中。
SSH 基于客户端-服务器体系结构，用户在其中工作的系统是客户端，所管理的远程系统是服务器。 OpenSSH 包含一系列组件和工具，用于提供一种安全且简单的远程系统管理方法，其中包括：
    sshd.exe，它是远程所管理的系统上必须运行的 SSH 服务器组件
    ssh.exe，它是在用户的本地系统上运行的 SSH 客户端组件
    ssh-keygen.exe，为 SSH 生成、管理和转换身份验证密钥
    ssh-agent.exe，存储用于公钥身份验证的私钥
    ssh-add.exe，将私钥添加到服务器允许的列表中
    ssh-keyscan.exe，帮助从许多主机收集公用 SSH 主机密钥
    sftp.exe，这是提供安全文件传输协议的服务，通过 SSH 运行
    scp.exe 是在 SSH 上运行的文件复制实用工具

    https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_overview

    主 OpenSSH 开源项目是由 OpenBSD 项目的开发人员管理的。

    此项目的 Microsoft 分支在 GitHub中


## PowerShell Server
