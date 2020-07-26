diff描述两个文件不同的方式是**告诉我们怎么样改变第一个文件之后与第二个文件匹配**

//file1.txt
I need to buy apples.
I need to run the laundry.
I need to wash the dog.
I need to get the car detailed.

//file2.txt
I need to buy apples.
I need to do the laundry.
I need to wash the car.
I need to get the dog detailed.

我们使用diff比较他们的不同：
diff file1.txt file2.txt

输出如下结果：
2,4c2,4
< I need to run the laundry.
< I need to wash the dog.
< I need to get the car detailed.
---
> I need to do the laundry.
> I need to wash the car.
> I need to get the dog detailed.

我们来说明一下该输出结果的含义，要明白diff比较结果的含义，我们必须牢记一点，diff描述两个文件不同的方式是告诉我们怎么样改变第一个文件之后与第二个文件匹配。我们看看上面的比较结果中的第一行 2,4c2,4 前面的数字2,4表示第一个文件中的行，中间有一个字母c表示需要在第一个文件上做的操作(a=add,c=change,d=delete)，后面的数字2,4表示第二个文件中的行。

**2,4c2,4 的含义是：第一个文件中的第[2,4]行(注意这是一个闭合区间，包括第2行和第4行)需要做出修改才能与第二个文件中的[2,4]行相匹配。**

接下来的内容则告诉我们需要修改的地方，前面带 < 的部分表示左边文件的第[2,4]行的内容，而带> 的部分表示右边文件的第[2,4]行的内容，中间的 --- 则是两个文件内容的分隔符号。


-N, --new-file

    treat absent files as empty

-a, --text

    treat all files as text

-U, -U NUM, --unified[=NUM]

    output NUM (default 3) lines of unified context

-r, --recursive

    recursively compare any subdirectories found

-b, --ignore-space-change

    ignore changes in the amount of white space
    忽略空格引起的change

-B, --ignore-blank-lines

    ignore changes where lines are all blank
    忽略空行引起的change
    
    diff a.txt b.txt -B -b


--normal 正常格式(默认)

    ```
    文件a           文件2
    1               1
    3               

    2d1             左边删除等于右上
    ```

-c 上下文模式

    ！: 表示要修改
    - : 表示要删除
    + : 表示要增加

-u 合并模式(这个也可以)

    diff -u a b

    ```
    文件a:              文件b:
    aaaa                aaa
    111                 hello
    hello world         111
    222                 222
    333                 bbb
    bbb                 333
                        world

    diff -u a b
    --- a   2020-07-26 23:01:07.524154865 +0800
    +++ b   2020-07-26 23:01:23.188269061 +0800
    @@ -1,6 +1,7 @@
    -aaaa                   文件a删除这一行
    +aaa                    文件a添加这一行
    +hello                  文件a添加这一行
    111
    -hello world            文件a删除这一行
    222
    -333                    文件a删除这一行
    bbb
    +333                    文件a添加这一行
    +world                  文件a添加这一行
    ```

### 比较目录的不同

-q, --brief 仅仅提示不同，而不显示不同的内容

    report only when files differ

    ```
    ➜  diff diff  a b -u
    diff -u a/file1 b/file1
    --- a/file1     2020-07-26 23:11:03.680501077 +0800
    +++ b/file1     2020-07-26 23:11:26.520667596 +0800
    @@ -1 +0,0 @@
    -this is from a
    Only in a: file4
    Only in a: file5
    Only in b: test1
    Only in b: test2

    ➜  diff diff  a b -u -q
    Files a/file1 and b/file1 differ
    Only in a: file4
    Only in a: file5
    Only in b: test1
    Only in b: test2
    ```

## patch

patch [options] [originalfile [patchfile]]


diff -u a b > abdiff.patch

patch 


-R, --reverse


-p 从路径全称中除去几层目录

    如果补丁文件包含路径名称，如 /curds/whey/src/blurfl/blurfl.c

    那么

    -p 0 使用完整路径名

    -p 1 除去前导斜杠，留下 curds/whey/src/blurfl/blurfl.c 

    -p 4 除去前导斜杠和3个目录，留下 blurfl/blurfl.c 




