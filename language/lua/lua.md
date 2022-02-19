# lua

由 C 编写, 几乎可以在任何平台运行
最快的脚本语言

可以编写游戏辅助脚本

脚本精灵
触摸精灵
触动精灵


特点
    1. 轻量级:
        
        编译后仅仅100k左右

    2. 可扩展

应用场景:

    1. 游戏开发
    2. Web 应用
    3. 扩展数据库, 如 Mysql Proxy 和 Mysql WorkBench
    4. 安全系统
    5. nginx+lua 开发高性能 web 应用(kong 网关)

## lua & luac

lua文件是源代码，是文本文件，它不利于代码的保护。

luac文件是经lua编译器翻译后的字节码文件，是二进制码文件，可直接分享它以利于源码
的保护。

luac -o [编译后脚本名] [脚本名]

注意：这种加密是可以逆向的，可以使用unluac等开源项目/工具反编译回lua源码

apt install lua5.3 后已经安装 lua 和 luac

1. luac

    luac is the Lua compiler.  It translates programs written in the Lua
    programming language into binary files containing precompiled chunks that
    can be later loaded and executed.
    
    -s  strip  debug  information  before writing the output file.  This saves
        some space in very large chunks, but if errors occur when running a
        stripped chunk, then the error messages may not contain the full
        information they usually do.  In particular, line numbers and names of
        local variables are lost.



lua5.3-dev
lua5.3-0
lua5.3-0-dbg
    /usr/include/lua5.3/lua.h

vs中
    lua 和 lua-debug

## 注释

行注释

    --

多行注释
    
    ```
    --[[
    ...
    ...
    --]]
    ```

## 关键字

下划线开头的是 lua 的变量, e.g.:
    
    _VERSION    print(_VERSION)

## 交互式

lua -i

## 变量

动态类型, 不需要写类型

作用范围
    1. 全局变量

    2. 局部变量

        哪怕是语句块和函数，也要用 local 声明

    3. 表中的域

    ```
    a = 1
    local b = 2
    function add(numa, numb)
        c = numa + numb
        print(c)
    end
    add(a,b)

    ---

    表类型索引

    []  或  .

    site = {}
    site["key"] = "www.baidu.com"   // site[0] 是错误的引用了
    print(site["key"])
    print(site.key)                 // index 必须是字符串才可以
    ```



nil 同其他语言的 NULL

没有指针

## 8 中基本数据类型

type() 返回字符串

1. nil 空, 仅有一个值 nil

    删除功能

    print(type(x)=="nil") -> true

2. number

    只有一种，都是以 double 类型的, 双精度

    print(type(1))
    print(type(1.2))

3. string

    1. 双引号

    2. 单引号

        可以进行转义
        
        a = 'a\tb'

    3. [[]]

    ```
    string1=[[
    <html>
    <head> </head>
    <body>

    </body>
    ]]
    print(type(string1))
    print(string1)
    ```

    字符串连接: ..  && 数字字符串(+ - x /)
    ```
    s1 = 1
    s2 = 2
    print(s1..s2)           // 字符串连接用 ..
    print(type(s1..s2))     // 字符串连接用 ..
    print(s1 + s2)          // +， 字符串转为数字, 必须为纯数字, 否则报错
    print(type(s1 + s2))    // +， 字符串转为数字, 必须为纯数字, 否则报错
    ```

    ---

    ```
    a = "hell"
    b = "a"
    c = 'a'
    print(a)    hello
    print(b)    a
    print(c)    a
    ```

4. boolean

    true/false

    只有 nil 为假

5. userdata 用户自定义

    先不用

    用于表示一种由应用程序或 c/c++ 语言所创间的类型，可以将任意 c/c++ 的任意数
    据类型的数据(通常是 struct 和指针) 存储到 Lua 变量中调用

    ```
    struct Student{
        string name;
        int age;
    }
    ```

6. function

    可以存在变量里

    ```
    function say(name)
        print("hello "..name)
    end

    say(liming)

    ---

    function say(name)
        print("hello "..name)
    end
    mysay = say
    mysay(liming)


    ```

7. thread

    先不用

    最主要的线程是协同程序(coroutine), 它和线程(thread)差不多, 拥有自己独立的堆
    栈，局部变量和指令指针，可以跟其他协同程序共享全局变量和其他大部分东西

    线程和协程区别:

        线程可以同时多个运行，而协程任意时刻只能运行一个，并且处于运行状态的协
        程只有被挂起(suspend)时才会暂停

