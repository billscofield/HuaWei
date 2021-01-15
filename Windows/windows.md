# windows



## win10 版本

1. win10的版本
    1. 家庭版（Home）
    1. 专业版（Pro）
    1. 教育版（Education）
        1. 和企业版区别不大
    1. 企业版（Enterprise）
        LTSB  = Long Term Support Branch
        LTSC =  Long Term Support Channel

        这两个是win10 Enterprise 特有的功能(其实一样，应该是更名了), 允许系统只更新安全补丁而不更新功能补。其他的版本则只能照单全收

        1. 这两个版本的特点
            1. 没有小娜 
            1. 没有应用商店及众多自带应用
            1. 没有One drive
            1. 无Edge浏览器
            1. 只推送安全性更新 摆脱自动更新的烦恼
            1. 精简部分后台服务 内存占用更低
    1. win10 移动版
    1. win10 企业移动版
    1. win10 物联网核心版lot




以前是两位数年份+两位数月份。现在后两位改为H1（上半年）或H2（下半年）

微软每年都会给win10两次大更新，而2004是20h1，所以20h2就2004下一个版本




## win10商店版本Ubuntu访问window资源

cd /mnt/

## win10访问 商店版本Ubuntu资源

C:\Users\Administrator\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu16.04onWindows_79rhkp1fndgsc\LocalState\rootfs



## 链接

1. https://msdn.itellyou.cn



## 更新

累积更新包含自上次更新以来的全部内容，以及本次更新添加的内容。

Delta 更新，即 Δ 更新＝增量更新，从名字来看应该不包括以前的更新内容，仅包含本次更新添加的内容



### 1. samba


#### 清除 samba 登录缓存

1. 建立磁盘映射：

    net use Z: \\192.168.1.7\ubuntu  smbpassword /user:smbuser

    Z: 你要映射到windows的哪个磁盘

    \\192.168.1.7\ubuntu：你的samba路径

    smbpassword：samba密码

    smbuser：samba用户名


1. 删除磁盘映射：

    net use * /del  /y

    * ：所有映射到windows的磁盘盘符，也可以指定具体的如Z: 、Y:

    /y：如果不加这个，每次都会提示你是否删除磁盘映射


将两个命令分别保存到两个批处理文件里面，需要哪个时就点击哪个，十分方便快捷。


#### windows10 samba 安全策略无法访问

1. window10    win+R   加入
2. gpedit.msc
3. 计算机配置
4. 管理模板
5. 网络 -> lanman工作站
6. lanman工作站  本地策略编辑器双击启动不安全来宾登录
7. 点击启用 就不会出现  报错连不上了


### 2. 远程登录 mstsc

远程桌面连接账户限制无法登陆解决方案

gpedit.msc

Windows设置-安全设置

本地策略-安全选项

帐户：使用空密码的本地账只允许进行控制台登陆 -> 已启用
