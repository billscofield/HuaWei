links:

    https://linux.cn/article-11132-1.html


## 如何在 Debian/Ubuntu 上手动安装安全更新?

在 Linux 上通过命令行安装一个包程序是一件简单的事。在一行命令中组合使用多个命令能让你更加简单地完成任务。

安全更新也同样如此。

在这个教程里面，我们会向你展示如何查看可用的安全更新，以及如何在 Ubuntu、LinuxMint 等等这些基于 Debian 的系统中安装它们。

有三种方法可以完成这件事，下面会详细地描述这三种方法。

### 方法一 如何检查 Debian/Ubuntu 中是否有任何可用的安全更新？

在进行补丁安装之前，检查可用安全更新列表始终是一个好习惯。它会为你提供将在你的系统中进行更新的软件包的列表。

默认情况下，你的系统上应该是已经安装了 unattended-upgrades 包的。但是如果你的系统没有装这个包，那么请使用下面的命令来安装它。

使用 APT-GET 命令 或者 APT 命令 来安装 unattended-upgrades 包。

    apt install unattended-upgrades


    -d, --debug
        
        extra debug output into /var/log/unattended-upgrades.log
        
        添加了这个选项才能看到过程，否则不知道在干嘛

    --dry-run
        
        Just simulate installing updates, do not actually do it


如何在 Debian/Ubuntu 中安装可用的安全更新？

如果你在上面的命令输出中获得了任意的软件包更新，就运行下面的命令来安装它们。

    sudo unattended-upgrade -d



### 方法二：如何使用 apt-get 命令在 Debian/Ubuntu 中检查是否有可用的安全更新？

在你的 Debian/Ubuntu 系统中运行下面的命令来查看可用安全更新的列表。

    sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi


如何使用 apt-get 命令在 Debian/Ubuntu 系统中安装可用的安全更新？

如果你在上面命令的输出中发现任何的软件包更新。就运行下面的命令来安装它们。

```
$ sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi | awk -F " " {'print $2'} | xargs apt-get install

```

除此之外，也可以使用 apt 命令来完成。但是这个方法有点棘手，我会建议用户用第一个方式


### 方法三：如何使用 apt 命令在 Debian/Ubuntu 系统中检查是否有可用的安全更新？

在 Debian/Ubuntu 系统中运行下面的命令来查看可用安全更新的列表。

    sudo apt list --upgradable | grep -e "-security"


如何在 Debian/Ubuntu 系统中使用 apt 命令来安装可用的安全更新？

如果你在上面命令的输出中发现任何的软件包更新。就运行下面的命令来安装它们。

```
$ sudo apt list --upgradable | grep -e "-security" | awk -F "/" '{print $1}' | xargs apt install

```

同样，下面的文件也会告诉你更新包的总数。

```
$ sudo cat /var/lib/update-notifier/updates-available
190 packages can be updated.
39 updates are security updates.

```
