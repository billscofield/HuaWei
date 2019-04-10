## 基础

Vmware 服务器虚拟化第一个产品叫 ESX，后来Vmware在4版本的时候推出了ESXi，区别就是内核的变化
ESX 和 ESXi 统称为 vSphere,第5版本取消了ESX，所以现在vSphere就是ESXi
vSphere就是基于Linux内核的操作系统

## 安装完ESXi后，F2进入设置

1. reset configuration //这一步可以重设密码，将密码置空
1. Troubleshooting Option 
    1. enable ESXi Options
    1. enable SSH
1. Configure Management Network //软路由用，多网卡
1. 安装完成后可以通过网页端进行管理,或者vSphere(没用过，不知道怎么用)

## 安装系统

1. 创建虚拟机
1. 网络适配器选择"VM Network"
1. CD/DVD驱动器选择"数据存储ISO文件",没有的话可以选择上传文件


## vCenter
最少双核，10G RAM