8. table
    
    通过构造表达式来完成

    最简单的构造表达式是 {}, 用来创建一个空表, 也可以在表中添加数据，直接初始化表

    创建一个空的表:
        
        > local tb1 = {}

    直接初始化表
        
        > local tb2 = {"apple", "banana", "orange"}
        
        **索引是从 1 开始的**
        table 不会固定长度大小
        没有初始化的表为 nil

        ```
        t1={}
        print(type(t1))
        print(t1)           // 不能这样打印，要用循环

        t1 = {'apple', 'banana', 'orange'}
        for key,value in pairs(t1) do
            print(key.." -> "..value)
        end

        print(t1[1])
        ```

## 特点

1. 赋值

    a,b = 1,2
    a,b = b,a         先计算右边的值，再进行赋值

1. 数值型

    没有 i++
    没有 i+=1

    9/5 == 1.8


1. 字符串
    1. 单引号或双引号

    ..  字符串连接，链接两个字符串, 如果是数字转为了字符串
        print("aaa".."bbb")
        print("123".."456")

        ```
        a=1
        b=2
        print(a..b)         // 输出12
        ```
    2. [[  ]]
        a=[[
            hello
            world
        ]]

    tonumber('11')          // 必须是正常的数字，类似php那样的不行

    tostring(11)


## 迭代器

a = {'a','b','c'}
print(a[1])
print(a[2])

for k,v in pairs(a)
do
    print(k)
end

## 运算符

1. 算数运算符

    二元运算符: + - x / % ^     输出是小数, 只能用于number, 不能用于 string
    一元运算符: + -

    21/10 = 2.1
    21%10 = 1

2. 关系运算符

    ==              值类型必须相同(userdata,table,function, 对象要指向的是同一个对象才行)
    ~=              不等于， 值类型必须相同(userdata,table,function)
    > >=
    < <=

    a={'hello'}
    b={'hello'}
    a ~= b          // true

    print(a)        // 打印a的地址
    
3. 逻辑

    and    如果第一个为true，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    or     如果第一个为false，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    not    不是flase 和 nil 的值都是true, 零也是真, 空字符串也是真
        not not

    and / or 操作数如果是布尔型还返回布尔型, 
    and 只要第一个为真，总是返回第二个值
    or  只要第一个为真，就返回第一个

    type(a)

其它运算符

```
#           长度运算符
#'hello'


.. 字符串连接

取字符串，表的总长度

    s1 = "hello"
    s2 = "world"
    print(#s1)
    print(#s2)
    print(#(s1..s2))
```



1. 函数
    定义1
        function 函数名(参数)
        ...
        end

        ```
        function say(){
            print("hello")
        }
        end

        ---

        local funcation he_cha(a,b)
            he = a + b
            cha = a - b
            return he,cha
        end
        ```
        
    定义2
        函数名=function（参数)
        ...
        end
        
        ```
        myprint = function(params)
            print("打印函数",params)
        end
        
        myprint(10)
        
        local function add(a,b,funcname)
            result = a + b
            funcname(result)
        end
        
        local a = 1
        local b = 2
        add(a,b,myprint)
        
        ```


    定义3
        tab={}
        tab.fun_name=function() ... end
        
    定义4
        tab={}
        function tab.fun_name() ... end

    定义4
        tab={func_name=function() ... end}


    返回值: return, 可以返回多个值
        
        ```
        function say(x,y)
            return x, y
        end
        
        a,b=say(1,4)
        print(a,b)
        ```

    可变参数: 参数个数不固定, 逗号分割
        1. function say(...)            // 三个点表示参数个数不确定
        1. function say(a,b,...)        // 有两个固定参数,三个点表示其他参数个数不确定

        等同于 -> function tab.fun_name(arg={...,n=num}), n是参数个数
        
        在函数内部用 arg 接收可变参数 arg={不确定参数arg1,不确定参数arg2,...,n=不确定参数个数}
        arg 是 table 数据类型

    实参个数可以少于形参，未传值的形参为nil

    ```
    tab={}
    function tab.sum(...)
        local s=0
        local arg = {...}               // 接受不定参数
        for k,v in pairs(arg) do        // arg
            s = s + v
        end
        return s
    end
    ```

    table 元素个数 > #tablename


    a=function (a,b) return a+b end

    function say() print('hello world') end
    a=say
    a()

    select('#', ...)    不定参个个数
    select(N, ...)      第N个不定参

    ```
    function say(...)
        for i=2,select("#",...)
            arg = select(i,...)
            print(arg)
        end
    end
    
    say(1,2,3,4)
    ```


