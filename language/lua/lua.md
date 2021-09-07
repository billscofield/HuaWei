# lua

由 C 编写, 几乎可以在任何平台运行

可以编写游戏辅助脚本

脚本精灵
触摸精灵
触动精灵


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

1. 数值型

    没有 i++
    没有 i+=1

    9/5 == 1.8

1. 逻辑

    ~=  不等于
    ==  等于

    and    如果第一个为true，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    or     如果第一个为false，第二个为表达式的运算结果是一个非布尔型的值，则输出发这个值 print(3<11 and 8)
    not    不是flase 和 nil 的值都是true
        not not

1. 字符串
    单引号或双引号

    ..  连接，链接两个字符串
        print("aaa".."bbb")
        print("123".."456")

        ```
        a=1
        b=2
        print(a..b)         // 输出12
        ```

1. 函数
    定义1
        function 函数名(参数)
        ...
        end
        
    定义1
        函数名=function（参数)
        ...
        end

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
        
        在函数内部用 arg 接收可变参数 arg={不确定参数arg1,不确定参数arg2,...,n=不确定参数个数}
        arg 是 table 数据类型

    实参个数可以少于形参，未传值的形参为nil


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
    function say(num)¬
        if num == 1 then¬
            print(1)¬
        elseif num ==2 then¬
            print(2)¬
        else¬
            print("not known")¬
        end¬
    end¬
    ¬
    ¬
    say(1)¬
    say(2)¬
    say(3)¬


    ---


    function say(num)¬
        if num >= 10 and num <= 20 then¬
            print("[10,20]")¬
        elseif num <=10 then¬
            print("<20")¬
        elseif num >= 21 then¬
            print(">=21")¬
        end¬
    end¬
    ```

2. 循环
    
    1. while ... do ... end

    2. repeat ... until         // 与 do ... while 类似, 但相反

    3. for ... do
        数值 for
            for 变=初始值,终止值,步长 do            // [start,end(default step=1)], step 可以为负数, start,end,step 只识别一次，尽量不要使用变量

        
        泛值 for

    4. for ... in ... do

    5. goto

    6. break

    例题
        1，2，3，4 中取3位数, 每一位都不相等, 3个for, x ~= y and x ~= z and y ~= z

### 作用范围

局部关键字: local


## 函数

1. 输出函数

    print("hello world")



function say()
    local i = 1         // i 有被 local 修饰，是局部变量
    j = 2               // j 是全局变量, 没有被 local 修饰就是全局变量
end
