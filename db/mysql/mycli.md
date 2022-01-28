# MyCli之多行模式

我们在使用MySQL工具查询的时候，通常是以分号作为查询结束的标志，而在MyCli中是使
用回车则表示结束的。

现在介绍如何在MyCli中使用分号表示命令的结束。

## Method 1：F3

使用F3切换至多行模式，但是这种方式只是临时性的，要想永久设置，需要在MyCli配置文
件中配置相应的属性，参考方法二；


## Method 2: VI mode(F4)

使用F4来切换Emac和VIM模式的，我们切换到VIM模式，将光标移动到我们想要以分号结尾，
但是还不想执行SQL语句的分号后面，按Esc，命令行模式输入o（在当前光标后插入一行）。


## Method 3: 修改MyCli配置文件中的multi_line属性

在Linux下：

sudo vim ~/.myclirc 1找到multi_line属性，并设置为True

保存并退出vim，重新启动MyCli即可。


## Keywords casing preference
keyword_casing = upper/lower/auto


# Keybindings
key_bindings = vi
