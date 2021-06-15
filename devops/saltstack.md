作者在盐湖城

三大功能

    1. 远程执行(多台计算机同时执行一个命令等)

    1. 配置管理(状态)

    1. 云管理(saltcloud组件,阿里云等云有API，salt 进行了封装)

同类型工具

    Puppet(ruby)

    ansible(python)

    Saltstack(python)

        saltstack.com

        saltstack.cn


四种运行方式

    1. Local

    2. Minion(下属[ˈmɪniən])/Master(C/S)(最普遍最佳的方式)

    3. Syndic 类似于zabbix proxy

    4. Salt SSH 

典型案例

    1. 兼容各种操作系统（Python）
    2. 


安装
    repo.saltstack.com

    配置源
    apt-get install salt-master
    apt-get install salt-minion

    apt-get install salt-api
    apt-get install salt-cloud
    apt-get install salt-ssh
    apt-get install salt-syndic


配置
    minnion
        16  master: IP/主机名
            主机名不可用下划线，要使用hyphen,DNS不准有下划线
        101 id: 可以不配
            会产生一个 minion_id 文件
            salt-minion 启动时会读这个文件
            systemctl start salt-minion
        会在 /etc/salt 下创建一个pki的目录
            minion 下创建两个文件，minion.pem(私钥)、minion.pub(公钥)
    
    master
        master.pem
        master.pub

        salt-key -a
        salt-key -A

        salk-key(查看)

    master-minion:AES加密通信
        



salt '*' test.ping
    '*': 表示目标，区别于shell中的*的特殊意义
        也可以只写一个主机
    test:模块
        test.ping 不同于ping，测试master和minion的通信

典型案例：
    1. 远程执行
        salt '*' cmd.run 'mkdir /tmp/hehe'
            cmd:模块
    2. 配置管理
        State 模块
        YAML格式文件.sls
            YAML ain't a markup language
            Yet another markup language

            冒号 缩进 hyphen
                2个宫格缩进,不能使用tab制表符
                冒号：键值对, 冒号 后边要有一个空格
                hyphen: 列表, hyphen后边要有一个空格
        
        vi /etc/salt/master         
        /file_roots


        /srv/
        apache.sls
        apache-install:
          pkg.installed:
            - names: 
              - httpd
              - httpd-devel   

        apache-serve:
          service.running:
            - name: httpd
            - enable: True      //开机自动启动

        salt '*' state.sls web.apache

    状态模块
    执行模块






















