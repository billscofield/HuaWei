服务器端:服务器端添加git账户
    useradd -m git
    
服务器端:服务器端创建 git 项目目录
    mkdir /data/githouse/gitProject.md

服务器端:初始化为空项目
    cd /data/githouse/gitProject.md
    git init --bare
    
客户端:client端生成 id_rsa.pub
    ssh-keygen -t rsa

    如果是添加
        
        ```
        scp .ssh/id_rsa.pub git@192.xxx.xxx.xxx:/home/git/bill2.pub
        cat /home/git/bill2.pub >> /home/git/.ssh/authorized_keys
        ```

客户端:将client端 id_rsa.pub 上传至服务器
    ssh-copy-id -i /home/bill/.ssh/id_rsa.pub git@192.xxx.xxx.xxx

客户端:第一次pull
    git clone git@192.xxx.xxx.xxx:/data/githouse/gitProject.md
    如果成功
    sudo vi /etc/passwd 修改 git 行  :/usr/bin/git-shell    //如此，客户端将不能进行ssh登陆

客户端:配置提交者信息
    cd gitProject
    git config --local user.name "bill"
    git config --local user.email "billscofield@126.com"


https://git-scm.com/book/zh/v1/%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E7%9A%84-Git-%E6%9E%B6%E8%AE%BE%E6%9C%8D%E5%8A%A1%E5%99%A8

https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137583770360579bc4b458f044ce7afed3df579123eca000


可能会出现的问题
    https://flysnowxf.iteye.com/blog/1567570



authorized_keys   chomd 600
