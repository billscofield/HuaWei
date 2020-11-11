
## 安装 server 端

https://www.bilibili.com/video/BV1ST4y1g7hZ?from=search&seid=7290441927366170177

服务端使用软件为: unrealirc

```
apt install build-essential 
apt install libssl-dev          //openssl 用于生成证书

useradd -m ircs -s /bin/zsh
cd ~ircs
wget --no-check-certificate --trust-server-names https://www.unrealircd.org/downloads/unrealircd-latest.tar.gz
tar -zxf unrealircd-5.0.7.tar.gz
cd unrealircd-5.0.7
./Config    一路回车enter即可
make && make install
cp ~/ircs/unrealircd/conf
cp examples/example.conf ./unrealirc.conf
vi unrealirc.conf
    oper bobsmith -> oper user                  
    下边的password "test" 改成 password "toor"  //oper 是什么? 管理人?

    kline-address 后边的内容要随便写一个邮箱地址

    network-name 这个是服务器名称, 这个决定了在 IRC 客户端上显示什么

cd ..
./unrealircd start
```

## 客户端

### Windows

推荐使用 HexChat

下载安装 HexChat
    1. Networks -> add  服务器配置文件中的 network-name
    1. 编辑 edit    ->  服务器地址写私服地址 192.168.1.1/6697
    1. 勾选 Use SSL for all the servers on this network
    1. 勾选 Accept invalid SSL certificates
    连接即可

### Linux

推荐使用 weechat

```
apt install weechat

/server add 服务器network-name 192.168.1.1/6697 -ssl -autoconnect
/set irc.server.heloIRC(这个是自己设置的network-name).ssl_verify off      //只是我现在不知道怎么用证书

此时应该就连上了服务器了

```

### 设置自定义的IRC服务器选项

WeeChat使用所有服务器的默认值（“后置方式”），如果你不为服务器选项指定一个特定的值。这些默认设定为 `"irc.server_default.*"`。
如果有服务器选项被定义（不为空），则使用它，否则，WeeChat使用默认值（”irc.server_default.xxx”）。

1. 例如，存在默认的nicks（基于你的 unix 登录名），你可以用下面的命令来覆盖freenode服务器用的设定：
    /set irc.server.freenode.nicks "mynick,mynick2,mynick3,mynick4,mynick5"

1. 设置用户和真实姓名：
    /set irc.server.freenode.username "My user name"
    /set irc.server.freenode.realname "My real name"

1. 在启动时启用自动连接到服务器：
    /set irc.server.freenode.autoconnect on

1. 在连接到oftc网络时加入#linode
    /set irc.server.oftc.autojoin "#linode"

1. 使用SSL连接：
    /set irc.server.freenode.addresses "chat.freenode.net/7000"
    /set irc.server.freenode.ssl on

1. 如果在服务器上可以使用SASL，你可以用它进行认证（在加入通道前就会被识别出来）
    /set irc.server.freenode.sasl_username "mynick"
    /set irc.server.freenode.sasl_password "xxxxxxx"

1. 要在连接到服务器后运行命令，使用nickserv进行身份验证(如果你不使用SASL进行身份验证的话)：
    /set irc.server.freenode.command "/msg nickserv identify xxxxxxx"

选项命令中的许多命令可以被分号；分隔。

如果你想在配置文件中保护你的密码，你可以使用安全数据。
    首先设置一个密码：
        /secure passphrase this is my secret passphrase
    然后使用freenode密码添加安全数据：
        /secure set freenode_password xxxxxxx
然后，您可以使用${sec.data.freenode_password}代替在上面提到的IRC选项中的密码，例如：

    /set irc.server.freenode.sasl_password "${sec.data.freenode_password}"

在连接到服务器时自动连接一些频道：
    /set irc.server.freenode.autojoin "#channel1,#channel2"

你可以使用Tab键和Shift+Tab来完成部分补全的名称和值（对于长单词，比如选项的名称）。

删除服务器选项的值，并使用默认值。 例如使用默认的nicks（irc.server_default.nicks）：
    /set irc.server.freenode.nicks null

其他选项：你可以使用以下命令设置其他选项(“xxx”是选项名)：
    /set irc.server.freenode.xxx value

当WeeChat结束时，所有的设置都被保存（或者使用/save命令强制执行选项的写入）。



## 相关术语

### 服务器

/help server
list: list servers (without argument, this list is displayed)
listfull: list servers with detailed info for each server
     add: add a new server
    name: server name, for internal and display use; this name is used to connect to the server (/connect name) and to set server options: irc.server.name.xxx
hostname: name or IP address of server, with optional port (default: 6667), many addresses can be separated by a comma
   -temp: add a temporary server (not saved)
  option: set option for server (for boolean option, value can be omitted)
nooption: set boolean option to 'off' (for example: -nossl)
    copy: duplicate a server
  rename: rename a server
 reorder: reorder list of servers
    open: open the server buffer without connecting
    keep: keep server in config file (for temporary servers only)
     del: delete a server
 deloutq: delete messages out queue for all servers (all messages WeeChat is currently sending)
    jump: jump to server buffer
     raw: open buffer with raw IRC data



### 频道

