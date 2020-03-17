## 安装OpenJDK

apt install default-jdk
java -version

mkdir  minecraft && cd minecraft
scp 1.51.1server.jar .

java -Xms512M -Xmx1024M -jar 1.15.1server.jar nogui

## 单机游戏

下载器或者minecraft 管理器吧，类似pyenv

启动器
1. Minecraft 官方正版启动器
1. hmcl
    hello minecraft launcher
1. 麦块
1. MultiMC
1. mclauncher

## mod

MOD，中文通常称做「模组」，不过这并非module的简称，而是modification，原意为「修改」，缩写后取前三个字母，成为大家朗朗上口的MOD。顾名思义，MOD就是修改过的东西，在安装模组之后，可以改变游戏原本内容，延伸更多的玩法，只要拥有主程式，就可以安装这些免费的游戏模组。

.minecraft/mode
.minecraft/shaderpacks  光影


## forge的作用

1)它是一个让你可以轻松安装mod的"东西";

2)它会生成一个“mods”文件夹，使你安装mod的方式变成：

复制mod文件到“mods”文件夹里面就可以

具体来说，Forge是我的世界mod安装的一个平台，有了它，你才能更好的使用mod，体验更多游戏的乐趣。

在新版的forge安装完成后，进入游戏左下角将会有详细信息，没安装的话是看不到的。如下图




## Control

Jump            space
Sneak           Left Shift
Sprint          Left Control
Strafe Left     a
Strafe Right    d
Walk Backwards  s
Walk Forwards   w


Gameplay
Attack/Destroy          Left Button
Pick Block              Middle Button
Use Item/Pleace Block   Right Button

Inventory
Drop Selected Item      q
Hotbar Slot 1           1
Hotbar Slot 2           2
Hotbar Slot 3           3
Hotbar Slot 4           4
Hotbar Slot 5           5
Hotbar Slot 6           6
Hotbar Slot 7           7
Hotbar Slot 8           8
Hotbar Slot 9           9
open/close Inventory    e
swap item in hands      f

creative mode
Load Toolbar Activator  x
Save Toolbar Activator  c



Multiplayer
List Players            Tab
Open chat               t
Open Command            /

Miscellaneous
Advancements                    l
Highlight Players(Spectators)
Take Screenshot                 F2
Toggle Cinematic Camera
Toggle Fullscreen               F11
Toggle Perspective              F5




## 登录服务器
请关闭服务器的正版验证选项 打开server.properties 找到 online-mode设置为false




## 关于OpenJDK

历史上的原因是，openjdk是jdk的开放原始码版本，以GPL协议的形式放出。在JDK7的时候，openjdk已经成为jdk7的主干开发，sun jdk7是在openjdk7的基础上发布的，其大部分原始码都相同，只有少部分原始码被替换掉。使用JRL(JavaResearch License，Java研究授权协议)发布。

至于openjdk6则更是有其复杂的一面，首先是openjdk6是jdk7的一个分支，并且尽量去除Java SE7的新特性，使其尽量的符合Java6的标准。

关于JDK和OpenJDK的区别，可以归纳为以下几点：

授权协议的不同
openjdk采用GPL V2协议放出，而JDK则采用JRL放出。两者协议虽然都是开放源代码的，但是在使用上的不同在于GPL V2允许在商业上使用，而JRL只允许个人研究使用。

OpenJDK不包含Deployment（部署）功能
部署的功能包括：Browser Plugin、Java Web Start、以及Java控制面板，这些功能在Openjdk中是找不到的。

OpenJDK源代码不完整
这个很容易想到，在采用GPL协议的Openjdk中，sun jdk的一部分源代码因为产权的问题无法开放openjdk使用，其中最主要的部份就是JMX中的可选元件SNMP部份的代码。因此这些不能开放的源代码将它作成plug，以供OpenJDK编译时使用，你也可以选择不要使用plug。而Icedtea则为这些不完整的部分开发了相同功能的源代码(OpenJDK6)，促使OpenJDK更加完整。

部分源代码用开源代码替换
由于产权的问题，很多产权不是SUN的源代码被替换成一些功能相同的开源代码，比如说字体栅格化引擎，使用Free Type代替。

openjdk只包含最精简的JDK
OpenJDK不包含其他的软件包，比如Rhino Java DB JAXP……，并且可以分离的软件包也都是尽量的分离，但是这大多数都是自由软件，你可以自己下载加入。

不能使用Java商标
这个很容易理解，在安装openjdk的机器上，输入“java -version”显示的是openjdk，但是如果是使用Icedtea补丁的openjdk，显示的是java。（未验证）

总之，在Java体系中，还是有很多不自由的成分，源代码的开发不够彻底，希望Oracle能够让JCP更自由开放一些，这也是所有Java社区所希望的。


https://www.iteye.com/blog/fgh2011-1771649
