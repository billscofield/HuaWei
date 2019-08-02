database pass:  zKzXanRAHOoYNM1RiBdXeYxS

secret_key :    dSGrqdlAGq9dqe2tyILVBS4QDAYHYCZp9uc5AovLWAmbJpRcqR

bootstrap_token:    k8Jpz0IuWR9hLoBm




Python 虚拟环境的问题?
```
等待...
---------- 任务开始 ----------
$ pwd (2019-08-02 09:46:37) ****************************************************
 [WARNING]: Unhandled error in Python interpreter discovery for host 刘蛟个人:
unexpected output from Python interpreter discovery

 [WARNING]: sftp transfer mechanism failed on [192.168.10.151]. Use
ANSIBLE_DEBUG=1 to see detailed information

 [WARNING]: scp transfer mechanism failed on [192.168.10.151]. Use
ANSIBLE_DEBUG=1 to see detailed information

刘蛟个人 | CHANGED | rc=0 >>
/home/bill
```


## 操作管理

### 系统设置
1. 邮件设置
    126的可以，但是 hjimi.cn 不行，不知道为什么

### 用户管理
用户名即 Jumpserver 登录账号。用户组是用于资产授权，当某个资产对一个用户组授权后，这个用户组下面的所有用户就都可以使用这个资产了。角色用于区分一个用户是管理员还是普通用户。

1. 添加用户
    1. 账户
        名称(Name):显示名称
        用户名(Username):登录名
        邮件(Email)
        用户组(User group)
    1. 认证(Auth)
        密码策略
            邮件发送
            后台设置密码
        MFA
            禁用
            启用
            强制启用
    1. 角色安全
        角色
            用户
            管理员
            审计员
        失效日期
    1. 个人信息
        手机
        微信
        备注
1. 添加用户组


### 资产管理
1. 创建资产树节点

1. 创建管理账户 
    管理用户是资产（被控服务器）上的 root，或拥有 NOPASSWD: ALL sudo 权限的用户， Jumpserver 使用该用户来 `推送系统用户`、`获取资产硬件信息` 等。

    !!!用被管理机器上的root账户和密码成功获取信息

1. 创建系统用户
    系统用户是 Jumpserver 跳转登录资产时使用的用户，可以理解为登录资产用户，如 web，sa，dba（`ssh web@some-host`），而不是使用某个用户的用户名跳转登录服务器（`ssh xiaoming@some-host`）； 简单来说是用户使用自己的用户名登录 Jumpserver，Jumpserver 使用系统用户登录资产。 系统用户创建时，如果选择了自动推送，Jumpserver 会使用 Ansible 自动推送系统用户到资产中，如果资产（交换机）不支持 Ansible，请手动填写账号密码。


1. 添加资产
    1. 基本
        1. 主机名
        1. IP地址
        1. 操作系统类型
    1. 认证
        1. 管理用户


### 权限管理
1. 资产授权
    



```
TASK [ping] ********************************************************************
FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, 
"changed": false, "module_stderr": "Shared connection to 192.168.10.151 closed.\r\n", "module_stdout": "sudo: a password is required\r\n", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}
```
