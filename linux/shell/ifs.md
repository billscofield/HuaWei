
IFS（Internal Filed Separator，内部域分隔符）是一个set变量（shell变量），默认是
空格、Tab键、换行符，使用for循环读取值列表时，会根据IFS的值判断列表中值的个数。

IFS的多个值之间是“或”的关系

万一不小心把IFS值设置错了，也可通过如下赋值方式使其恢复到默认值

IFS=$' \t\n'

[link](https://blog.csdn.net/guyongqiangx/article/details/80220434?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1.pc_relevant_aa&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1.pc_relevant_aa&utm_relevant_index=2)

在PDF版的bash手册中搜索“IFS”, 总共在13个章节找到33个结果，其中最重要的地方有4个，包括：

第71页，第5.1节(“5.1 Bourne Shell Variables”)对shell变量IFS的定义
第30页，第3.5.7节(“3.5.7 Word Splitting”)对字符分割中使用IFS的介绍
第20页，第3.4.2节(“3.4.2 Special Parameters”)对特殊参数使用IFS的介绍
第92页，第6.7节(“6.7 Arrays”)对数组引用中使用IFS的介绍

Bash手册的第30页，第3.5.7节“Word Splitting”描述了基于IFS进行分割的细节，如下：

The shell scans the results of parameter expansion, command substitution, and
arithmetic expansion that ***did not occur within double quotes*** for word                     //???
splitting.

The shell treats each character of $IFS as a delimiter, and splits the results
of the other expansions into words using these characters as field terminators.

    1. If IFS is unset, or its value is exactly <space><tab><newline>, the
       default, then sequences of <space>, <tab>, and <newline> at the
       beginning and end of the results of the previous expansions are ignored,
       and any sequence of IFS characters not at the beginning or end serves to
       delimit words.
        
       <space><tab><newline> 是特殊对待的, 当位于首和尾时,**不会将其作为分隔符
       **, 如果是自定义的IFS,自定义的字符会被当作分隔符. 例如:
        
       ```
       IFS_OLD=$IFS
       IFS='a'
       string='a123'
       
       for i in ${string};do
           echo "<${i}>"
       done
       
       输出结果为:
        
       <>
       <123>



       #!/usr/bin/env bash
        
       IFS_OLD=$IFS
       IFS='a '                             // 自定义的分隔符在 beginning 处不会被忽略
       string='a 123'
        
       for i in ${string};do
           echo "<${i}>"
       done
        
       [20:31:53]root@newcomer: ~# ./b.sh
       <>
       <123>
        
       ```
        
       <space><tab><newline> 是特殊对待的,Shell 会把它们按照任意顺序,任意数量,
       组合成的字符串作为分隔符，而不是单个字符作为分隔符。

    2. If IFS has a value other than the default, then sequences of the
       whitespace characters space, tab, and newline are ignored at the
       beginning and end of the word, as long as the whitespace character is in
       the value of IFS (an IFS whitespace character). 
        
       Any character in IFS that is not IFS whitespace, along with(与...一起)
       any adjacent IFS whitespace characters, delimits a field.
       
       IFS中的非空白字符和空白字符组成的序列,被当作**一个**分隔符
        
       A sequence of IFS whitespace characters is also treated as a delimiter.
       一组连续的 <space><tab><newline> 被当作**一个**分隔符

    3. If the value of IFS is null, no word splitting occurs.

