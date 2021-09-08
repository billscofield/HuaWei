# lua

由 C 编写, 几乎可以在任何平台运行
最快的脚本语言

可以编写游戏辅助脚本

脚本精灵
触摸精灵
触动精灵


## lua & luac

lua文件是源代码，是文本文件，它不利于代码的保护。

luac文件是经lua编译器翻译后的字节码文件，是二进制码文件，可直接分享它以利于源码的保护。

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

## 注释

行注释

    ` --

多行注释
    
    ```
    --[[
    ...
    ...
    --]]
    ```

常量
变量

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
