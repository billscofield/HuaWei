## 1. vim

### 1. vim 的发展历史

1. QED

    [link](https://en.wikipedia.org/wiki/QED_(text_editor))
    
    QED is a line-oriented computer text editor that was developed by Butler
    Lampson and L. Peter Deutsch for the Berkeley Timesharing System running on
    the SDS 940. It was implemented by L. Peter Deutsch and Dana Angluin
    between 1965 and 1966.

    QED (for "quick editor") addressed teleprinter usage, but systems "for CRT
    displays [were] not considered, since many of their design considerations
    [were] quite different."
    
    Ken Thompson later wrote a version for CTSS; this version was notable for
    introducing regular expressions. 

    Dennis Ritchie, Ken Thompson and Brian Kernighan wrote the QED manuals used
    at Bell Labs.

    Given that the authors were the primary developers of the Unix operating
    system, it is natural that QED had a strong influence on the classic UNIX
    text editors ed, sed and their descendants such as ex and sam, and more
    distantly AWK and Perl.


2. ed

    [link](https://en.wikipedia.org/wiki/Ed_(text_editor))
    
    1969 年 8 月，在妻子和幼子外出去加州度假时，Thompson “给操作系统、shell、编
    辑器和汇编程序分别分配了一个星期”，将新系统的基本组件组合在一起。

    这个编辑器被称为 ed 。它是基于 QED 的，但并不完全是 QED 的复现。

3. ex
    
    [link](https://en.wikipedia.org/wiki/Ex_(text_editor))

    ex, short for EXtended

    originally written by Bill Joy[3] in 1976

4. Vi

    [link](https://en.wikipedia.org/wiki/Vi)

    是 visual interface 的简写, 视觉接口; 作为 ex 的可视化操作接口

    is a screen-oriented text editor originally created for the Unix operating
    system

    The original code for vi was written by Bill Joy in 1976, as the visual
    mode for a line editor called ex that Joy had written with Chuck Haley.

    Bill Joy's ex 1.1 was released as part of the first Berkeley Software
    Distribution (BSD) Unix release in March 1978. It was not until version 2.0
    of ex, released as part of Second BSD in May 1979 that the editor was
    installed under the name "vi" (which took users straight into ex's visual
    mode), and the name by which it is known today.



    [link](http://www.wallcopper.com/linux/16.html)

    1976年左右Bill Joy开发了vi，他也是伯克利大学的毕业生，后来他跟其他人一起成立了
    Sun Microsystems公司并成为了Sun的首席科学家。

    一开始 Bill 开发了ex，尔后开发了vi作为ex的visual interface，也就是说vi允许一次
    能看到一屏的文本而非一行，vi也因此得名。


5. Vim: Vi Improved

    [link](https://en.wikipedia.org/wiki/Vim_(text_editor))

    A contraction of Vi IMproved) is a free and open-source, screen-based text
    editor program for Unix.

    Vim's author, **Bram Moolenaar**, derived(从……衍生出) Vim from a port of
    the Stevie editor for Amiga and released a version to the public in 1991.

    At the time of its first release, the name "Vim" was an acronym for "Vi
    IMitation(模仿)", but this changed to "Vi IMproved" late in 1993.



### 2. 常用快捷键

E               移动到下一个单词的词尾(忽略标点符号)
2|              移动到当前行的第二列
3fx             移动到当前行的第三个x上
C-g             查看当前光标的位置
C-u/d           向文章末尾半屏 / 向文章开头半屏
C-f/b           向文章末尾一屏 / 向文章开头一屏
X               删除当前光标左边的字符
s/old/new       将当前行的第一个替换
s/old/new/g     将当前行的所有替换
:e!             放弃修改,恢复至打开时的状态
:w !sudo tee %  普通用户模式下保存root读写权限的文件
    % 当前文件名
    tee 把缓冲区的数据保存到当前文件
    会提示输入用户的密码

插入模式下
    <C-h> 删除光标左边的字符


### 3. 脚本中功能键的写法

Tab
<CR>        enter
<F5>
<Esc>
<BS>        backspace
<DELETE>
<A>         Alt
<Space>
<LEFT>      方向键左
<RIGHT>
<UP>
<DOWN>
<C>         Ctrl
<C-a>       Ctrl+a 组合键



## 2. make

as      汇编器
cpp     预处理器
ld      链接器
gcc     GNU c 编译器, 其实是大管家
g++     GNU c++ 编译器
gdb     调试器
ar      归档工具,用来制作库


gcc
    -E      只预处理,不编译
    -S      只编译到汇编文件, 不再汇编
    -c      只编译生成目标文件,不进行链接
    -g      生成带有可调试信息的 debug 文件

    -I      大写的 i, 在编译时指定头文件的路径
    -L      大写的 l, 指定函数库的路径
    -l      小写的 L, 指定程序使用的函数库


make

    If no -f option is present, make will look for the makefiles 

        1. GNUmakefile,
        2. makefile
        3. Makefile

    in that order.

    Normally you should call your makefile either makefile or Makefile.(We
    recommend Makefile because it appears prominently near the beginning of a
    directory listing, right near other important files such as README.) 

    The first name checked, GNUmakefile, is not recommended for most makefiles.
    You should  use  this name  if  you  have a makefile that is specific to
    GNU make, and will not be understood by other versions of make.

    If makefile is '-', the standard input is read.


## 3. 一颗芯片的诞生

可激发载流子

使用碳将二氧化硅还原成硅

提纯

生成多晶硅

将多晶硅放入高温反应炉中融化

掺杂一些硼元素或磷元素增加导电性

放入硅晶体晶种

通过**拉晶(通过拉杆不停旋转上拉)**做出**单晶硅棒**

根据不同的需求和工艺,单晶硅棒可以做成不同的尺寸,如常见的6英寸,8英寸,12英寸

接下来,将这些单晶硅棒像切黄光一样,切成一片一片的,每一片我们称为**晶圆(wafer)**

晶圆上的每一个小格子都是一个芯片电路的物理实现,我们称之为**晶粒(Die)**

对晶圆上的这些芯片电路进行切割\封装\引出管脚,然后就变成了市场上常见的芯片产品
