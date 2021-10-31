
## 添加 ssh 公钥登录

1. 生成本地 key
    
    ssh-keygen -t rsa

1. 用scp上传到Mikrotik

    scp -P ros端口 ~/.ssh/id_rsa.pub admin@10.0.100.1:id_rsa.pub

1. 在Mikrotik内导入key

    [admin@MikroTik] > /user ssh-keys import public-key-file=id_rsa.pub user=admin

1. 打印查看

    [admin@MikroTik] > /user ssh-keys print
    Flags: R - RSA, D - DSA        
     #   USER                       BITS KEY-OWNER        
     0 R admin                      2048 XXXXXXX
