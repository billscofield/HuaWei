## [rez](https://lingyunfx.com/03%20rez-getting-started/)

1. git clone https://gitee.com/billscofield/rez.git ~/

    apt install python3.10-venv

    pytho3 install.py
    ...
    SUCCESS!
    Rez executable installed to: /opt/rez/bin/rez/rez
    Rez python package installed to: /opt/rez/lib/python3.6/site-packages/rez

    To activate Rez, add the following path to $PATH:
    /opt/rez/bin/rez

    You may also want to source the completion script (for bash):
    source /opt/rez/completion/complete.sh


rez --version

## 配置

默认配置文件的位置是rez安装目录下rezconfig.py文件。
    /opt/rez/lib/python3.10/site-packages/rez/rezconfig.py
    /opt/rez/lib/python3.10/site-packages/rezplugins/build_system/rezconfig.py

为了能够进行统一设置，这个配置文件最好也是在服务器上，所以首先更改rez配置文件路径。
官方推荐的方式是设置 REZ_CONFIG_FILE 环境变量指向配置文件路径。

1. 写入环境变量

    ehco "export REZ_CONFIG_FILE=`/Library/smb_server/rezconfig.py`">>.bash_profile
    source .bash_profile

    ```CO
    echo $REZ_CONFIG_FILE
    /mnt/utility/linked_tools/lca_rez/settings/rezconfig.py  同步到本地了一份
    ```

    ```实验
    ehco "export REZ_CONFIG_FILE=/Library/smb_server/rezconfig.py">>.bash_profile
    ```

2. 验证是否返回了正确的路径

    echo $REZ_CONFIG_FILE

然后我们要将包存储库放在共享的服务器上，以便于任何一台PC机都可以访问它。
下面是对rezconfig.py文件的修改：

```
packages_path = [
    "~/packages",           # locally installed pkgs, not yet deployed
    "~/.rez/packages/int",  # internally developed pkgs, deployed
    "~/.rez/packages/ext",  # external (3rd party) pkgs, such as houdini, boost
    "/Library/smb_server/dcc",
    "/Library/smb_server/plug-ins",
    "/Library/smb_server/third-lib",
    "/Library/smb_server/tools",
]
```

对比默认的配置，这里在列表后面添加了四个路径，
分别存放DCC软件包，DCC插件包，第三方库，和自定义工具包。

设置完成后执行rez-config packages_path查看是否配置已经更新。


## 使用

rez-bind --quickstart

    Successfully converted the following software found on the current system into Rez packages:

    PACKAGE     URI
    -------     ---
    arch        /root/packages/arch/x86_64/package.py
    os          /root/packages/os/centos-7/package.py
    pip         /root/packages/pip/19.1.1/package.py
    platform    /root/packages/platform/linux/package.py
    python      /root/packages/python/2.7.5/package.py
    rez         /root/packages/rez/2.111.3/package.py
    rezgui      /root/packages/rezgui/2.111.3/package.py
    setuptools  /root/packages/setuptools/41.0.1/package.py

    To bind other software, see what's available using the command 'rez-bind --list', then run 'rez-bind <name>'.

