## 主旨
为保护公司芯片组核心源代码的安全性，针对现有公司网络环境，制作以下方案。

## 产品名称
至安盾 智能安全平台ZS-ISP 

### 主要功能
1. 隔离
    1. 确保用户操作过程中数据不落地；通过完善的审批策略和流程管控来进行数据存取。
1. 审批
    1. 文件存取过程需要进行审批，且都有日志记录。
1. 审计
    1. 所有数据访问都有记录并可视化展示

### 主要设备
1. 穿透机
1. 开发板插在穿透机上，此时会在穿透机的设备管理器中出现该开发板，未加入白名单的设备不能和员工开发主机进行任何通讯
    1. win7系统
    1. 不能安装、卸载任何软件
    1. 有一个穿透软件，通过该软件登陆到至安盾

1. 至安盾
    1. 至安盾type 1
        1. centos系统
        1. 处于保护区域
        1. 白名单(设备加入白名单后才会被穿透)
        1. 通过至安盾远程登陆到员工所在开发主机

    1. 至安盾type 2
        1. 集成虚拟机，开发机可以是win7,win10,ubuntu系统
        1. 硬件可以定制,内存、硬盘等
        1. 节省实体主机开支，电费开支，便于管理

        <img src="./materials/zhiandun.png"/>

1. 员工主机
    1. 单用户，员工主机只有一个系统账户
    1. 只能是win7或者win10系统

1. 保护区
    1. 包括至安盾及员工开发主机，一个网段即一个保护区
        1. 比如 192.168.1.1/24 和 192.168.1.2/24 两台主机位于同一个保护区，位于同一个保护区域（同一个网段）的主机进行信息交互不需要管理员在至安盾上进行审批
    1. 位于不通保护区（不通网段）的主机进行通讯需要管理员在至安盾上进行审批
