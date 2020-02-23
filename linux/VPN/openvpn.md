
## 安装 openvpn 和 easyrsa

apt install openvpn

查看 openvpn 版本

    openvpn --version

此外还需要安装一个辅助工具easyrsa，它包含了一系列脚本和配置，可以帮助我们快速生成openvpn所需的证书和公私钥对。因为它是一组脚本，所以我们直接克隆一下它的Github仓库即可：

    git clone https://github.com/OpenVPN/easy-rsa.git


## 生成 CA

cd easy-rsa/easyrsa3

cp vars.example vars

    ```
    set_var EASYRSA_REQ_COUNTRY "US"
    set_var EASYRSA_REQ_PROVINCE    "California"
    set_var EASYRSA_REQ_CITY    "San Francisco"
    set_var EASYRSA_REQ_ORG "Copyleft Certificate Co"
    set_var EASYRSA_REQ_EMAIL   "me@example.net"
    set_var EASYRSA_REQ_OU      "My Organizational Unit"

    ```

    不能留空，修改完成后保存文件

用下面的命令生成公钥体系

    ./easyrsa init-pki

    pki:公钥基础设施PKI（PublicKeyInfrastructure）

    会生成如下的信息，这样就成功了：

    Note: using Easy-RSA configuration from: ./vars

    init-pki complete; you may now create a CA or requests.
    Your newly created PKI dir is: /home/yitian/easy-rsa/easyrsa3/pki


之后就是最后一步创建CA证书了，如果不想每次都输入一个密码，可以用nopass参数来取消密码。在输出中还会提示你输入CA的公共名称，直接默认即可，当然你想改也随意。

    ./easyrsa build-ca nopass 

    ```输出
    Note: using Easy-RSA configuration from: /root/easy-rsa/easyrsa3/vars
    Using SSL: openssl OpenSSL 1.1.1d  10 Sep 2019
    Generating RSA private key, 2048 bit long modulus (2 primes)
    ..........................................+++++
    .........................................................................................................................................+++++
    e is 65537 (0x010001)
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Common Name (eg: your user, host, or server name) [Easy-RSA CA]:

    CA creation complete and you may now import and sign cert requests.
    Your new CA certificate file for publishing is at:
    /root/easy-rsa/easyrsa3/pki/ca.crt
    ```

    这样一来，在pki和pki/private文件夹中会生成ca.crt和ca.key文件，正是SSL证书所用的公私钥对。



## 生成服务器证书和加密文件

### 生成私钥

首先输入下面的命令，这里的server是服务器的名称，可以修改，但是由于接下来好几处命令以及生成的文件都受这个名称影响，所以还是用默认的server省事一点：

./easyrsa gen-req server nopass

    ```输出
    Note: using Easy-RSA configuration from: /root/easy-rsa/easyrsa3/vars
    Using SSL: openssl OpenSSL 1.1.1d  10 Sep 2019
    Generating a RSA private key
    ..+++++
    .........+++++
    writing new private key to '/root/easy-rsa/easyrsa3/pki/easy-rsa-3023.BTcbXj/tmp.PEfJGn'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Common Name (eg: your user, host, or server name) [server]:

    Keypair and certificate request completed. Your files are:
    req: /root/easy-rsa/easyrsa3/pki/reqs/server.req
    key: /root/easy-rsa/easyrsa3/pki/private/server.key
    ```
   
这样就生成了服务器私钥server.key和证书请求文件server.req。

然后将服务器私钥复制到openvpn配置文件目录下：

    sudo cp pki/private/server.key /etc/openvpn 
