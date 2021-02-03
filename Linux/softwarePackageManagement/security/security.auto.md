
## 

之前已经说过，一些最优秀的系统管理员看上去（注意这里使用的词是 seem（看上去））总是很“懒”的，这句话我再同意不过了。

虽然这句话听起来有点荒谬，但我敢打赌在大多数情况下它是对的－不是因为他们不去做他们原本应该做的事情，而是因为他们已经让系统自动去完成这样的事情了。

对于 Linux 系统来说，一个最关键的需求是为相应的 Linux 版本保持更新最新的安全补丁。

在这篇文章中，我们将讨论如何在 Debian 和 Ubuntu 系统上进行设置，从而实现自动安装或更新重要的安装包或补丁。

关于其他Linux系统全自动打补丁方法请参见《如何让RHEL/CentOS系统全自动打补丁/自动保持安全补丁更新》

为了执行这篇文章中所讲到的任务，你需要有超级用户root特权。

## 在 Debian/Ubuntu 上配置自动安全更新

首先，安装下面这些安装包：

    aptitude update -y && aptitude install unattended-upgrades apt-listchanges -y

    注：部分版本系统不使用aptitude而是用apt命令

apt-listchanges 将会通知你在升级过程中发生的改变。

接下来，用你最喜欢的文本编辑器打开 /etc/apt/apt.conf.d/50unattended-upgrades，然后在 Unattended-Upgrade::Origins-Pattern 块中间加入下面这行内容：

    Unattended-Upgrade::Mail "root";

最后，执行下面的命令来生成所需的配置文件（/etc/apt/apt.conf.d/20auto-upgrades），从而激活自动更新：

dpkg-reconfigure -plow unattended-upgrades

    当提示安装自动升级时，选择 ‘Yes’：


在 Debian 上配置自动安装更新

然后检查下面这两行是否已经加入到文件 /etc/apt/apt.conf.d/20auto-upgrades 中了：

    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Unattended-Upgrade "1";

增加下面这行内容使通知更加详细：

    APT::Periodic::Verbose "2";

最后，检查 /etc/apt/listchanges.conf 来确保通知能被发送给 root 用户。

```
[apt]
frontend=pager
email_address=root
confirm=0
save_seen=/var/lib/apt/listchanges.db
which=news
```

