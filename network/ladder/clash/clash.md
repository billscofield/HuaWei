# clash

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




