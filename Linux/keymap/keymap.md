debian：
1）修改文件：
/etc/console-setup/cached.kmap.gz   // /etc/console-setup/cached_UTF-8_del.kmap.gz

2）首先备份文件：
cd /etc/console-setup/
sudo cp cached.kmap.gz cached.kmap.gz.bak

3）解压文件：
sudo gzip -d cached.kmap.gz

在这个文件中可以看到：
keycode 29 = Caps_Lock …
keycode 58 = Control …
将这两个数字互换一下，… 表示后面还有很多字符

4）再压缩：
gzip cached.kmap

然后重启机器就好了。注意在这修改也会影响到图形界面。

centos：
1）首先查看键盘布局：
cat /etc/sysconfig/keyboard

看到以下字段表明使用 us 键盘布局
KEYTABLE=”us”

2）修改映射文件：
cd /lib/kbd/keymaps/i386/qwerty/
cp us.map.gz us.map.gz.bak
gzip -d us.map.gz

3）修改键码58为控制键
keycode 58 = Control

4）压缩：
gzip us.map

然后重启系统：shutdown -r now
如果使用远程终端，如 windows 下的 putty，就在对应系统下修改映射。




---


xmodmap -pke | grep -i tab 查看相应按键的键码值（keycode）



xmodmap -pke | grep -i 1 查看全部的键码值





不同的系统上略有不同,比如，在我的系统上是：

keycode 23 = Tab ISO_Left_Tab Tab ISO_Left_Tab 和 keycode 49 = grave asciitilde grave asciitilde

你的系统上对应的keycode可能略有不同。

如果你的xmodmap没有Tab的定义，也没关系，用xev也能找到keycode

然后创建一个 ~/.Xmodmaprc 文件(请注意是大写X)

内容为



keycode 49 = Tab ISO_Left_Tab Tab ISO_Left_Tab

keycode 23 = grave asciitilde grave asciitilde



就是把标准的结果互换一下

然后保存 ~/.Xmodmaprc 在命令行下 xmodmap ~/.Xmodmaprc，就行了

注意，我这里tab对应keycode 23, ~对应49，你的不一定是这样的，

可以用xev(一个识别按键的小工具，在termail下直输入xev即可)来识别。
