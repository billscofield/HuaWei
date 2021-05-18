
https://zhuanlan.zhihu.com/p/25801800

## 显示/隐藏

默认情况下，Vim是不会显示space,tabs,newlines,trailing space,wrapped lines等不可见字符的。我们可以使用以下命令打开list选项，来显示非可见字符：

:set list

”，而行尾则标识为“$”


## 显示符号

使用:set listchars命令，可以配置使用何种符号来显示不可见字符。例如以下命令，将制表符（tab）显示为…；将尾部空格（trail）显示为·；将左则超出屏幕范围部分（precedes）标识为«；将右侧超出屏幕范围部分（extends）标识为»。

> set listchars=nbsp:¬,tab:···,precedes:«,extends:»

其中，特殊符号是在插入状态下，点击快捷键Ctrl-k，然后键入编码来输入的。比如，中点是由.M输入；左书名号是由<<输入，右书名号是由>>输入。
十进制是插入模式下 Ctrl-v 

可以使用以下命令，查看可以输入的特殊字符：

:digraphs
