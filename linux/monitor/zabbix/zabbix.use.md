

## 添加主机

主机 -> 监控项 -> 模板 -> 触发器 -> 执行动作 -> 告警媒介

主机名称: 随便写, 貌似和 Hostname 没关系?

模板后边的小括号中的内容是当前模板的连接项目, 包含哪些模板


## 添加监控项

1. 客户端自定义监控取值
    /etc/zabbix/zabbix_agent2.conf
        UserParameter=<key>,<shell command>
        UserParameter=usernumbaers, w | awk 'NR==1{print $4}'

2. 服务端

    先进行测试: zabbix_get -s 192.168.1.1 -k usernumbers

    网页上添加:

        主机 -> 监控项 
            名称
            信息类型
            更新间隔
            历史数据保留时长    90d
            趋势存储时间        365d
            新的应用集


大批数据进行监控(通过脚本)

    cd /etc/zabbix/zabbix-agent2.d/
    mkdir scripts

    ```nginx_status.sh

    ```

    ```
    UserParameter=Ngx_status[*],/etc/zabbix/zabbix_ageant2.d/scripts/nginx_status.sh $1        $1-> Ngx_status[*] 中的参数
    systemctl restart zabbix-agent

    zabbix_agent2 -t Ngx_status[active]         // 测试
    ```

    ```
    zabbix_get -s 192.168.1.1 -k Ngx_status[active]
    ```


    网页添加监控项:
        名称
        键值:   Ngx_status[active]



## 触发器

对异常数据进行报警

触发器名称:  System name has changed(new name:{ITEM.VALUE})

表达式构造栏:

默认有语音提示, 需要在 User settings 中添加, 在 User settings 中默认是关闭的

User settings -> message(正在发送消息) -> frontend messaging -> 勾选

---

名称: 用户数量
表达式: 添加 -> 监控项 -> 功能(就是函数), 此处选择 last() , 原来是图形化的，不用自己手写
最后一个 计数                       // 出现几次才算
间隔时间(秒)
结果: >4

恢复正常设置, 比如负载为2报警， 回覆到 1 才算是正常
    事件成功迭代: -> Recovery expression(恢复表达式)

---

表达式构造器(逻辑关系)

名称
问题表现形式
表达式构造器: And  Or  替换




## 邮件报警

触发器 -> 动作(发送邮件)


1. 配置发件人:
    管理 -> 报警媒介类型
        创建
            名称
            类型：email
            SMTP服务器:
            SMTP HELO:    126.com/ qq.com
            SMTP电邮: 发件箱地址

    User Setting

2. 配置收件人

    创建用户或用户组

    管理 -> 用户
        创建
            用户
                别名:
                密码:
            报警媒介:
                添加
            权限:               // 貌似要管理员才行

3. 动作
    配置 -> 动作 -> 触发器动作
        创建
            动作
                名称
                条件:
            操作
                操作: 发送消息


## 微信报警

1. 发件人
    类型: 脚本, 放在服务端,/usr/lib/zabbix/alertscripts/
        corpid=
        appsecret=
        agentid=
        
        企业项目组中的人才能收到

    参数


2. 收件人
    企业微信项目中存在的成员的帐号

3. 动作

