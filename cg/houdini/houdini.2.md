# houdini 版本

launcher
old installer


PRODUCTION BUILDS
DAILY BUILDS


## old installer

每个houdini 版本一般都有两个python版本，一个默认的没有写具体版本号的，还有一个写了具体版本号的，arnold 是一一对应的

    houdini-19.5.569-linux_x86_64_gcc9.3.tar.gz
    houdini-py37-19.5.569-linux_x86_64_gcc9.3.tar.gz

    htoa-6.2.1.1_rca64926_houdini-19.5.569_linux.run
    htoa-6.2.1.1_rca64926_houdini-19.5.569.py37_linux.run




desktop/

mine/ 链接到网络



engine_maya.tar.gz
engine_unity.tar.gz
engin_unreal.tar.gz



要使用 root 权限

items to be installed:

    6. Avahi (Third-party)
    7. SideFX Labs
    8. Houdini Engin for Maya
    9. Houdini Engin for Unity
    10. Houdini Engin for Unreal
    11. HQueue Server (houdini 自带的联机解算，联机渲染服务器端)
    12. HQueue Client (houdini 自带的联机结算，联机渲染客户端)

    D 更改安装路径
    F 开始安装


houdini 学徒版本: houdini Apprentice, 不需要和谐
houdini core:核心版本，没有特效模块
houdini FX: 旗舰版
houdini indie: 独立版本，文件格式，渲染尺寸有限制


和谐

/etc/init.d/sesinetd stop

替换 sesinetd /usr/lib/sesi/
/etc/init.d/sesinetd start

算号工具
./Houdini-Tools
    server name:
    id:                 (就是 MAC 地址,全小写,没有冒号和dash)

输出内容复制到 /usr/lib/sesi/license
    一共是9条许可

    如果是手工导入的话，要分两次导入

    systemctl restart sesinetd

    ~/.sesi_licenses.pref 改写为 http://<ip>:1715, 并添加只读权限
    chattr +i .sesi_licenses.pref


卸载
    ~/houdini..
    /usr/lib/sesi
    /etc/init.d/sesinetd
    /opt/hfs


启动器安装:
    多版本管理
    多版本安装
    sh ./


关联 hip 到 houdini
    方法一. 重新安装houdini
    方法二. 

## 插件

### Aces 颜色

将下载好的 aces 放到一个目录 以 /opt/houdini 为例

将$OCIO环境变量设置为OpenColorIO配置文件的文件路径（例如config.ocio）。

这是其中一个aces具有最新版本号的文件夹中的配置文件。
您可以通过houdini.env使用文本编辑器打开（位于houdini用户文件夹中）并添加以下代码来完成此操作

    houdini.env
    OCIO = /opt/houdini/aces1.2/config.ocio


Edit / Color Settings / Color Correction


### arnold

python 版本要一致

touch ~/houdini19.5/packages/HtoA_linux.json

```
{
    "env":[
        {
            "HOUDINI_PATH":"/Software/HtoA/htoa-6.1.3.3_rdb15014_houdini-19.5"
        },
    ]
}

```
