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

在晶圆上全是纵横交错的 3D 电路

电路一般由大量的三极管，二极管，CMOS管，电阻，电容，电感，导线等组成

### 3.1 PN 结的工作原理

一个原子的最外层电子数为 8 时最稳定，半导体元素，一般最外层有4个电子，这些原子
之间往往通过 "共享电子" 的模式存在, 多个原子之间分别共享其最外层的电子，通过共
价键形成最外层8个电子的稳定结构。

电子的移动形成空穴，临近的电子也很容易跳过去填补这个空穴，产生一个新的空穴，造
成空穴的移动。

空穴带正电荷

半导体有两种载流子: 自由电子和空穴

由于硅原子比较稳定，只能生成极少数的自由电子和空穴，这就决定了硅无法像金属那样
导电，也不像绝缘体那样一点也不导电，因此我们称之为半导体.

参杂：增加载流子的浓度

在一块半导体的两边分别掺入两种不同的元素: 一边掺入三价元素，如硼、铝等, 另一边
掺入五价元素，如磷


**硼原子**的电子分布为 2-3, 在和硅原子的最外层4个电子生成共价键时，由于缺少一个
电子，于是从临近的硅原子中夺取一个电子，因而产生一个空穴位。

每掺杂一个硼原子，就会产生一个空穴位.

这种掺杂三价元素的半导体增加了空穴的浓度，我们一般称之为空穴型半导体，或称为 P
型半导体(Positive);


**磷原子**的电子分布 2-8-5, 在和硅原子的最外层4个电子生成共价键时，还多出来一个
电子，成为自由移动的电子。

每掺杂一个磷原子，就会产生一个自由移动的电子。

这种掺杂五价元素的半导体增加了自由电子的浓度，我们一般称之为电子型半导体，或称
N型半导体(Negative)


在一块半导体的两边分别掺入不同的元素，使之成为不同的半导体。一边为P型，一边为N
型。在两者的交汇处，就会形成一个特殊的界面，我们称之为 PN结。


|    空穴    |    自由电子    |
|            |                |

|    空穴    |     耗尽层     |    自由电子    |
|     +      |  -          +  |       -        |
|            |   <--------    |                |
|            |   内建电场     |                |


单向导电性
    当在PN结两端添加正向电压时，内建电厂被削弱，平衡被打破，形成电流

        +   | P N | -

    当在PN结两端添加反向电压时，内建电场被增强, 进一步阻止空穴和自由电子的扩散，不会形成电流

        -   | P N | +

### 3.2 CMOS 管

[link](https://www.bilibili.com/video/BV1344y167qm/?spm_id_from=333.788.recommend_more_video.-1)


Complementary Metal-Oxide-Semiconductor

金属氧化物 半导体 场效应 晶体管

栅级和半导体之间是金属氧化物绝缘层
栅级和半导体之间的场效应

|                   +---------------+
|                   |   半导体      |
|                   +----+          |
| 1. 吸引电子    +->| N  |          |
|                |  +----+          |
|                正 |               |
|                |  |               |
|                |  | P             | 3. 结果就是: 形成不了电流
|                |  |               |
|                负 |               |
|                |  +----+          |
| 2. 聚集电子    +- | N  |          |
|                   +----+          |
|                   |               |
|                   +---------------+


|                        +---------------+
|                        | 漏极(漏电子)  |
|                        +----+          |
| 1. 吸引电子    +--+--->| N  |          |
|                |  |  ) +----+          |
|                正 |  ) |               |
|                |  +->) | 3. 此处开始聚集少量的电子
|     栅级(开关) |   A ) | P             | 4. 结果就是: 形成了电流
|                |     ) |               |
|                负    ) |               |
|                |       +----+          |
| 2. 聚集电子    +-------| N  |          |
|                        +----+          |
|                        | 源极(电子源泉)|
|                        +---------------+


    源极，漏极和中间的P 构成 N沟道, 栅级有正电压时, NPN相当于一块半导体可以导电

    1. 栅级和P之间的电阻极高，所以是断开的
    2. 它们之间很容易被击穿

    箭头代表流动方向


    GATE    栅极
    Body    就是基极
    Drain   漏极
    Source  源极