1. 函数的调用

    tab:add(1,2)   --> tab.add(tab,1,2)

    1. 函数名(参数)

    2. tab名.函数名(参数)

    如果只有一个参数(字符串或者表), ()可以省略
        print "hello"




1. 表(table)
    lua语言的核心之一，类似于哈希表
    {}
    类字典

    1. 定义
        a={}
        b={'alice','bob','cil','denny'}     // 数字索引
        c=['alice',num2='number2','cil']    // 混用, 但数字索引还是1，2，3，4 的顺序, 注意第一个是1
                   num2 没有引号
        
        a[数字索引]
        a['key']
        a.key
            数字索引不能使用这种方式

        a= {
            1,              1
            'h',            2
            a1="hello",
            4               3
        }
        
    2. 可以动态的添加值
        a={}
        a['name']='hello'
        a.address='China'
    3. 元素的删除
        赋值为nil即可
        a['name']=nil

    4. 作为数组使用
        
    ```
    array={值1,值2,...}

    array={
        [1]=值1,
        [2]=值2,
        ['-']=值3,
        ...}
    ```

        # 获取元素的数字索引从最小到最大, 不是个数(因为不包含非数字key 个数)
        print(#array1)
        
            for i=1,#array,1 do
                print(array[i])
            end

        增
        array[#array+1] = 'new value'   // 是替换或新增加
        table.insert(数组,键,值)        // 键可以省略,则放在最后一位, 是添加，不是替换
        
        删
        table.remove(数组,key)
        table.remove(数组)              // 删除最后一个元素
        
        排序
        table.soft(table[,fun])
        
1. 自定义类型

1. 线程(thread)

1. 空类型(nil)


1. 结构

    do 
    ...
    end

    do
    local content='hello'
    print(content)          //为什么输出为nil呢???
    end

1. if

    1. 简单形式

    if ...  then
        ...
    else
        ...
    end

    2. 完全形式

    if ... then
    ...
    elseif ... then
    ...
    elseif ... then
    ...
    else
    ...
    end


    ```和函数结合示例
    function say(num)
        if num == 1 then        也可以有(): if (num == 1) then
            print(1)
        elseif num ==2 then
            print(2)
        else
            print("not known")
        end
    end
    
    
    say(1)
    say(2)
    say(3)


    ---


    function say(num)
        if num >= 10 and num <= 20 then
            print("[10,20]")
        elseif num <=10 then
            print("<20")
        elseif num >= 21 then
            print(">=21")
        end
    end
    ```

2. 循环
    
    1. while

        while(condition)        也可以  while xxx
        do
            statements
        end

        ```
        a = 1
        sum = 0
        while(a<11)
        do
            sum = sum + a
            a = a + 1
        end
        ```

    2. repeat ... until         // 与 do ... while 类似, 但相反
        
        repeat
            statements
        until(condition)        // 这个是退出条件...

    3. for ... do
        
        数值 for 循环
            
            for 变=初始值,终止值,步长 do            // [start,end(default step=1)], step 可以为负数, start,end,step 只识别一次，尽量不要使用变量
            for i=1,10 do
                print(i)
            end
        
        

    4. for ... in ... do    end

        泛值型 for 循环
        
        for k,v in pairs(table类型) do
        ...
        end
        
    ```
    list=nil¬
    
    file1="/root/liujiao/lua/a.c"
    
    for line in io.lines(file1) do
        list = { next=list, vlue=line  }
    end
        
    while list do
        print(list.value)
        list=list.next
    end
    ```

    5. goto

    6. break

    例题
        1，2，3，4 中取3位数, 每一位都不相等, 3个for, x ~= y and x ~= z and y ~= z

### 作用范围

代码块: chunk(变量声明的文件或字符串), 控制结构，函数体

局部关键字: local


## 函数

1. 输出函数

    print("hello world")



function say()
    local i = 1         // i 有被 local 修饰，是局部变量
    j = 2               // j 是全局变量, 没有被 local 修饰就是全局变量
end



### 闭包

function out_func(arg)
    local var;
    return function(args)
        // use local var
    end
end

    ```

7. thread
8. table
    
    通过构造表达式来完成

    最简单的构造表达式是 {}, 用来创建一个空表, 也可以在表中添加数据，直接初始化表

    创建一个空的表:
        
        > local tb1 = {}

    直接初始化表
        
        > local tb2 = {"apple", "banana", "orange"}
        
        **索引是从 1 开始的**
        table 不会固定长度大小
        没有初始化的表为 nil

        ```
        t1={}
        print(type(t1))
        print(t1)           // 不能这样打印，要用循环

        t1 = {'apple', 'banana', 'orange'}
        for key,value in pairs(t1) do
            print(key.." -> "..value)
        end

        print(t1[1])
        ```

## 特点

1. 赋值
    a,b=1,2
    a,b=b,a         先计算右边的值，再进行赋值

1. 数值型

    没有 i++
    没有 i+=1

    9/5 == 1.8

1. 逻辑

    ~=  不等于
    ==  等于

    and    如果第一个为true，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    or     如果第一个为false，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    not    不是flase 和 nil 的值都是true, 零也是真, 空字符串也是真
        not not

    and / or 操作数如果是布尔型还返回布尔型, 
    and 只要第一个为真，总是返回第二个值
    or  只要第一个为真，就返回第一个

    type(a)

1. 字符串
    1. 单引号或双引号

    ..  字符串连接，链接两个字符串, 如果是数字转为了字符串
        print("aaa".."bbb")
        print("123".."456")

        ```
        a=1
        b=2
        print(a..b)         // 输出12
        ```
    2. [[  ]]
        a=[[
            hello
            world
        ]]

    tonumber('11')          // 必须是正常的数字，类似php那样的不行

    tostring(11)

1. 算数运算符
    二元运算符: + - * / % ^     输出是小数, 只能用于number, 不能用于 string
    一元运算符: + -

1. 关系运算符
    ==              值类型必须相同(userdata,table,function, 对象要指向的是同一个对象才行)
    ~=              值类型必须相同(userdata,table,function)
    > >=
    < <=

    a={'hello'}
    b={'hello'}
    a ~= b          // true

    print(a)        // 打印a的地址
    

1. 函数
    定义1
        function 函数名(参数)
        ...
        end
        
    定义2
        函数名=function（参数)
        ...
        end
        
    定义3
        tab={}
        tab.fun_name=function() ... end
        
    定义4
        tab={}
        function tab.fun_name() ... end

    定义4
        tab={func_name=function() ... end}


    返回值: return, 可以返回多个值
        
        ```
        function say(x,y)
            return x, y
        end
        
        a,b=say(1,4)
        print(a,b)
        ```

    可变参数: 参数个数不固定
        1. function say(...)            // 三个点表示参数个数不确定
        1. function say(a,b,...)        // 有两个固定参数,三个点表示其他参数个数不确定

        等同于 -> function tab.fun_name(arg={...,n=num}), n是参数个数
        
        在函数内部用 arg 接收可变参数 arg={不确定参数arg1,不确定参数arg2,...,n=不确定参数个数}
        arg 是 table 数据类型

    实参个数可以少于形参，未传值的形参为nil

    ```
    tab={}
    function tab.sum(...)
        local s=0
        for k,v in ipairs(arg) do
            s=s+v
        end
        return s
    end
    ```


    a=function (a,b) return a+b end

    function say() print('hello world') end
    a=say
    a()


1. 函数的调用

    tab:add(1,2)   --> tab.add(tab,1,2)

    1. 函数名(参数)

    2. tab名.函数名(参数)

    如果只有一个参数(字符串或者表), ()可以省略
        print "hello"




1. 表(table)
    lua语言的核心之一，类似于哈希表
    {}
    类字典

    1. 定义
        a={}
        b={'alice','bob','cil','denny'}     // 数字索引
        c=['alice',num2='number2','cil']    // 混用, 但数字索引还是1，2，3，4 的顺序, 注意第一个是1
                   num2 没有引号
        
        a[数字索引]
        a['key']
        a.key
            数字索引不能使用这种方式
        
    2. 可以动态的添加值
        a={}
        a['name']='hello'
        a.address='China'
    3. 元素的删除
        赋值为nil即可
        a['name']=nil

    4. 作为数组使用
        
    ```
    array={值1,值2,...}

    array={
        [1]=值1,
        [2]=值2,
        ['-']=值3,
        ...}
    ```

        # 获取元素的数字索引从最小到最大, 不是个数(因为不包含非数字key 个数)
        print(#array1)
        
            for i=1,#array,1 do
                print(array[i])
            end

        增
        array[#array+1] = 'new value'   // 是替换或新增加
        table.insert(数组,键,值)        // 键可以省略,则放在最后一位, 是添加，不是替换
        
        删
        table.remove(数组,key)
        table.remove(数组)              // 删除最后一个元素
        
        排序
        table.soft(table[,fun])
        
1. 自定义类型

1. 线程(thread)

1. 空类型(nil)


1. 结构

    do 
    ...
    end

    do
    local content='hello'
    print(content)          //为什么输出为nil呢???
    end

1. if

    1. 简单形式
    if ...  then
        ...
    else
        ...
    end

    2. 完全形式
    if ... then
    ...
    elseif ... then
    ...
    elseif ... then
    ...
    else
    ...
    end


    ```和函数结合示例
    function say(num)
        if num == 1 then
            print(1)
        elseif num ==2 then
            print(2)
        else
            print("not known")
        end
    end
    
    
    say(1)
    say(2)
    say(3)


    ---


    function say(num)
        if num >= 10 and num <= 20 then
            print("[10,20]")
        elseif num <=10 then
            print("<20")
        elseif num >= 21 then
            print(">=21")
        end
    end
    ```

2. 循环
    
    1. while ... do ... end

    2. repeat ... until         // 与 do ... while 类似, 但相反

    3. for ... do
        数值 for
            for 变=初始值,终止值,步长 do            // [start,end(default step=1)], step 可以为负数, start,end,step 只识别一次，尽量不要使用变量

        
        泛值 for

    4. for ... in ... do
        for k,v in ipairs(table类型) do
        ...
        end
        
    ```
    list=nil¬
    
    file1="/root/liujiao/lua/a.c"
    
    for line in io.lines(file1) do
        list = { next=list, vlue=line  }
    end
        
    while list do
        print(list.value)
        list=list.next
    end
    ```

    5. goto

    6. break

    例题
        1，2，3，4 中取3位数, 每一位都不相等, 3个for, x ~= y and x ~= z and y ~= z

### 作用范围

代码块: chunk(变量声明的文件或字符串), 控制结构，函数体

局部关键字: local


## 函数

1. 输出函数

    print("hello world")



function say()
    local i = 1         // i 有被 local 修饰，是局部变量
    j = 2               // j 是全局变量, 没有被 local 修饰就是全局变量
end



### 闭包

function out_func(arg)
    local var;
    return function(args)
        // use local var
    end
end



## 字符串函数

local string = require("string")

str1 = "abcdDE"
str2 = string.lower(str1)
str2 = string.upper(str1)



.gsub(str,x,y,COUNT)    将str 中的 x 替换为 y, 替换 COUNT 次, 返回新的字符串



string.find (s, pattern [, init [, plain]])

    Looks for the first match of pattern (see §6.4.1) in the string s. If it finds
    a match, then find returns the indices of s where this occurrence starts and
    ends; otherwise, it returns fail. A third, optional numeric argument init
    specifies where to start the search; its default value is 1 and can be
    negative. A true as a fourth, optional argument plain turns off the pattern
    matching facilities, so the function does a plain "find substring" operation,
    with no characters in pattern being considered magic.

    If the pattern has captures, then in a successful match the captured values
    are also returned, after the two indices.


.reverse()      反转，返回新的字符串


.format(str, )  格式化函数

```
    str1 = "number is %d"

    str2 = string.format(str1,4)

    print(str2)

    ---

    str1 = "number is %d"

    print(string.format("res is %4d",3))

```


.char(97)       // 数字转换为 ascii


.byte("xyz",n)  // n 是索引

    print(string.byte("ABCDE",1))


.len(arg)       // 长度


.rep(str,N)         // 重复多少次
    print(string.rep(a,2))


.gmatch(str,pattern)        // 匹配, 返回迭代器
    
    ```
    a = "hello world"
    for i in string.gmatch(a,"%a+")do
        print(i)                            // 输出所有单词
    end
    ```


+       一次或多次
x       0次或多次
?       0或1次


%a      letter
%c      任何控制字符, 如 \n
%d      数字
%l      小写字母
%u      大写字母
%p      标点
%s      空白字符

%w      字母/数字
%x      16进制数字




string.match(str,pattern,n)



## 表中的方法

连接

    table.concat(表名)
    table.concat(表名,',')      指定连接符号
    table.concat(表名,',',start,end)


添加
    table.insert

    table.insert(表名,'item')
    table.insert(表名,INDEX,'item')


删除

    table.remove(表名)          // 默认删除最后一个
    table.remove(表名,index)    // 默认删除最后一个, index 会重新排序


表排序
    
    table.sort(表明)
    table.sort(表明,排序函数)



## 模块

Lua 从 5.1 开始, 加入了标准的模块管理机制,可以把一些共用的代码放在一个文件里,以
API 接口的形式在其他地方调用,有利于代码的重用和降低代码耦合度

Lua 模块是由变量, 函数等已知元素组成的 table, 因此创建一个模块很简单,就是创建一
个 table, 然后把需要导出的常量,函数放入其中, 最后返回这个 table 就行了


文件名要和表名相同

```
---文件名  module.lua

---定义一个名为 module 的模块

module = {}

---定义一个常量
module.name = "这是一个常量"

---定义个函数
function module.func1()
    io.write("这是一个共有函数!\n")
end

local function func2()          // 稀有不能通过 模块访问
    print("这是一个私有函数")
end

function module.func3()
    func2()
end


return moudule                  // 注意

```


```
#!/usr/bin/env lua
require ("模块名")    或者   require "模块名"

print(module.name)
module.func1()
module.func3()


还可以这样:
local mo = require ("模块名")
```



## NSE 脚本引擎

后缀直接修改为 nse

nmap 

    -sC 来激活 nse 脚本引擎, 使用默认脚本进行探测
        /usr/share/nmap/scripts/

    --script  具体脚本来进行某一具体内容的探测


### NSE 功能

网络发现

复杂版本信息发现

漏洞发现:

    NSE 脚本可以拓展漏洞发现的功能

后门发现:

    NSE 脚本可以拓展后门发现的功能

漏洞攻击
    
    NSE 脚本可以漏洞攻击的功能


### 案例

使用默认脚本对目标进行探测
    nmap -sC -p21,22 -T4 目标

使用具体的脚本
    nmap -p21 --script ftp-vsftpd-backdoor 目标

--script-args=
--script-args-file
    来自定义一些脚本的参数


--script-help
    显示脚本的使用方法和功能
    nmap --script-help daytime

--script-trace
    调试和开发脚本

    nmap -sC -p80 --script-trace 目标

--script-update
    更新脚本库




使用脚本扫描通常需要组合端口扫描, 因为脚本是否会被执行取决于目标对应端口的状态.

使用 -sn 只进行主机发现,并不进行端口扫描. 这意味着在这种情况下,只有 hostrule(函
数) 脚本会被执行

在运行脚本扫描时, 使用 -Pn -sn  -sC/--script : 既不进行主机法系那, 也不进行端口扫描
    -Pn: 假设主机存活
        应该是传输层之下的技术

    -sn: (No port scan)
        This option tells Nmap not to do a port scan after host discovery, and
        only print out the available hosts that responded to the host discovery
        probes.

        ping, icmp, traceroute

    端口没有开启,就不进行了


多个脚本用逗号隔开

    nmap --script http-title, http-methods 目标


## NSE 脚本分类(https://nmap.org/nsedoc/categories/auth.html)

1. auth             认证相关的脚本

2. broadcast        使用广播手机网络信息

3. brute            暴力破解

4. default          使用默认脚本进行探测 --script default

5. discovery        主机和服务发现相关的脚本

6. dos              拒绝服务

7. exploit          利用安全漏洞 的脚本

8. external         适用于第三方服务的脚本,通过第三方获取

9. fuzzer           模糊测试

10. intrusive       入侵脚本

11. malware         与恶意软件检测相关的脚本

12. vuln            与检测和利用安全漏洞相关的脚本, 检查特定的漏洞,如果发现,通常只是报告结果

13. version         版本检测特性的扩展,不能显示选择,只有在请求版本检测(-sV) 时,才选择运行他们

14. safe            在所有情况下默认为安全的脚本



脚本中的  categories 表数据格式


### 1. NSE引擎执行流程

Nmap的扩展脚本语言都基于lua来开发的，执行也是调用了内部封装的lua解释器。

正常情况下，调用任何一个扩展脚本会首先执行nse_main.lua，该脚本主要做了以下几件事：

    1. 加载一些Nmap的核心库（nselib文件夹中）
    2. 定义多线程函数
    3. 定义输出结果处理函数
    4. 读取、加载扩展脚本
    5. 定义扩展脚本函数接口
    6. 执行扩展脚本
    7. ……


### 2. /usr/share/nmap/nse_main.lua 最先执行


在nse_main.lua的 67 行左右，定义了一些规则

local NSE_SCRIPT_RULES = {¬
  prerule = "prerule",¬
  hostrule = "hostrule",¬
  portrule = "portrule",¬
  postrule = "postrule",¬
};¬

每一个规则代表了函数，由函数的返回值决定执行流程

1. prerule
    在扫描任何主机之前，prerule函数运行一次

2. hostrule
    在扫描一个主机后运行一次

3. portrule
    在扫描一个主机的端口后运行一次

4. postrule
    在全部扫描完毕以后运行一次

也就是说，prerule和postrule是在开始和结束运行，并且只运行一次，hostrule是扫描一
个主机就运行一次，有N个主机就会运行N次，portrule是扫描到一个端口就运行一次，有N
个端口就运行N次。



/usr/share/nmap/scripts/test.nse

内容如下：

```
prerule=function()
    print("prerule()")
end

hostrule=function(host)
    print("hostrule()")
end

portrule=function(host,port)
    print("portrule()")
end

action=function()
    print("action()")
end

postrule=function()
    print("postrule()")
end
```

    使用nmap扫描一个主机调用这个脚本看看执行效果：



### NSE 选取

    ```
    nmap --script default,safe 目标

    nmap --script /root/custom/scripts/ 目标        // 使用这个目录下的所有脚本进行探测

    nmap --script smb-os-discovery 目标

    nmap --script "http-*"  目标                    // 通配符

    namp --script "default or safe"                 // 在 default 或者 safe 类别中的脚本

    namp --script "default and safe"                // 在 default 中,也在 safe 中的脚本

    namp --script "(default and safe) and not http-*"                // 在 default 中,也在 safe 中的脚本

    ```


### NSE 脚本格式

NSE 脚本包含
    1. **几个描述性字段**,
    2. 一个定义何时执行脚本的规则,
    3. 以及一个包含实际脚本指令的操作函数 action

可以将值分配给描述性字段,规则,函数,就像分配其它 Lua 变量一样. 他们的名字必须是
小写的


description = [[   ]]                   // 描述性字段

author = "xxx"

license = "xxx"

dependencies = {"smb-brute"}            // 依赖表是可选的
categories = {"discovery","safe"}

portrule = shortport.http               // 何时执行脚本的规则

action = function(host,port)            // 实际的指令
...
end



nmap 使用脚本规则(rule) 来确定是否应该针对目标运行脚本
    规则是一个 Lua 函数, 返回 true 或 false
    只有当返回 true 时,材质行脚本



prerule()
hostrule(host)
portrule(host,port)
postrule()


action 是 nse 的核心
action 的返回值可以使 key-value对, 字符串或者 nil 的表



### NSE 环境变量

SCRIPT_PATH         脚本路径
SCRIPT_NAME         脚本名称,常用来进行调试
SCRIPT_TYPE         哪个规则激活了脚本


dns-zone-transfer

stdnse.debug3("Skipping '%s' %s, 'dnszonetransfer.domain' argument is missing.", SCRIPT_NAME, SCRIPT_TYPE)



### neslib

/usr/share/nmap/nselib

    local comm = require "common"       // local 防止命名冲突

    https://nmap.org/nsedoc/ 看这些比较快一些

daytime.nse

    https://nmap.org/nsedoc/ 

    portrule = shortport.port_or_service(13, "daytime", {"tcp", "udp"})

    action = function(host, port)¬
        return oops.output(comm.exchange(host, port, "dummy", {lines=1}))¬
    end¬

    查看 nselib/shortport
    
        port_or_service = function(ports, services, protos, states)¬
          return function(host, port)¬
            local port_checker = portnumber(ports, protos, states)¬
            local service_checker = service(services, protos, states)¬
            return port_checker(host, port) or service_checker(host, port)¬
          end¬
        end¬

    portnumber
    service




### Dedecms 后门漏洞复现




os.time()
