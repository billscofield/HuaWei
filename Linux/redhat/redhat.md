
## 修改主机名

### 方法一:

需要修改两个文件

1. /etc/hosts
    两行分别添加新的名称 比如 localhostLab_1

    如果是直接将 localhost 更改，当在远程电脑 B 上使用图形命令时，将不能打开图形程序。报错信息如下:

    ```
    gvim

    E233: cannot open displayE852: The child process failed to start the GUI
    Press ENTER or type command to continue


    默认 DISPLAY=localhost:10.0     或者  DISPLAY=localhost:12.0    后面的数字好像不一定
    ```

2. /etc/sysconfig/network       好像只修改这个就可以了
    HOSTNAME=新的计算机名称
    修改之后你需要重启网络


### 方法二


## 网卡自启动

1. 修改所需连接网络的网卡配置
    cd /etc/sysconfig/network-scripts   #进入网络配置的文件夹找到使用的网卡配置文件
    vim ifcfg-enol16777736              #编辑网卡配置文件(这是RHEL 7的网卡配置文件)

2. 修改ONBOOT项为yes并保存

    ONBOOT=yes
