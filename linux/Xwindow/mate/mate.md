[link](https://blog.csdn.net/S744417704/article/details/74388308)

Mate桌面环境是Gnome2的延续，特点是相当轻量，以及较高的可定制性，原生支持图标、
窗口、字体、动画特效的修改。这也同时意味着美观性：只要你找到对你胃口的图标主题。
其中动画特效需要额外的mate-tweak包（如果没有预装）。

我原以为这桌面配置文件在~/.config/mate之类的文件夹里，然而并不是。Mate桌面是通
过dconf配置的；因此配置文件在~/.config/dconf文件夹下。配置不仅包括图标、窗口、
字体，还有其默认文件管理器caja的配置。这配置文件不是纯文本文件，因此不能直接用
编辑器修改，要用dconf-editor之类的软件修改！

如果想重置Mate桌面，删除dconf文件夹即可:

rm -r ~/.config/dconf
1
然后注销。
附Debian用户安装Mate桌面方法：

1. mate桌面核心组件（最小安装）

    > sudo apt-get install mate-desktop-environment-core

2. mate桌面完整版

    > sudo apt-get install mate-desktop-environment

3. mate桌面全家桶（含第三方实用软件）

    > sudo apt-get install mate-desktop-environment-extras



## mate-panel

The MATE panel is stored in two files, and is glitchy(小故障). The
disappearance or misloading of the panel at reset is classic, in my experience.

/usr/share/mate-panel/layouts by default, with extensions .layout and .panel
for a single panel. 

### gsettings

GSetings实际上是一套高级API，用来操作dconf

dconf存储着GNOME3的配置，是二进制格式。它做为GSettings的后端系统存在，暴露出低
级API。在GNOME2时代，类似的角色是gconf，但它是以XML文本形式存储。

Gconf是一个存储GNOME桌面环境配置的一个系统，以方便桌面和应用程序的配置，是后台
运行的。可以理解为是一个类似于windows下的注册表的一个东西；而gsettings是对GConf
后台的读取和设置

gsettings list-schemas                  显示系统已安装的不可重定位的schema
gsettings list-relocatable-schemas      显示已安装的可重定位的schema
gsettings list-children SCHEMA          显示指定schema的children，其中SCHEMA指xml文件中schema的id属性值，例如实例中的"org.lili.test.app.testgsettingsk

gsettings list-keys SCHEMA              显示指定schema的所有项(key)
gsettings list-recursively [SCHEMA]     如果有SCHEMA参数，则递归显示指定schema的所有项(key)和值(value)，如果没有SCHEMA参数，则递归显示所有schema的所有项(key)和值(value)

gsettings range SCHEMA KEY              查询指定schema的指定项KEY的有效取值范围
gsettings get SCHEMA KEY                显示指定schema的指定项KEY的值
gsettings set SCHEMA KEY VALUE          设置指定schema的指定项KEY的值为VALUE
gsettings reset SCHEMA KEY              恢复指定schema的指定项KEY的值为默认值
gsettings reset-recursively SCHEMA      恢复指定schema的所有key的值为默认值




    gsettings list-schemas | grep mate.panel
        查看所有的 schemas

    gsettings list-keys org.mate.panel
        查看 keys

    gsettings list-recursively org.mate.panel
        查看 keys 和 values

    gsettings get org.mate.panel highlight-launchers-on-mouseover
        查看 值

    gsettings range org.mate.panel highlight-launchers-on-mouseover
        查看取值范围

    gsettings set org.mate.panel highlight-launchers-on-mouseover xxxx
        修改

    gsettings reset org.mate.panel highlight-launchers-on-mouseover
        恢复为默认值

    gsettings reset-recursively org.mate.panel


gconftool-2
    gconftool-2 - GNOME configuration tool


GUI工具 gconf-editor


---

通常 GSettings 的配置文件是由 .gshema.xml 结尾的xml文本提供，它一般被安装在
/usr/share/glib-2.0/schemas/ 目录下。

```
<?xml version="1.0" encoding="UTF-8"?>
<schemalist gettext-domain="example">
    <schema id="org.example" path="/org/example/">
        <child name="child1" schema="org.ukui.example.child1"/>
        <key name="key1" type="s">
            <default>'key1'</default>
            <summary>Key1</summary>
            <description>GSettings example key1</description>
        </key>
    </schema>
    <schema id="org.example.child1" path="/org/example/child1/">
        <key name="key2" type="b">
             <default>true</default>
             <summary>Key2</summary>
             <description>GSettings example key2</description>
         </key>
     </schema>
</schemalist>


对于各行给出以下解释
1：表明xml的版本和编码字符集
2：文件的域名，一般跟xml文件名相似
3：id需要保证在当前系统中唯一，path把id的间隔换位/即可，相似于树结构
4：一个xml文件只能存在一个父schema，如果需要更多的schema，可以使用child创建子schema
5：键，用于匹配值。name为键名，type为类型，包含 s(字符串) 、i(整形)、b(布尔型)、as(字符串数组)、e(枚举)
6：默认值
7：简介
8：关于这个key作用的描述
9-18 可参考以上信息

```

生成xml文件后，可以将文件放入/usr/share/glib-2.0/schemas/ 目录下，然后执行
glib-compile-schemas /usr/share/glib-2.0/schemas/ 命令，将xml更新到内存中

这时，使用 gsettings list-recursively |grep org.example 命令即可看到刚刚创建的
两个GSettings项



### 修改GSettings的默认值

有时，我们需要在保持xml文件不变的情况下，修改某个GSettings项的默认值，可以加入
.gshema.override 解决该问题。

首先创建一个override文本 10_gsettings-example-schemas.gschema.override

```
[org.example]
key1='changekey1'


[org.example.child1]
key2=false
```

这里修改了刚刚创建的key1和key2的键值

生成override文件后，可以将文件放入/usr/share/glib-2.0/schemas/ 目录下，然后执行
glib-compile-schemas /usr/share/glib-2.0/schemas/ 命令，将override更新到内存中

这时，使用 gsettings list-recursively |grep org.example 命令即可看到刚刚修改的
两个GSettings项


注意，override文本名需要以 "两位数字"开头，如 10_，其中数字越大则优先级越高，如
果同时存在多个override文件对同一个key值进行修改时，优先级高的生效。并且需要以
.gshema.override 结尾，中间可以描述修改的作用和应用对象。


https://blog.csdn.net/weixin_42615352/article/details/123062074
https://docs.gtk.org/gio/class.Settings.html
