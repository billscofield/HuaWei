选项 formatoptions 确定了跟文本格式化有关的基本选项，常用的数值有：

You can see them by :h fo-table¬

    t：根据 textwidth 自动折行；

    c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符；

    r：插入模式下在注释中键入回车时，插入合适的注释起始字符；

    q：允许使用“gq”命令对注释进行格式化；

    n：识别编号列表，编号行的下一行的缩进由数字后的空白决定（与“2”冲突，需要“autoindent”）；

    2：使用一段的第二行的缩进来格式化文本；

    l：在当前行长度超过 textwidth 时，不自动重新格式化；

    m：在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）；
       
       Also break at a multi-byte character above 255.  This is useful for
       Asian text where every character is a word on its own.

    M：在拼接两行时（重新格式化，或者是手工使用“J”命令），如果前一行的结尾或后
       一行的开头是多字节字符，则不插入空格，非常适合中文
       
       When joining lines, don't insert a space before or after a multi-byte
       character.  Overrules the 'B' flag.



NOTE: This option is set to the Vi default value when ‘compatible’ is set and
to the Vim default value when ‘compatible’ is reset.



set compatible 就是让 vim 关闭所有扩展的功能，尽量模拟 vi 的行为。但这样就不应用
vim 的很多强大功能，所以一般没有什么特殊需要的话（比如执行很老的 vi 脚本），都要
在 vim 的配置开始，写上 set nocompatible，关闭兼容模式。由于这个选项是最最基础的
选项，会连带很多其它选项发生变动（称作副作用），所以它必需是第一个设定的选项。


## mac 上遇到的问题

https://blog.csdn.net/auwzb/article/details/11609363


用 vim 写代码，中有时需要限制每行最多的字符数，比如C++代码一般是每行最多80个字符。
于是，我们很自然觉得在 vimrc 中设置如下语句应该没有问题

    set textwidth=80
    "t in fo-table means auto-wrap text using textwidth
    set formatoptions+=t

关于，formatoptions可以查看vim的帮助文档，两个命令如下

    :help formatoptions
    :help fo-table

然而，我们发现这样的设置并不奏效。

在 vim 中使用如下命令可以查看我们的设置是否有效。

    :set formatoptions

我们会看到，其实，t 并没有出现在 formatoptions 中。

原因在于，我们开启了 ftplugin。vim 会先读入 vimrc 的配置，接着检测文件类型，重新
对 vim 的配置进行设置，即我们在 vimrc 的配置被覆盖了。

解决办法可以采用 vim 帮助文档提供的标准解决方法，命令如下

    :help ftplugin-overrule

但是，这些解决方法我觉得都比较麻烦，我采用的方法是，在 vimrc 中增加如下配置

    autocmd FileType c,cpp setlocal textwidth=80 formatoptions+=t

这样做可以解决问题，原因是 vim 启动时先读 vimrc 的配置，接着使用 ftplugin 对应的
文件类型的配置文件对 vim 进行设置，最后，由于我们在 vimrc 定义了函数，检测到文件
类型为 c 或者 cpp，那么，再 setlocal。你如果想要对所有的文件类型都使用配置，而不
仅仅是 c 和 cpp，那么，将命令改为如下即可。

autocmd FileType * setlocal textwidth=80 formatoptions+=t
