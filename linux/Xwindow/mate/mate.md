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


