## 更改 root 密码

1. 进入到/opt/gitlab/bin目录下
1. 执行代码gitlab-rails console production如果运行出错则执行gitlab-rails console -e production
1. 查找切换用户名u=User.where(id:1).first
1. 对root用户进行进行密码修改操作执行u.password='12345678'和u.password_confirmation='12345678'最后执行u.save!完成密码修改，就能在Gitlab的console上登录了。



"Ghost User":

    created to hold all issues authored by users that have since been deleted.
    this user cannot be removed

External User: 外部用户
Internal User: 内部用户

Impersonate 扮演  是什么意思

## users

Guest
Reporter
Developer
Maintainer
Owner

## Group

Group Path: 分组路径，相当于分组的名称空间
Group Name: 分组名称
Description: 分组头像
Visibility Level: 访问级别

    1. Privity 分组及分组下的项目只有该组下的成员才能访问
    1. Internal 只要登录的用户都可以访问该分组及其任何Internal项目
    1. Public 任何用户不需要认证就可以访问该分组及其任何Public项目

## Project

Project Path: 可以选择分组和用户。如果选择用户，则表示该项目归属于某个用户，反之则表示归属于某个分组
Project Name: 项目名称
Project Description: 项目描述
Visibility Level: 访问级别

    1. Private 只有授权的用户才能访问
    1. Internal 任何登录的用户都能访问
    1. Public 任何用户无需认证都能访问

注意：
    如果Project Path选择某一分组，则项目的Visibility Level受分组的Visibility Level限制，如：
    若分组的Visibility Level是Private, 则项目的Visibility Level只能是Private
    若分组的Visibility Level是Internal, 则项目的Visibility Level只能是 Internal 和 Private
    以此类推


Two-factory authentication  双因素身份验证

## project 地址, 端口

1. 安装完成后一定要设置 external_url, 否则仓库地址是一堆乱码，外部访问不了, 设置为 hostip:9980
    external_url 要保证 host 主机的端口号一致
    gitlab_shell_ssh_port 

    ssh的配置文件不是/etc/ssh/sshd_config  用 ps axu | grep sshd | grep -v ssh 看， 是 /assets/sshd_config



禁止用户注册
    Settings > General > Sign-up restrictions

同样的 ssh key 只能添加一次, 不是改个名字就可以，是公钥文件，gitlab 会检验公钥
的 md5, 使用一个用户登录添加，另外一个用户就不能使用改公钥了
    
    client的公钥放到哪个user里面，那么在访问的时候就以该用户的角色访问

    Fingerprint has already been taken











