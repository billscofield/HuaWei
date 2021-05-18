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
