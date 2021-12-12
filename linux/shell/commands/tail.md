-f, --follow[={name|descriptor}]

    output appended data as the file grows;

    an absent option argument means 'descriptor'

-F     same as --follow=name --retry


With  --follow  (-f),  tail defaults to following the file descriptor, which
means that even if a tail'ed file is renamed, tail will continue to track its
end.  

This default behavior is not desirable when you really want to track the
actual name of the file, not the file descriptor (e.g., log rotation).  

Use --follow=name in that case.  That causes tail to track the named file in a
way that accommodates(容纳；使适应) renaming, removal and creation.


## -n [数字] 和 -数字 的区别

-n 选项是 POSIX 要求，但两种写法效果没啥区别。《shell 脚本学习指南》这本书上说的。

