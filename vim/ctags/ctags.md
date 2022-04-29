# ctags

--list-kinds[=language|all]

    查看ctags可以识别和记录的语法元素

    Lists  the  tag  kinds  recognized  for either the specified language or
    all languages, and then exits. Each kind of tag recorded in the tag file is
    represented by a one-letter flag, which is also used to filter the tags
    placed into the output through use of the --<LANG>-kinds option. Note that
    some languages and/or tag kinds may be implemented using regular
    expressions and may not be available if regex support is not compiled into
    ctags (see the --regex-<LANG> option). Each kind listed is enabled unless
    followed by "[off]".

--list-maps[=language|all]

    查看语言和扩展名的对应关系

    Lists the file extensions and file name patterns which associate a file
    name with a language for either the specified language or all languages,
    and then exits. See the --langmap option, and SOURCE FILES, above.

--list-languages

    查看ctags支持的语言

    Lists the names of the languages understood by ctags, and then exits.
    These language names are case insensitive and may be used in the
    --language-force, --languages, --<LANG>-kinds, and --regex-<LANG> options.


--language-force=language

    By default, ctags automatically selects the language of a source file,
    ignoring those files whose language cannot be determined (see SOURCE FILES,
    above). This option forces the specified language (case-insensitive;
    either built-in or user-defined) to be used for every supplied file instead
    of automatically selecting the language based upon its extension. In
    addition, the special value auto indicates that the language should be auto
    ‐matically selected (which effectively disables this option).


--extra=[+|-]flags
    Specifies  whether  to  include  extra  tag  entries for certain kinds of information. The parameter flags is a set of one-letter
    flags, each representing one kind of extra tag entry to include in the tag file. If flags is preceded by either the  '+'  or  '-'
    character, the effect of each flag is added to, or removed from, those currently enabled; otherwise the flags replace any current
    settings. The meaning of each flag is as follows:

    f   Include an entry for the base file name of every source file (e.g.
        "example.c"), which addresses the first  line  of  the file.

    q   Include  an extra class-qualified tag entry for each tag which is a
        member of a class (for languages for which this infor‐mation is
        extracted; currently C++, Eiffel, and Java). The actual form of the
        qualified tag depends upon the language from which  the  tag was
        derived (using a form that is most natural for how qualified calls are
        specified in the language). For C++, it is in the form "class::member";
        for Eiffel and Java, it is in the form "class.member". This may allow
        easier loca‐tion  of a specific tags when multiple occurrences of a tag
        name occur in the tag file. Note, however, that this could po‐tentially
        more than double the size of the tag file.


--fields=[+|-]flags

    Specifies the available extension fields which are to be included in the entries of the tag file (see TAG FILE FORMAT, below, for
    more  information).  The  parameter flags is a set of one-letter flags, each representing one type of extension field to include,
    with the following meanings (disabled by default unless indicated):

    a   Access (or export) of class members
    f   File-restricted scoping [enabled]
    i   Inheritance information
    k   Kind of tag as a single letter [enabled]
    K   Kind of tag as full name
    l   Language of source file containing tag
    m   Implementation information
    n   Line number of tag definition
    s   Scope of tag definition [enabled]
    S   Signature of routine (e.g. prototype or parameter list)
    z   Include the "kind:" key in kind field
    t   Type and name of a variable or typedef as "typeref:" field [enabled]

    Each letter or group of letters may be preceded by either '+' to add it to the default set, or '-' to exclude it. In the  absence
    of any preceding '+' or '-' sign, only those kinds explicitly listed in flags will be included in the output (i.e. overriding the
    default set). This option is ignored if the option --format=1 has been specified. The default value of this option is fkst.




若文件是可执行的又没有后缀，则ctag会查看文件的第一行（如脚本文件的#!），判断其语言类型。

-I identifier-list
    Specifies  a  list of identifiers which are to be specially handled while parsing C and C++ source files.

对当前目录下所有ctags支持的语言格式文件生成tags
    
    ` ctags -R *

    -R   Equivalent to --recurse.

只对特定文件生成tags

    ` ctags `find -name "*.h"`

## 使用tags

tag 命令

    用于跳转到指定的tag。例如：

    tag tagname

    使用这个命令可以跳转到tagname的定义处，即使它在另一个文件中。

快捷键Ctrl+]

    取出当前光标下的word作为tag的名字并进行跳转。

tags 命令

    列出曾经访问过的tag的列表

快捷键Ctrl+T

    跳转到前一次的tag处。

stag命令

    stag tagname

    分割当前窗口，并且跳转到指定的tag。

快捷键Ctrl+W+]

    分割当前窗口，并且跳转到光标下的tag。

同名tag

    如果存在多个同名的tag，tag命令会给出一个tag的列表，可以通过键入tag的序号来
    选择tag；也可以通过tselect来过滤tag，如：:tselect tagname

    如果要在多个tag间移动，可以使用如下命令：

    :tfirst             go to first match
    :[count]tprevious   go to [count] previous match
    :[count]tnext       go to [count] next match
    :tlast              go to last match

    如果没有指定[count]，默认是1。

其他

    如果是多个tags文件，可以通过设置tags选项来引入更多的tags文件。例如: :set
    tags=./tags, ./../tags, ./*/tags

    使用tag命令时，可以输入部分tag名，然后使用Tab键进行补全。



