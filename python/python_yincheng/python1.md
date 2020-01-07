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
    **0.5 是开方
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
    模

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
bool('') False
bool(None) False



## 逻辑运算
and or not

not 结合性:从右往左



if id(a) is id(b):
    print("同一个id地址")


not 优先于 and 优先于 or

print(9>8>7)    -> 9>8 and 8>7
print(9>8<7)    -> 9>8 and 8<7


## None

cmd = None

if cmd:
    print('有对象')
else:
    print('没有对象')

## 判断类型
isinstance(1,(int,float))
isinstance(eval(input("请输入一个数字")),(int,float))


## 语音
control / 轻松使用 / 语音识别 / 文本到语音转换

 微软Windows的Python扩展提供了对Win32 API的访问、创建和使用COM对象的能力以及PythOnWin环境。Pywin32是一个Python库，为python提供访问Windows API的扩展，提供了齐全的windows常量、接口、线程以及COM机制等等。

    ```
    import win32com.client  #系统客户端包
    speaker = win32com.client.Dispatch("SAPI.SPVOICE")    #系统接口

    speaker.Speak("文本内容")
     ```


## 修改内存

     ```
import win32process #进程模块
import win32con #系统定义
import win32api # 
import ctypes   # C语言类型
import win32gui # 界面

# 一个常量，标识最高权限打开一个进程
PROCESS_ALL_ACCESS=(0x000F0000 | 0x00100000 | 0xFFF)

     ```

## while float

     ```
    num = 1.0
    while num != 0:
        print(num)
        #num = round(num - 0.1, 1)
        num -= 0.1
        time.sleep(0.5)
        if num-0 < 10e5:
            num = 0
     ```

## 三元运算
print('hello' if num>5 else 'world')


赌博概率

```
import random
num = random.randint(1,100)
print('win' if num > 60 else 'lose')
```



## 排序




## 闰年
能被4整除，且不能被100整除
能被400整除

普通闰年:公历年份是4的倍数的，且不是100的倍数，为闰年。（如2004年就是闰年）；
世纪闰年:公历年份是整百数的，必须是400的倍数才是世纪闰年（如1900年不是世纪闰年，2000年是世纪闰年）；



## 扑克牌
shuzi = random.randint(1,13)
huaxing = random.randint(1,4)

if huaxing == 1:
    return("红桃")
elif huaxing == 2:
    return("黑桃")
elif huaxing == 3:
    return("方块")
elif huaxing == 4:
    return("梅花")



## 循环穷举法 13x + 8y = 100 股票选股,均为正整数

x = 0
while x < 100//13:
    if (100 - 13*x)%8 == 0:
        print(x)
    x +=1


## 异步模式搞死电脑内存

while True:
    os.system('notepad') # 同步模式，一个程序执行结束，才执行下一个

    os.system("start notepad") # 异步模式




## 金融误差

    ```
    金融误差不能用 等于，而要用 num - 0 < 10e5

    ```




## 猜数字

    ```
    import random

    target =random.randint(1,100)

    num = eval(input("Plz input a num:"))

    while target != num:
        if num > target:
            print("too Big")
        else:                                 ## 这里 else 即可 相等的条件在while处(第一步)
            print("too Small")
        num = eval(input("Plz input a num:"))
    else:
        print("RIGHT")
    ```

for i in range(1,1) 是没有输出的


## range

for i in range(10,1,-1):    # step must be integer
    print(i)

同样不包含右边的 [first,end)



## continue 坑

```
num = 0
while num < 10:
    print(n)
    if num == 3:
        continue
    num += 1

死循环
```
