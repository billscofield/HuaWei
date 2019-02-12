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
















