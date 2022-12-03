

由于zerotier官方服务器主要是在国外，在国内高峰时期经常会出现连接不上官方服务器的情况

PLANET 行星服务器，Zerotier 各地的根服务器，有日本、新加坡等地
moon 卫星级服务器，用户自建的私有根服务器，起到中转加速的作用
LEAF 相当于各个枝叶，就是每台连接到该网络的机器节点。


zerotier-cli listpeers
    能看到上边那几个名词



curl -s https://install.zerotier.com | sudo bash
systemctl enable zerotier-one

加入zerotier网络
    zerotier-cli join <network id>

生成moon.json模板
    cd /var/lib/zerotier-one
    zerotier-idtool initmoon identity.public > moon.json 

修改moon.json模板

    要记住id之后加入moon服务器全靠他。检查 "id"是否为你vps的10为字符id，可在
    zerotier网页管理端查看，如果不是说明上一步配置有误。vi 编辑 moon.json，修改
    “stableEndpoints” 为 VPS 的公网的 IP，以 IPv4 为例，记得带引号：

        "stableEndpoints": [ "8.8.8.8/9993"  ]

生成签名文件
    用到上一步中的 moon.json， 执行

    zerotier-idtool genmoon moon.json
    执行之后生成 000000xxxx.moon 文件。

将 moon 节点加入网络

    在 VPS 的 Zerotier 安装目录下（/var/lib/zerotier-one）建立文件夹 moons.d，
    将生成的 .moon文件拷贝进去。

    重启 zerotier，重启电脑。至此，VPS 上（moon 服务器）配置完成。


客户机连接moon节点
其他虚拟局域网中的机器想要连接到 moon 节点的话有两种方法。

    第一种方法就是使用 zerotier-cli orbit 命令。
    使用之前步骤中 moon.json 文件中的 id 值 (10 位的字符串）分别在客户端机器里执行：

        zerotier-cli orbit <id> <id>

    完成（一般来说这两个id都是相同的）

    ```
        [root@idv-36f9d5 ~]# zerotier-cli orbit 3ed7c***** 3ed7c*****
        200 orbit OK

        / ˈɔːrbɪt / 环绕，轨道
    ```

    第二种方法是需要在 /var/lib/zerotier-one 目录下新建 moons.d 文件夹和 moon
    节点一样，将 000000xxxx.moon 文件放到其中，并重启 zerotier。)

测试
    在其他LEAF服务器上运行

        zerotier-cli listpeers

    如果有 moon 服务器 IP 地址的那一行后面有 moon 字样，证明 moon 节点已经被本机连接。


不同系统下的 ZeroTier 目录位置：

    Windows: C:\ProgramData\ZeroTier\One
    Macintosh: /Library/Application\ Support/ZeroTier/One)
    Linux: /var/lib/zerotier-one
    FreeBSD/OpenBSD: /var/db/zerotier-one






zerotier one是众多内网穿透工具平衡性最好的

    首先是连接速度和延迟表现不佳，主要受限于多重NAT和运营商UDP QOS的影响。当然
    两个通讯的节点都有ipv6的环境下，或是拥有私人MOON节点的时候变现会有所提升。

    另外就是zerotier one的安全性不是很好。zerotier one通过一串16字符的网络ID和
    管理面板授权，就可以让的节点加入虚拟局域网。一旦管理面板的的账号密码泄露，
    内网就有可能被入侵。

    另外zerotier one的免费版只能添加50个节点，而第三方控制器则不受限制。

ztncui 是 zerotier one众多开源第三方控制器中的一个，之所以选它是因为它是唯一一个
拥有图形界面的。通过配置客户端的planet就可以跳过官方节点，使用ztncui完成各个节
点之间的通讯和打洞。


一个具有固定公网ip的云服务器，最好同时具备固定ipv6。






## ztncui&Zerotier安装与设置

ztncui依赖于zerotier，所以需要先安装zerotier

    curl -s https://install.zerotier.com | sudo bash




    curl -O https://s3-us-west-1.amazonaws.com/key-networks/deb/ztncui/1/x86_64/ztncui_0.7.1_amd64.deb
    apt-get install ./ztncui_0.7.1_amd64.deb
    sh -c "echo 'HTTPS_PORT=3443' > /opt/key-networks/ztncui/.env"
    sh -c "echo 'NODE_ENV=production' >> /opt/key-networks/ztncui/.env"
    systemctl restart ztncui





## 

https://zhuanlan.zhihu.com/p/544807922


放开 TC:3443  UDP:9993

wget https://gitee.com/opopop880/zerotier_planet/raw/master/zerotier_planet_debain.sh
sh ./zerotier_planet_debain.sh

打开 https://你的云服务器ip或者域名:3443 登录用户名admin 密码默认 password



