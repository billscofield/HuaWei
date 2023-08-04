# clash

[github](https://github.com/Fndroid/clash_for_windows_pkg/releases)

支持Shadowsocks(SS)、Socks、Snell、V2Ray、Trojan等代理协议。
自 v0.11.2 开始，开始支持ShadowsocksR(SSR)

## 界面简介

- General（常规）：
    - Port、Socks Port；分别为 HTTP、SOCKS 代理端口，点击终端图案可以打开一个配置了代理的命令行窗口，点击端口数字可以复制该命令；
    - Allow LAN：启用局域网共享代理功能；
    - Log Level：日志等级；
    - Home Directory：点击下方路径直达 C:\Users\用户名\.config\clash 文件夹；
    - GeoIP Database：点击下方日期可更新 GeoIP 数据库；
    - UWP Loopback ：可以用来使 UWP 应用解除回环代理限制；
    - Tap Device ：安装 cfw-tap 网卡，可用于处理不遵循系统代理的软件（实际启动 tap 模式需要更改配置文件）；
    - General YML：编辑 config.yml 文件，可用于配置部分 General 页面内容；
    - Dark Theme：控制暗色模式；
    - System Proxy：启用系统代理；
    - Start with Windows：设置开机自启；
- Proxies（代理）：选择代理方式（Global – 全局、Rule – 规则、Direct – 直连）及策略组节点选择；
- Profiles（配置管理）：
    - 用来下载远端配置文件和创建本地副本，且可在多个配置文件间切换；
    - 对配置进行节点、策略组和规则的管理（添加节点、策略组和规则在各自编辑界面选择 Add, 调整策略组顺序、节点顺序及策略组节点使用拖拽的方式）；
- Logs（日志）：显示当前请求命中规则类型和策略；
- Connections (连接): 显示当前的 TCP 连接，可对某个具体连接执行关闭操作；
- Settings（设置）：软件详细设置；
- Feedback（反馈）：显示软件、作者相关信息



apt install socat
vaxilu/x-ui

## shadowsockets

服务端

    apt install shadowsocks-libev

    /etc/shadowsocks-libev/config.json
        ip 地址改为 0.0.0.0
        port 8388

    sytemctl restart shadowsocks-libev

    journalctl -u shadowsocks-libev.service -u

    重放攻击

        可以被 GFW 探测到

### vray-plugin

pulg 对原始数据进行伪装，客户端和服务器端都要安装插件

apt install shadowsocks-v2ray-plugin

dpkg -L shadowsocks-v2ray-plugin

    /etc/shadowsocks-libev/config.json

    [github](https://github.com/shadowsocks/v2ray-plugin)

    "plugin":"ss-v2ray-plugin",
    "plugin_opts":"server"

    sytemctl restart shadowsocks-libev

客户端

    [shadowsocks](https://github.com/shadowsocks)

    [shadowsocks-windows 插件 v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin/releases)

    将 shadowsocks-windows 插件放在 ss 目录，启动的时候添加该插件


## trojan

[trojan-go](https://github.com/p4gefau1t/trojan-go)

下载编译好的二进制

wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip

```server.conf
{
  "run_type": "server",
  "local_addr": "0.0.0.0",
  "local_port": 443,
  "remote_addr": "127.0.0.1",               // 认证失败的接收服务器, 可以交给其它服务器
  "remote_port": 80,
  "password": ["your_awesome_password"],
  "ssl": {
    "cert": "your_cert.crt",                        // 证书
    "key": "your_key.key",                          // 私钥
    "sni": "www.your-awesome-domain-name.com"
  }
}
```


```client.conf
{
  "run_type": "client",
  "local_addr": "127.0.0.1",
  "local_port": 1080,
  "remote_addr": "www.your-awesome-domain-name.com",
  "remote_port": 443,
  "password": ["your_awesome_password"]
}
```

## vmess

[](https://github.com/v2fly/fhs-install-v2ray)

bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

v2ray / clash
    网络工具，支持
vmess
    协议, 类似 http, 

## 线路类型

IPLC and IEPL are two types of leased lines used for high-speed internet
connectivity.

**IPLC** stands for International Private Leased Circuit(国际私人租赁电路).

It is a point-to-point private line used for data communication between two
locations, typically used by businesses and organizations with offices in
different countries. IPLC offers a secure, reliable, and dedicated connection
that ensures faster data transfer and low latency.

**IEPL** stands for International Ethernet Private Line. It is also a
point-to-point private line, but it is based on Ethernet technology. IEPL is
typically used for high-speed data transfer and is an alternative to IPLC. It
offers the same benefits as IPLC, such as security, reliability, and low
latency, but at a lower cost.

Both IPLC and IEPL are dedicated leased lines, which means the bandwidth is
reserved exclusively for the customer and is not shared with other users.

## 加密算法

## **AES-256-GCM

**AES-256-GCM (Advanced Encryption Standard 256-bit with Galois/Counter Mode)**
is a symmetric encryption algorithm that provides both confidentiality and
integrity protection for data. It is a widely-used encryption standard for
secure communication over the internet, and is considered to be highly secure
due to its use of a strong key and the use of an authentication tag to ensure
the integrity of the encrypted data. The GCM mode provides authenticated
encryption, meaning that it provides both confidentiality and integrity
protection in a single step.

## **ChaCha20-Poly1305** 

**ChaCha20-Poly1305** is a stream cipher and authenticated encryption
algorithm. It is designed to provide both confidentiality and integrity for
data transmitted over a network or stored on disk. It combines the ChaCha20
stream cipher for encryption with the Poly1305 authenticator for integrity
checks. The cipher is widely used in modern protocols such as TLS 1.3, OpenSSH,
and WireGuard. It is favored for its high security, efficiency, and resistance
to side-channel attacks.




