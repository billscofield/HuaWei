## 认证

### 1. 本地认证

密码的存放位置
    %SystemRoot%\system32\config\sam

3. NTLM(NT LAN Manager) Hash

    NTLM Hash 的前身是 LM Hash, 已基本淘汰

    NTLM Hash 是支持 Net NTLM 认证协议及本地认证过程中的一个重要参与物
    长度为 32 位，
    由数字与字母组合

    windows 本身不存储用户的明文密码, 经加密后存储在 sam 数据库中

    登陆时，将输入的密码也加密成 NTLM Hash, 于 sam 中的 NTLM Hash 进行比较


    LM Hash
        将所有小写转大写
        密码被转为16进制，分两组，填充为14个字符，空余位使用 0x00 字符填充
        将密码分割为两组7个字节的块
        将每组转化为比特流，不足56bit则在左边加0(二进制)
        将比特按照7bit 一组，分出8组，末尾加0
    


    NTLM 是指 telnet 的一种验证身份方式，即问询/应答身份验证协议，是 Windows NT
    早期版本的标准安全协议，Windows 2000 支持 NTLM 是为了保持向后兼容。Windows
    2000内置三种基本安全协议之一。

    早期SMB协议在网络上传输明文口令。后来出现 LAN Manager Challenge/Response验
    证机制，简称LM，它是如此简单以至很容易就被破解。微软提出了WindowsNT挑战/响
    应验证机制，称之为NTLM。已经有了更新的 NTLM v2 以及 Kerberos 验证体系。NTLM
    是windows早期安全协议，因向后兼容性而保留下来。NTLM是NTLAN Manager的缩写，
    即NT LAN管理器。

    ```python

    nthash.hash("admin")

    过程
        admin -> hex(16进制编码)    = xxxx
        xxxx -> Unicode             = yyyy
        yyyy -> md4                 = zzzz
        
        admin => zzzz
    ```

本地认证流程

    1. windows logon process(winlogon.exe), 是windows NT 用户登录程序，用于管理
       用户登录和退出

    2. LSASS 用于Windows 系统的安全机制, 用于本地安全和登录策略

### 2. 





## Windows 2008R2 修改SID

使用各种虚拟机软件或云软件复制出来的系统，SID都是一样的，而域里需要每台主机的SID都是独立的。

如果需要加域操作，需要每台主机SID都不同，那么我需要重置修改SID。

步骤：

在WINDOWS2008系统集成了sysprep工具,只要在C盘下搜索就能找到,如没意外路径为:

c:\windows\system32\sysprep\sysprep.exe

运行此指令后会弹出一下对画框,系统清理动作“进入系统全新体验（OOBE）”，开机选项“重新开机”

完成后可以用命令查看SID的改变

开始---运行--cmd---whoami /user