Channel name must start with a hash mark (#)

1. 加入频道    /join #channel

1. 要分离或离开频道，请运行

    /part [quit message]

    离开这个房间，但是并不关闭这个房间，新的消息也不会添加进来，相当于留了一个离开时的快照

1. 关闭服务器、通道或私有缓冲区（/close等同于/buffer close）：
    /close

当从服务器断开时，所有的通道和私有缓冲器被关闭。

1. 通过在服务器缓冲器中执行 /disconnect 断开服务器



### 信息

缓冲区: 和某人的聊天窗口，类似和某人聊QQ，你和他之间的窗口就是缓冲区

切换缓冲区:
    /buffer 唯一标识

单独和某人通话  /query [who]
    这个窗口应该叫缓冲区

关闭私有缓冲区  /close



缓冲区是与插件相关的一个部件，包括号码、类别和姓名。缓冲区包含屏幕上显示的数据。
窗口是用来显示缓冲区的。默认情况下，一个窗口只显示一个缓冲区。如果你分屏，可以看到与多个窗口相关联的缓冲区。
用于管理缓冲区和窗口的指令：

    /buffer
    /window

例如，将屏幕垂直分割为一个小窗口（1/3宽度）和一个大窗口（2/3），使用命令：

    /window splitv 33

删除分割：/window merge


### 

更改昵称: /nick newnickname 请注意，这仅在新昵称尚未被使用时才有效, 即 nick name 不能和其他人重复

向具有昵称的人发送消息: /msg nick-name messages
    有两种情况，
    1. 已经打开了这个人的缓冲区
        发送的消息在本地可见
    1. 还未打开了这个人的缓冲区
        打开这个人的缓冲区后，发送的消息在本地可见


退出 weechat 程序: /quit

/ban    从频道禁止用户,必须是 operator, 否则提示:You're not channel operator

/mouse enable 将启用鼠标支持，允许您滚动以及单击缓冲区以更改通道和服务器。

所有WeeChat命令都以/开头。WeeChat中的每个通道都是缓冲区。服务器也是缓冲区。 
    服务器1
    服务器2
        频道1
            query nickname1
            query nickname2
        频道2
    服务器3
        频道1

    每一行每一个分支即形象化为一个通道


命令            描述

/help           列出命令，如果给出命令，则显示命令用法和描述
/join           加入频道
/close          关闭缓冲区，如果您在其中，则将通道分开
/quit           退出WeeChat
/msg            发送消息给昵称（或频道） 同 /notice

/query          打开带缺口的私有缓冲区
/ban            从频道禁止用户
/unban          从频道取消用户
/kick           从频道中踢出用户
/kickban        从频道中踢出并禁止用户
/part           分配通道但不关闭缓冲区
/topic          设置频道主题
/whois          显示有关用户的信息
/away           离开，还是在线的状态，同QQ的忙碌状态;离开状态时再次/away 标识回来
    /away studying
/userhost 名字  查看网友的IP地址
/links          列服务器连接信息 
/list           列出所有聊天室
    



```
ctrl + x                        切换缓冲区
显示所有选项（WeeChat和插件）   /set                
显示WeeChat选项：               /set weechat.*      
显示IRC插件选项                 /set irc.*      

显示一个选项的帮助 / 帮助
    /help weechat.look.highlight

    会显示在另一个总配置那个buffer里边

```

有关certificate
```
Using WeeChat through the terminal (on Arch Linux), I can connect to Freenode's server with SSL. No problem there.

But if I try to connect to some IRC servers using SSL (e.g. ircs.overthewire.org), WeeChat gives the following errors:

gnutls: peer's certificate is NOT trusted
gnutls: peer's certificate issuer is unknown
irc: TLS handshake failed
irc: error: Error in the certificate.
Connecting to such servers with SSL only works if I do the following, as per the advice on WeeChat's FAQ:

/set irc.server.example.ssl_verify off
However, the same FAQ says that I should be careful, as this makes it less secure.

Is this something I can fix at all, or is it an issue I have to live with for some IRC servers?

---

TLS/SSL works the same way here as it does with HTTPS in web browsers. If the server's certificate is valid, you can access the website – if it isn't, you get a scary warning from the browser (client), because it has no way of knowing whether the validation failure is the result of the server being impersonated, or whether it's harmless misconfiguration on the admin's site.

(And unfortunately, most IRC server operators do not care about keeping their TLS certificates up-to-date – or indeed even obtaining valid ones in the first place.)

In this case, ircs.overthewire.org:6697 has a TLS certificate that at least used to be valid, but its issuer (StartCom Ltd.) is no longer trusted by most systems due to various misissuances. You get the message "issuer is unknown" because your OS no longer has the StartCom root CA certificate installed.

You have two options:

    1. Instead of using CA-based validation, tell Weechat to accept this specific certificate because you've validated it using another method. (Basically the method used by SSH.) To do this, set the option irc.server.example.ssl_fingerprint to the certificate's SHA-256 fingerprint (or the less secure SHA-1).

    The fingerprints of the certificate currently offered by the server are:

    sha1   = 540fbfe14671915ee939b3a78b8ce52bf45c8e85
    sha256 = 5916acbdfff8e1474402c75ccba2858c23e93348607d122e4f3106cbed6ab1ff

    This will work until the server operators change the certificate, at which point you'll have to either update the option with new fingerprints, or try your luck at using ssl_verify = on again.

    1. Not recommended: Download the StartCom root CA and mark it as trusted in your OS (or at least in Weechat).
```



https://blog.csdn.net/anci_flower/article/details/79816962#7-%E5%8F%82%E5%8A%A0%E9%A2%91%E9%81%93-%E9%80%80%E5%87%BA
https://cloud.tencent.com/developer/article/1346341

官方文档:   https://weechat.org/files/doc/stable/weechat_user.en.html
            https://weechat.org/files/doc/devel/weechat_faq.en.html

关于 certificate
    https://superuser.com/questions/1370210/weechat-only-connects-to-irc-server-with-ssl-if-ssl-verify-option-is-switched