GATE之下有一个Oxide (氧化物层，绝缘体)，所以GATE处不会有电流流下，就不会浪费电，
所以理想的场效应管的开关控制是很省电的，但这仅存在在理想情况下。

实际上呢，没有什么东西是完全绝缘的，尤其当场效应管的尺度缩小到奈米尺度，可想而
知，薄薄的这个氧化物绝缘层绝缘效果没有那么好，结果呢，就仿佛在GATE和SOURCE间有
个电容，电容会影响红框中电流大小，相应关系为正比，也就是说电容越大越好，在几何
尺寸很难变动的前提下，更大的电容就要求更大材料的介电系数。

这个氧化物层，传统上是SiO2，那么现在就有厂商开始用High-K(高介电,只要介电常数大
于SiO2的介电常数3.9，一般都称为high-k材料)材料来替换SiO2，这就是大家经常听说的
High-K技术啦


short-channel effect

    在Drain (漏极)，Source (源极)之间会产生一个Channel (通路，电流的管道)

    GATE电压增高，channel 越来越粗，自然流过去的电流就增大了。然而，随着我们逐
    渐缩小晶体管的大小，channel越来越短了，某一时刻,几乎很难判断电流的大小变化，
    也就很难做晶体管是否打开这个至关重要的逻辑判断了。

    这就是short-channel effect的后果，一来会使逻辑判断变困难，另一方面可以看成，
    晶体管一直都在开着，那么电流就一直在白流，这就是大家所熟知的漏电流了，漏电
    流以前就存在，只是没有那么大，也正是这些漏电流导致了CPU, GPU的TDP

### 3.3 从PN结到芯片电路

如何在晶圆上形成一个PN结

氧化 - **光刻** - 显影 - 刻蚀 - 扩散 - **离子注入** - 薄膜沉淀 - 金属化

离子注入就是掺杂

光刻胶：感光溶解
光刻掩模版
紫外线
硅衬底

芯片物理版图的每一层电路，都需要制作对应的掩膜版

光刻机主要用来将设计好的电路映射到晶圆上

ASML(阿斯麦)

光刻机的作用是根据电路版图制作掩膜版，开凿各种掺杂窗口，然后通过离子注入，生成
PN结, 进而构建千千万万的元器件

晶圆上的每一个小格子都是一个芯片电路，叫做晶粒(Die)


### 3.4 芯片的封装

单纯的芯片电路无法直接焊接到硬件电路上，还需要经过**切割，封装，引出管脚，芯片
测试等**后续流程

DIP(Dual in-line Package)

球栅阵列封装(Ball Grid Array Package,BGA)
    表面铁装型封装
    球状凸点代替管脚

芯片级封装(Chip Scale Package)
    封装后的芯片尺寸更接近实际的芯片电路

层叠封装(Package-on-Package,PoP)

    将多个芯片元器件分层堆叠，互联，封装在一个芯片内，从而让整个芯片更薄，体积
    更小

### 3.5 CPU 内部结构和工作原理

ALU(Arithmetic and Logic Unit,算数逻辑单元)
    ALU 是纯粹的运算单元



[解码阶段](https://zhuanlan.zhihu.com/p/104016881)

    取到指令后，CPU就会进入解码阶段（Decode Phase）来分析取到的指令内容。

    在这个例子中，指令寄存器中保存的是00101110。

    前四位0010为操作码，通过指令表可知这个指令是LOAD A指令，就是将RAM中的值保存在寄存器A中。

    而后四位1110保存的是RAM地址，转成十进制就是14。

    所以指令00101110的意思就是将RAM中第14位的数据(一共16个)保存到寄存器A中。


