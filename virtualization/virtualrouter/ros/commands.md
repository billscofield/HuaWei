# 常用命令


## ip

ip service print                                    　　 // 查看服务，打X的服务表示禁用

### ssh

ip service enable ssh
ip service disble ssh
ip service set ssh port=22 address=192.168.10.100       // 允许192.168.10.100访问SSH访问，其它IP都均被拒绝


#### RouterOS导入key登陆ssh

Linux或者Mac OS生成一个key

    ssh-keygen -t rsa

用scp上传到Mikrotik

    scp -P端口 ~/.ssh/id_rsa.pub admin@10.0.100.1:id_rsa.pub

在Mikrotik内导入key

    [admin@MikroTik] > /user ssh-keys import public-key-file=id_rsa.pub user=admin

打印查看

    ```
    [admin@MikroTik] > /user ssh-keys print
    Flags: R - RSA, D - DSA        
    #   USER                       BITS KEY-OWNER        
    0 R admin                      2048 XXXXXXX
    ```


### firewall

#### NAT

/ip firewall nat
add chain=srcnat src-address=内网IP段/24 protocol=tcp action=masquerade
add action=dst-nat chain=dstnat dst-address=公网IP dst-port=80,443,5900 protocol=tcp to-addresses=内网IP  to-ports=0-65535
add action=dst-nat chain=dstnat dst-address=公网IP dst-port=623 protocol=udp to-addresses=内网IP  to-ports=0-65535
