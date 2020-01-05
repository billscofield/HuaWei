解释性语言：先编译再执行,最具交互性

// 整除     1//3==0         有一个是实数，结果就是实数
/  小数除   1/3=0.33333     有一个是实数，结果就是实数


语法错误 SyntaxError
运行错误 5/0 ZeroDivisionError
逻辑错误 



taskkill /f /m mspaint.exe
shutdown -s -t 5
shutdown -r -t 5


import keyword  //关键字
keyword.kwlist
keyword.iskeyword('with')

    del 是关键字


常量表



int, float, bool, str, tuple, list, dict, complex(复数)


交互式类型转换用 eval()
eval arg must be a string, bytes or code object
eval(1) wrong


拆分多行
    print(1+2+
        3+4)    //这个不用转义


    ```
    **0.5 是开放
    8**(1/3)

    num**3
    ```

10 % -3


round 四舍五入
    round(-3.4) ->-3
    round(-3.6) ->-4

    ```
    100%9  == 100 - 100//9*9
    ```

## 数学函数
max
min
abs
pow
math.sqrt
math.sin()


print(help(math.pow))

print(1,2,3,sep='!',end='END')

ord('a')
chr(65)

a 65
z 90

'\u十六进制'
    '\u6211' -> 我

## format函数
format(value, format_spec='', /)
print(format(2,'10.2'))     右对齐
print(format(2,'<10.2'))    左对齐


## 进制
二进制      print(0b10)
八进制      print(0o10)
十六进制    print(0x10)


一个数 %N 范围是 [0,N-1]
    比如5,6,7,8,9 10
    %5


生成随机字母
    摸

    ```
    根据时间来生成随机字母
    import time

    for i in range(100):
        temp = time.time() * 10**7
        target = int(temp % 26)
        print(chr(ord('A')+target),end=' ',flush=True)
        time.sleep(0.2)
    ~
    ```


元角分
round(实数,小数位)
    小数位默认0位

    ```
    元:int(输入)
    角:round(输入*10 ) % 10
    分:round((输入 * 100 )) % 10
    print("{yuan} 元\n {jiao} 角 \n {fen} 分".format(yuan=yuan,jiao=jiao,fen=fen))
    ```

random.randint(a,b) [a,b]
random.random() [0,1)
random.randrange(start,stop=None,step=1)    [start,stop)



## 关系运算符 - 字符串

ord('a'):97
ord('0'):48
ord('1'):49

主要用于排序



bool('0') True
bool(' ') True



逻辑运算
and or not

