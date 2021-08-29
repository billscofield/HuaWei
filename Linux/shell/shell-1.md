
## test

https://www.shellscript.sh/test.html

man test

Test is used by virtually every shell script written. It may not seem that way,
because test is not often called directly. test is more frequently called as [.

**[ is a symbolic link to test, just to make shell programs more readable.** 

It is also normally a shell builtin (which means that the shell itself will
interpret [ as meaning test, even if your Unix environment is set up
differently):


```
$ type [
[ is a shell builtin
$ which [
/usr/bin/[
$ ls -l /usr/bin/[
lrwxrwxrwx 1 root root 4 Mar 27 2000 /usr/bin/[ -> test
$ ls -l /usr/bin/test
-rwxr-xr-x 1 root root 35368 Mar 27  2000 /usr/bin/test
```

This means that '[' is actually a program, just like ls and other programs, so it must be surrounded by spaces:

    > if [$foo = "bar" ]

will not work; it is interpreted as if test$foo = "bar" ], which is a ']'
without a beginning '['. Put spaces around all your operators. I've highlighted
the mandatory spaces with the word 'SPACE' - replace 'SPACE' with an actual
space; if there isn't a space there, it won't work:

    > if SPACE [ SPACE "$foo" SPACE = SPACE "bar" SPACE ]

Note: Some shells also accept "==" for string comparison; this is not portable,
a single "=" should be used for strings, or "-eq" for integers.


## read

read // 可以接收多个参数
    read -p "Plz input ur name, age, gender: " name age gender

    - -a 后跟一个变量，该变量会被认为是个数组，然后给其赋值，默认是以空格为分割符。
    - -d 后面跟一个标志符，其实只有其后的第一个字符有用，作为结束的标志。
    - -p 后面跟提示信息，即在输入前打印提示信息。
    - -e 在输入的时候可以使用tab命令补全功能。
    - -n 后跟一个数字，定义输入文本的长度，很实用。
        **当输入的字符数目达到预定数目时，自动退出，并将输入的数据赋值给变量。**
        
        ```
        #!/bin/bash
        
        read -n1 -p "Do you want to continue [Y/N]?" answer
        case $answer in
        Y | y)
              echo "fine ,continue";;
        N | n)
              echo "ok,good bye";;
        *)
             echo "error choice";;
        
        esac
        exit 0
        ```

    - -r 屏蔽\，如果没有该选项，则\作为一个转义字符，有的话 \就是个正常的字符了。
    - -s 安静模式，在输入字符时不再屏幕上显示，例如login时输入密码。
        （实际上，数据是显示的，只是 read 命令将文本颜色设置成与背景相同的颜色）
        ```
        #!/bin/bash
            
        read  -s  -p "请输入您的密码:" pass
        echo "\n您输入的密码是 $pass"
        exit 0
        ```

    - -t 后面跟秒数，定义输入字符的等待时间。
        当计时满时，read命令返回一个非零退出状态。
        ```
        #!/bin/bash
        
        if read -t 5 -p "输入网站名:" website
        then
            echo "你输入的网站名是 $website"
        else
            echo "\n抱歉，你输入超时了。"
        fi
        exit 0
        ```

    - -u 后面跟fd，从文件描述符中读入，该文件描述符可以是exec新开启的。


    - 读取文件
        每次调用 read 命令都会读取文件中的 "一行" 文本。当文件没有可读的行时，read 命令将以非零状态退出。
        通过什么样的方法将文件中的数据传给 read 呢？使用 cat 命令并通过管道将结果直接传送给包含 read 命令的 while 命令。

    ```
    #!/bin/bash

    count=1    # 赋值语句，不加空格
    cat test.txt | while read line      # cat 命令的输出作为read命令的输入,read读到>的值放在line中
    do
       echo "Line $count:$line"
       count=$[ $count + 1 ]          # 注意中括号中的空格。
    done
    echo "finish"
    exit 0
    ```

## 变量默认值


https://www.cnblogs.com/liuhedong/p/10356411.html#33-%E7%89%B9%E6%AE%8A%E5%8F%98%E9%87%8F

unset url

echo ${url-www.baidu.com}       // 会输出 www.baidu.com

    不支持空值的替换, 或者说空值是有效值

    url=
    echo ${url-www.baidu.com}       // 会输出空


echo ${url:-www.baidu.com}       // 会输出 www.baidu.com




## seq tr

for i in {1..${num}};do     $num 不管用

done



## 多线程

```
for i in {1..254}
do
{
    ping -c1 -W1 192.168.1.$i &>/dev/null  && echo 192.168.1.$ip
}&
done

wait
echo "over"
```
