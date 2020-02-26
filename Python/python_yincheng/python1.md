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
keyword.iskeyword('lambda')
keyword.iskeyword('del')


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

+:显示正负号
-:仅显示负号

'{name} {age}'.format(name='liujiao',age=20)


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
round(实数,小数位=0)
    小数位默认0位

    ```
    元:int(输入)
    角:round(输入*10 ) % 10
    分:round((输入 * 100 )) % 10
    print("{yuan} 元\n {jiao} 角 \n {fen} 分".format(yuan=yuan,jiao=jiao,fen=fen))
    ```

random.randint(a,b)     #[a,b]
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



瀑布式


质数(只能分解为1×n)
0 和 1 不是质数
2 和 3 是质数


函数类
class 'function'


禁止创建进程
指向了异常的函数地址(应该是系统函数)


## None

    ```
    def say():
        print('hi')

    def say():
        print('hi') 
        return
    
    两者都是返回None
    ```


## 函数返回值作为参数

```
def max(n1,n2):
    max_num = n1
    if n2 > n1:
        max_num = n2
    return max_num

max(max(1,4),max(4,10))

```

## nonlocal 引用外层

```
num = 1

def test():
    num = 10
    def testin():
        nolocal num         ## 引用外层变量 global是引用全局变量
        num = 100
        print('testin:',num)
    testin()
    print('test:',num)

test()

---

def test():
    num = 10
    def testin():
        num = 100
        print('testin:',num)    # 此时num为新的变量，和外层的num不一个id. 不曾存在的变量会新建
    testin()
    print('test:',num)

test()

```

type(print)
    -> 'builtin_function_or_method'
print(id(print))

内置函数 = say, 此时 type(内置函数) 就是 普通function 了


## 劫持

```
def say(str):
    if str.find('liujiao') != -1:
        os.system('echo ' + str)
    else:
        pass

print = say

print('')

print 是无辜程序
say 是劫持程序

---



import os
backossystem = os.system

def check收费(mystr):
    if mystr.find('已收费') != -1:
        backossystem(mystr)
    else:
        print("请交保护费")

os.system = check收费
```


## 函数参数
位置参数在左边，关键字参数在右边
不能重复赋值

混合时不能交叉  

```
def say(a,b,c,d):
    print(a,b,c,d)

say(1,2,c=3,4) # 错误

---

def say(a,b,c=3,d=4):
    print(a,b,c,d)

say(1,2,c=33,44)    # 错误

SyntaxError: positional argument follows keyword argument
位置参数不能在关键字参数之后

```

## 真正的匿名 调用方式
(lambda x,y:x**y)(2,10)
(lambda mystr:print(mystr))('helo')



## 类

函数实现了代码的重用
类实现了 数据、代码的重用

self 指代了 实例，只能在类的方法中使用，因为不能通过类直接去调用某个实例

```
class Person():
    def __init__(self,name):
        print("initial",id(self))
        self.name = name
    self.name = 'helo'




class Person():
    name = '人类'
    def __init__(self)
        print(self.name)    ## 可以

    **属性可以放在 方法 外部，但一般放在方法内部**
```



## tkinter

import tkinter
mytk = tkinter.Tk()     # TK 是一个类，tk()构造函数
mtk = tkinter.title('hello')
mtk.geometry("100x600+100+0")   # 宽度x高度+x+y (相对于屏幕左上角)
mtk.mainloop()



## 动态增加属性，方法

xiaoming.name = 'xiaoming'
xiaoming.go = lambda name:print(name, ' is going ')

**动态增加不能使用 self**



### 重载
class abc:
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def show(self):
        

    def __add__(self,other):    # 重载的含义就是针对本类型，对于 + 重新解释
        self.x += other.x    
        self.y += other.y    

        
a = abc(1,2)
a.show()
b = abc(3,5)
a.show()

a + b

--- 返回值

def __add__(self,other):
    return abc(self.x+other.x, self.y+other.y)  ## 返回一个新的对象

a.__add__(b)    ==  a + b


--- 重载类和int类型的加法
class abc:
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def __add__(self,num):
        return abc(self.x+num,self.y+num)   ## 返回一个对象

a = abc(1,3)
aa = a + 10
print(aa.x,aa,y)


--- 结合

class abc:
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def __add__(self, other):
        if type(other) == type(self):   ## 或者 if isinstance(other,abc):
            return abc(self.x+other.x, self.y + other.y)
        elif isinstance(other,int):
            return abc(self.x + other, self.y + other)
        else:
            pass

a = abc(1, 2)
b = abc(2, 5)
A = a + b

B = a + 10

print(A.x,A.y)
print(B.x,B.y)



### 类的深浅拷贝

class A:
    def __init__(self,x,y):
        self.x = x
        self.y = y


a = A(1,2)
b = a       ## 这是浅拷贝
print(id(a) == id(b))



b = A(a.x,a.y)  这是深拷贝
print(id(a) == id(b))


----

### 函数参数 副本机制

num = 1
print(id(num))      ## 400800   main
def add(num):
    print(id(num))  ## 300500   first in
    num = 10
    print(id(num))  ## 200400   second in

say(100)            ## 当这个为10时， first in 和 second in 的id才一样

print(id(num))      ## 400800   main





## 类的私有属性

```
class Person:
    def __init__(self,__money):
        self.__money = money
    
    def show(self):
        print(self.__money)

a = Person(1000)
a.show()

a.__money = 100
a.show()        # 还是1000
print(a.__money)    # 输出100

```


变量或属性存在，引用，不存在动态绑定
有引用，无绑定


```
class Bank:
    def __init__(self,name,password, money):
        self.name = name
        self.__password = password
        self.__money = money

    def cun(self,money):
        self.__money += money

    def qu(self, money):
        if eval(input("Password:"))==self.__password:
            if money <= self.__money:
                print('取款成功,余额是%d'%(self.__money - money))
            else:
                print('余额不足')
        else:
            print('wrong password')


a = Bank('a',123,1000)
a.qu(1)


私有属性原理

print(dir(a)) 发现有一个_Bank_money (_类名__私有属性)    私有方法也是一样

直接修改这个值，是可以的

```


## chardet

with open('a.txt','r') as f:
    s = f.read()
    print(chardet.detect)
    ## 输出结果为:
    ##{'encoding':'GB2312','confidence':0.99}
    
    #newdata = s.decode('gb2312')

with open('newfile','w') as f
    f.wirte(newdata)




## 发送短信

1. 互亿无线
1. 阿里大于



## 发送邮件

import smtplib
from email.mime.text import MIMEText

SMTPServer = "smtp.163.com"
sender = 'sender@163.com'
password = '123'
text = "hello python"

message = MIMEText(text)
message['Subject'] = '主题'
message['From'] = sender
message['To'] = 'abc@126.com'

mailserver = smtplib.SMTP(SMTPServer,25)
mailserver.login(sender,password)
mailserver.sendmail(sender,['抄送1','抄送2'],message.as_string())
