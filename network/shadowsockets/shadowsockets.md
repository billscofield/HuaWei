https://www.eeebe.com/article/ce37aebf65afbef8.html


AWS：即Amazon Web Services，是亚马逊（Amazon）公司的云计算IaaS和PaaS平台服务。

亚马逊弹性计算云（EC2，Elastic Compute Cloud）

    每月15G流量限制，否则会收费

    一年后如果不注销也会收费

    1010 0966 由西云数据运营的AWS中国（宁夏）区域

    1010 0766 由光环新网运营的AWS中国（北京）区域

## 配置root账号密码

passwd root

su - root

## 安装Python，pip, shadowsocks

```
apt update
apt install python-setuptools
apt install python-pip
pip install shadowsocks


mkdir /etc/shadowsocks
vim /etc/shadowsocks/ss.json

{
    "server":"0.0.0.0",
    "server_port":9000,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"bill@hjimi",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open":false,
    "workers": 1
}
```

## 设置SS为开机自启动

vi /etc/rc.local1

加入：sudo ssserver -c /etc/shadowsocks/ss.json -d start


## 启动服务

启动：ssserver -c /etc/shadowsocks/ss.json -d start 

停止：ssserver -c /etc/shadowsocks/ss.json -d stop 

重启：ssserver -c /etc/shadowsocks/ss.json -d restart

## Error

AttributeError: /usr/lib/x86_64-Linux-gnu/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup

    vim /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py

    运行引号内命令(不含引号) ":%s/cleanup/reset/g"

启动：ssserver -c /etc/shadowsocks/ss.json -d start 
