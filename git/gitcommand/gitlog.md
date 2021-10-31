## git log

```

commit ab619eed2f15d3ec967fe94e35aab4322a1cfb55 (HEAD -> master)
Author: bill <bill@bill.com>
Date:   Fri Feb 28 07:43:53 2020 +0800

    create motion.mp4
```



冒泡式，上面的是时间上最新的


Show commit logs

git log 分支名

--all
    Pretend as if all the refs in refs/, along with HEAD, are listed on the command line as <commit>.
    分支名不起作用了


--graph
    Draw a text-based graphical representation of the commit history on the left hand side of the output. This may cause extra lines to be printed in between commits, in order for the graph history to be drawn properly.
    Cannot be combined with --no-walk.

    This enables parent rewriting, see History Simplification above.

    This implies the --topo-order option by default, but the --date-order option may also be specified.


例子
    git log --all --graph
    git log --all --oneline --graph


--oneline
    This is a shorthand for "--pretty=oneline --abbrev-commit" used together.

-<number>, -n <number>, --max-count=<number>
    Limit the number of commits to output.

    git log -4 --oneline

--stat 显示每次更新的文件修改统计信息。

--since=/--before
--after=/--until
    git log --since='2019-01-01' --before='2019-06-01'
        发现如果只写日期，结果可能不太对，最好把时间也写上
        git log --since='2020-02-28 0:00' --before='2020-02-28 12:00'
    git log --since 2years
    git log --since 2months
    git log --since 2weeks
    git log --since 1day
    git log --since 1hour
    git log --since 20minutes
    

--author

--relative-date 使用较短的相对时间显示（比如，“2 weeks ago”）。
--abbrev-commit 仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。

-p, -u, --patch
    Generate patch (see section on generating patches).
    
    ```
    commit bd148332ddc3a5462073419ceaaab932a6bec1cb
    Author: bill <bill@bill.com>
    Date:   Thu Feb 27 18:50:38 2020 +0800

        create style.css

    ||diff --git a/one/style.css b/one/style.css
    ||new file mode 100644
    ||index 0000000..2eedbfe
    ||--- /dev/null
    ||+++ b/one/style.css
    ||@@ -0,0 +1,3 @@
    ||+body{
    ||+    background:green;
    ||+
    ||}

    ```





