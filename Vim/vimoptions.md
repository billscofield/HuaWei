
### 

重复上次的ex命令:           @:
    : 寄存器, 保存着最后执行的命令行命令
    运行过一次@: 后就可以用@@ 重复执行它

重复上次的substitute命令:   &



cw 删除从光标位置到单词结尾间的字符，并进入插入模式

[ )

vimgolf

<c-a>   如果光标不在数字上，将作用在当前行、正向查找到的第一个数字上

操作符执行两边来作用于当前行
    特例: gUgU 或者 gUU


<c-h> 插入模式中删除前一个字符


<c-r>{寄存器} 模拟按键一个一个的输入，所以如果设置了 textwidth 或者 autoindent 
    最终会出现不必要的换行和额外的缩进

    <c-r><c-p>{register}

    或者插入模式 直接粘贴



### 插入特殊字符

查看字符编码 : ga 屏幕下方会以 十进制 和 十六进制 显示 

ASCII :  <c-v>ASCII编码     //065

Unocode: <c-v>u{1234}
    



### 可视模式

o
gv
r|
Vr-


<c-V> 然后用 c


### ex命令

:range delete   registerX
:range yank     registerX
:range put      registerX
:range copy     registerX       co/t
:range move     registerX       m
:range join     registerX       普通模式下为 J

用高亮模式做泛微

    选中后输入":", -> :'<,'>


'm      包含位置标记m的行
'<
'>
0       虚拟行, 文件第一行上边的一行
$       最后一行


<c-r><c-w> 把当前光标下单词插入到命令行
    substitute 时非常好用

<c-r><c-a> 把当前光标下子串插入到命令行



:w | !python3 %


q/      查找命令历史窗口
q:      Ex命令历史窗口
<c-f>:  从命令行模式切换到命令历史窗口

el Abc


:[range]write !{cmd}        在shell中执行cmd， 以[range]作为其标准输入
:[range]!{filter}           使用外部程序filter 过滤指定的 range
    :1,$!sort -t ',' -k2


#### 自动补全 ex 命令

<c-d>
    tab         顺时针循环
    <S-tab>


### 宏

绝大多数情况下，“宏”这个词的使用暗示着将小命令或动作转化为一系列指令。

宏的用途在于自动化频繁使用的序列或者是获得一种更强大的抽象能力。

宏的使用

    方法一: 10@{寄存器}
        类似串联，中途遇到问题会停止向下执行

    方法二: 可视模式选中 ex 模式执行
        :'<,'> normal @{寄存器}
        类似并联，某一行出现问题不会影响其他
       


### ga                      

Mnemonic: **Get Ascii value.**

Print the ascii value of the character under the
cursor in decimal, hexadecimal and octal.

For example, when the cursor is on a 'R':
<R>  82,  Hex 52,  Octal 122
    When the character is a non-standard ASCII character,
    but printable according to the 'isprint' option, the
    non-printable version is also given.

    When the character is larger than 127, the <M-x> form
    is also printed.  For example:
    <~A>  <M-^A>  129,  Hex 81,  Octal 201
    <p>  <|~>  <M-~>  254,  Hex fe,  Octal 376
    (where <p> is a special character)


### 'nrformats' 'nf'        
    string  (default "bin,octal,hex", set to "bin,hex" in defaults.vim)
    local to buffer
    {not in Vi}

This defines what bases Vim will consider for numbers when using the
CTRL-A and CTRL-X commands for adding to and subtracting from a number
respectively; see CTRL-A for more info on these commands.

alpha   If included, single alphabetical characters will be
        incremented or decremented.  This is useful for a list with a
        letter index a), b), etc.               octal-nrformats

octal   If included, numbers that start with a zero will be considered
        to be octal.  Example: Using CTRL-A on "007" results in "010".

hex     If included, numbers starting with "0x" or "0X" will be
        considered to be hexadecimal.  Example: Using CTRL-X on
        "0x100" results in "0x0ff".

bin     If included, numbers starting with "0b" or "0B" will be
        considered to be binary.  Example: Using CTRL-X on
        "0b1000" subtracts one, resulting in "0b0111".

Numbers which simply begin with a digit in the range 1-9 are always
considered decimal.  This also happens for numbers that are not


### Tab

'expandtab' 'et'        boolean (default off)

local to buffer
{not in Vi}

In Insert mode: Use the appropriate number of spaces to insert a
<Tab>.  Spaces are used in indents with the '>' and '<' commands and
when 'autoindent' is on.  

**To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.  **

See also :retab and ins-expandtab.

This option is reset when the 'paste' option is set and restored when
the 'paste' option is reset.
NOTE: This option is reset when 'compatible' is set.



### compatible

vim -u None -N

-u :None 不加载自己的vimrc配置文件
    路径/vimrc文件 自定义配置文件

-N :nocompatiable 模式


'compatible' 'cp'       boolean (default on, off when a vimrc or gvimrc
        file is found, reset in defaults.vim)
global
{not in Vi}

This option has the effect of making Vim either more Vi-compatible, or
make Vim behave in a more useful way.

    This is a special kind of option, because when it's set or reset,
    other options are also changed as a side effect.
    NOTE: Setting or resetting this option can have a lot of unexpected
    effects: Mappings are interpreted in another way, undo behaves
    differently, etc.  If you set this option in your vimrc file, you
    should probably put it at the very start.

    By default this option is on and the Vi defaults are used for the
    options.  This default was chosen for those people who want to use Vim
    just like Vi, and don't even (want to) know about the 'compatible'
    option.
    When a vimrc or gvimrc file is found while Vim is starting up,
    this option is switched off, and all options that have not been
    this option is switched off, and all options that have not been
    modified will be set to the Vim defaults.  Effectively, this means
    that when a vimrc or gvimrc file exists, Vim will use the Vim
    defaults, otherwise it will use the Vi defaults.  (Note: This doesn't
            happen for the system-wide vimrc or gvimrc file, nor for a file given
            with the -u argument).  Also see compatible-default and
    posix-compliance.
    You can also set this option with the "-C" argument, and reset it with
    "-N".  See -C and -N.
    See 'cpoptions' for more fine tuning of Vi compatibility.

    When this option is set, numerous other options are set to make Vim as
    Vi-compatible as possible.  When this option is unset, various options
    are set to make Vim more useful.  The table below lists all the
    options affected.
    The {?} column indicates when the options are affected:

    +  Means that the option is set to the value given in {set value} when
        'compatible' is set.

    &  Means that the option is set to the value given in {set value} when
        'compatible' is set AND is set to its Vim default value when
        'compatible' is unset.

    -  Means the option is NOT changed when setting 'compatible' but IS
        set to its Vim default when 'compatible' is unset.

    The {effect} column summarises the change when 'compatible' is set.

