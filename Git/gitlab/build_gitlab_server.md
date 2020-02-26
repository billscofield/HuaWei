## Gitlab
### 安装
1. curl -sS http://packages.gitlab.com.cn/install/gitlab-ce/script.deb.sh | sudo bash
1. sudo apt-get install gitlab-ce

1. 打开vim /etc/gitlab/gitlab.rb配置文件，将external_url = 'http://git.example.com'修改成自己的 IP 或者 HostName，比如：

    ```
    external_url = 'http://40.125.201.71'
    ```

### 启动Gitlab
sudo gitlab-ctl reconfigure

每次配置更改之后，都需要执行上面命令，GitLab 启动好之后，浏览器输入 http://40.125.201.71 地址，初始化下 root 管理员密码，下面就可以正常使用了

这样就安装完毕了，但是没有安装邮件服务，gitlab 不能发送邮件，所以下面安装邮件服务 postfix



### gitlab 使用
1. user(用户)
1. Group(项目组)
1. Project(文档库)

Name：显示的名称
创建完成后 edit 设置密码

先创建用户，再创建group，创建Project


### 客户端软件

source tree






## 预备知识
### DNS服务
bind : Berkeley Internet Name Domain





#### 安装
sudo apt install bind9


## postfix
### 安装
sudo apt install postfix

在安装过程中会有界面弹出来，当显示如下所示的界面时，我们要选择Internet Site方式，然后一路确定即可。

### 配置
https://blog.csdn.net/hyman_c/article/details/64474151
https://www.iqiyi.com/u/2211653605/v
http://www.icoolxue.com/play/7414


/etc/postfix/main.cf



/etc/init.d/postfix restart






## CI/CD

https://www.cnblogs.com/selimsong/p/9398738.html

版本控制工具可以保证代码有一个主版本，但代码分析和测试均是开发人员手动在本地完成的(通过编译、执行测试等方式)，在进行代码分析和测试时可能并没有将本地代码更新到最新版本，这样就会出现一个问题，当多个开发人员向版本库提交代码时，无法保证最新代码库的代码是正确的，为了解决这个问题，提出了持续集成，持续集成的集成指的是持续的对多个开发人员编写的代码进行集成，

持续集成(Continuous integration，CI)指的是在开发过程中持续地将所有开发人员的代码合并到代码库的主线上，然后对该主线代码进行编译、测试运行等操作对代码进行检验，其目的是尽可能早的发现代码集成后导致的问题。
　　实现持续集成的要点主要有：共享的代码库、自动化编译、自动化测试等，同时要保证合理的集成频率，一般持续集成的时机在于开发人员将代码提交到代码库时自动进行，但是如果提交过于频繁，那么应该使用时间间隔的形式进行持续集成。
　　持续发布(Continuous delivery,CD)实际上是持续集成上的一个拓展，在持续集成的基础上将发布工作自动化，避免人为操作从而减少发布时间和发布时人为造成的错误。
