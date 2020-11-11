吸取了ABC语言的精华，ABC语言太封闭了,没有发展好
1991年
python3 发布于2008年
python3.5 发布于2015年
python2.7被定为最后一个python2.X版本
pythonclock.org

## python解释器 如今有多个语言的实现
1. CPython      
1. Jython
1. IronPython   : .net 和 Mono平台
1. PyPy         : Python实现的，支持JIT即时编译


ctrl + d 退出交互式解释器
exit()
quit()


ipython interactive
支持自动补全
支持 bash shell 命令

## IDE pycharm

1. 调试器（断点/单步执行）
1. 跨平台
1. 适合大型项目的管理
1. 配置信息文件
    ~/.PyCharmXXX
        config
            pycharm.key
1. 如果要恢复默认设置
    rm -rf ~/.PyCharmXXX
    并要求重新输入注册信息
1. .idea 文件夹下保存了当前项目的解释器版本，项目包含的文件等相关信息
1. 第一次运行，要在导航窗口右键运行
1. 设定使用的python解释器版本
    file/settings/当前项目/Project Interpreter/选择路径
1. 字体
    file/settings/


1. tar.gz 安装
    移动到/opt/目录
    cd /opt/pycharm/bin
    ./pychar.sh 运行
    
    设置图标
        cmd启动pycharm
        tool/create desktop entry (create for everyone)
    
文件名：小写字母，数字和下划线，最好不要以数字开头

教育版功能少很多

卸载PyCharm
    1. 快捷方式地址
        /usr/share/applications/jetbrains-pycharm.desktop
    1. 家目录下的配置文件目录   /home/.Pycharm版本号
    1. /opt/pycharm 目录


注释
1. # 后边有一个空格
1. """  """

PEP(Python Enhancement Proposals)
其中第8篇文档专门针对python的代码格式给出了建议，也就是俗称的PEP 8Proposals
    一行不超过80个char

## 算数运算符
1. +
1. -
1. *    可以用于字符串
1. /
1. //取整除 9//2 得到4
1. %
1. **


## 程序执行原理
1. 三大件
    1. CPU
    1. RAM
    1. 硬盘

python解释器 大小只有3.4MB
    which python
    pythone3.7  4.7M


## 数据类型

number  int,float
    python2 中还有long,python3 中只有int   type(2 ** 64)
    333L(a=22L 在Python3中报错,在Python2中正常)
    a=2E10  (1024.0)
bool
    True:非零数 算数运算中为1
    False: 算数运算中为0
complex 复数

tuple 元祖
list
dictionary
str
    + 
    *
    ""  建议用""
    ''

    str 和 num只有乘法,
    算数最终的运算要转换为数字运算

    两个及以上字符串 空格 自动拼接 但是两个str变量是不会自动拼接的
        "ni" "hao" "ma" 返回"nihaoma"
    多个变量或str  "," 返回tuple
        a = "hello"
        a,5,"world"     返回('hello',5,'world')



    .index
        没有则报错
    .count
        没有不报错，为0
    len

    .isspace()      全部为空白字符

    .isalnum()      至少有一个字符，且所有字符为 字母 或 数字
    .isalpha()      至少有一个字符，且所有字符为 字母 

    .isdecimal()    只包含数字
        只能判断单纯的阿拉伯数字
        不支持小数

    .isdigit()      只包含数字
        unicode码'\u00b2'  也可以
        不支持小数

    .isnumeric()    只包含数字  only numeric
        支持中文数字: "一千零一"
        '\u00b2'
        不支持小数


    三者的区别:
        isdigit()
        True: Unicode数字，byte数字（单字节），全角数字（双字节），罗马数字
        False: 汉字数字
        Error: 无

        isdecimal()
        True: Unicode数字，，全角数字（双字节）
        False: 罗马数字，汉字数字
        Error: byte数字（单字节）

        isnumeric()
        True: Unicode数字，全角数字（双字节），罗马数字，汉字数字
        False: 无
        Error: byte数字（单字节）

        b"1" # byte
        https://www.cnblogs.com/jebeljebel/p/4006433.html



    .istitle()      每个单词的首字母大写    忽略数字，"Hello 5You" 返回True,数字被忽略，认为没有,"Hello 5you" 返回False
    .islower()
    .isupper()

    .swapcase()

    .startswith(str)
    .endswith(str)      //True or False


    .isprintable()      //tty file, drive file

    .expandtabs(tabsize=Num)    //tab键变成多少个空格

    .find(str,start=0,end=len(string))
    .rfind(str,start=0,end=len(string))
        **没有不会报错，返回-1**
        而.index会报错

    .index(str,start=0,end=len(string))
    .rindex(str,start=0,end=len(string))

    .replace(old_str,new_str,num=string.count(old))
        返回一个新的字符串,不会修改原字符串


    .format()

    .format_map(字典)
    "{name} {age} {gender}".format_map({'name':'liujiao','age':30,'gender':'man'})


    to_print = "{name} is {age} years old"
    stu_zhangsan = {'name':'zhangsan','age':30}
    to_print.format_map(stu_zhangsan)

    
    .isidentifier()     //是否是合法的标识符


    delimiter.join(序列)    //这个序列必须使字符串的
        '='.join(['1','2','3'])
        '='.join(('1','2','3'))

文本对齐
    .ljust(width,fillchar=" ")  字符串在左边，填充在右边
    .rjust(width,fillchar=" ")  字符串在右边，填充在左边
    .center(width,fillchar=" ")
        默认英文空格


    .zfill(count)   //左边补0

去除空白字符
    .lstrip(char=" ")
    .rstrip(char=" ")
    .strip(char=" ")

拆分和连接
    .split(str="空白符",num)    //返回list
    string.join(seq)    string作为分隔符

    .splitlines()   //.split(\n)   或者 .split(\r) 根据系统定


    .maketrans()
        table = str.maketrans('abc','123')
        'aAbBcC'.translate(table)


文本总是 unicode, 由str 表示，
二进制数据则由 bytes 类型表示
python3 不会以任意隐式的方式混用 str 和 bytes


    字符串.capitalize()     //Aabcdef
    

    ```
    '好'.encode('utf-8')
    '好'.encode('utf8')
        输出   b'\xe5\xa5\xbd'

            --->  string  ---
      decode|               |encode
            |               |
            ----  bytes  <---

    print('你好'.encode('utf8').decode('utf8'))
               要转换成什么编码         你原来是什么编码格式
    **socket 编程时必须全部转换为 二进制形式**

    .encode()   默认utf8(python2 中默认用系统的，这个可以看函数的定义)




    ________________________________
    |                               |
    |            Unicode            |
    |_______________________________|
        |   |               |   |
        |   |               |   |
        |   |               |   |
    ___________         _____________
    |          |        |           |
    |  UTF-8   |        |  GBK      |       bytes
     __________         _____________

    '你好'.decode('utf8').encode('gbk')



    u'你好'     //unicode, python中默认就是这个, 而不是utf8

    文件编码
    string encoding
        #coding:gbk
        Defining Python Source Code Encodings
        python3 都是unicode
    
    ```

3.x去掉了 unicode类型 和 unicode()函数，（也就没有u'xxx'这种写法了），区分出str类型和bytes类型，而且str不再同时有encode和decode方法，bytes只有decode，str只有encode


不同的国家和地区制定了不同的标准，由此产生了 GB2312, BIG5, JIS 等各自的编码标准。
这些使用 2 个字节来代表一个字符的各种汉字延伸编码方式，称为 **ANSI** 编码。
在简体中文系统下，ANSI 编码代表 GB2312 编码，在日文操作系统下，ANSI 编码代表 JIS 编码。


type()

input()
    name = input("ur name")

int()
    没有long(python2)
float()
    没有double
bool()

## 格式化输出
%s
%d
%f
%%
%x  十六进制

print("%4.2f" % 3.2)
    一共4位，不足会补齐，超过没关系，该怎么显示就怎么显示
    两位小数

print("%.2f" % 3.2)

print("%.2f%%" % 90.2)  90.20%  转换为百分数后保留2位小数

print("%05d" % 1)

标识符区分大小写


### format 方法

"{name} {age} {gender}".format(name="liujiao",age="30",gender="man")

"{0} {1} {0}".format(name="liujiao",age="30",gender="man")

print(format(2,'10.2'))

### .format_map(字典)


## if

if CONDITION:
    do
elif:
    do
else:
    do

    ```
    age = 20
    if age>18:
        print("hello")

        print("hello")
    ```

    ```
    a = 20 
    if 0<a<30:
        print("ok")

    ```

    ```
    if not True:
        print("True")
    else:
        print("False")
    ```

elif 是平级
if嵌套不是平级

    ```

    if (() 
            or () 
            or ()):
        
        do1
        do2
    ```

import random
random.randint(1,10)    [a,b]   a<=b
random.random()     (0,1)

## 三大流程
顺序
分支
循环


没有 ++ 、 --

+=
-=
*=
/=
//=
%=
**=


print( "*", end="" )
    默认是换行，此处将换行替换为自定义的


print("\r")
print("\n")
print("")


函数必须先定义，再使用(解释性语言)

F8  Step Over 不会进入到函数内部，
F7  Step Into 会进入到函数内部

函数定义上面保留两行


def fun(a,b):
    """
    程序注释
    :param a: 参数说明
    :param b: 参数说明
    """


模块中的变量，函数都可以访问到

pyc c:compiled 编译过
    __pycache__下面是编译过的文件，cpython编译器
    被import的文件就会被编译
    我 __pycache__的virtualenv 是在 import 文件夹下

## list 列表

其他语言中叫数组

.sort()  升序
.sort(reverse=True) 降序
    .sort(self,key=None,reverse=False)
以上两个返回 None

sorted(元素) 返回list

reversed(元素)  返回迭代器对象

---

.reverse()  逆序

.index(self,object,start,end)   [)
    没有找到会报错

不能访问不存在的元素，不能修改不存在的元素
    a = [1,2,3]
    a[3] = 8 //wrong

---
.append(object)
    .append([1,2])
        会将[1,2]当做一个元素

.insert(index,object)
    insert object before index

.extend()
    原地修改
    .extend([11,22])
    会将[11,22]打散，
    同 + *
---

a.remove()  相当于del，返回 None
    remove first occurrence of value
    **不存在会报错**

a.clear()
    remove all items from list

a.pop()
    pop(self)   默认最后一个元素
    pop(self,index)
        删除并返回指定index的元素
        **pop 是唯一既修改列表又返回一个非 None 值的列表方法。**

del(a[n])
    本质上是将一个变量从内存中删除
    不存在报 "index out of range 错误"

---
len(X)
.count()

---

import keyword
print(keyword.kwlist)   关键字
    关键字不需要括号


迭代遍历列表
    for i in iteration:
        print("%s" % i)


tuple 通常用于存储不同类型的数据
list  通常用于存储相同类型的数据


空元祖  ()
tuple 中只有一个元素时，要加","
    a = ("li",)

tuple.count
tuple.index

info = ("zhangsan",18)
print("%s is %d years old" % info)
    格式字符串的本质就是tuple

info_str = "%s 的年龄是 %d " % ("lisi",18)
----

range(10)   [)


### 字典 dict
存储无序的对象的集合
键:值
键值对,键值对
{}
键只能是str,num,tuple

info = {"name":"xiaoming",
        "age":30,
        "gender":"boy",
        "height":174
        }
1. 创建字典
    dict.fromkeys(序列，Default=None)

1. 取值
    dicta["key"]
        没有会报错
    .keys()
    .values()
    len(dicta)   键值对的数量

    dict.get('key')     //没有也不会报错

    key in 字典         //返回 True 或者 False

    .items()            //返回元祖列表
        
    ```
    for i,j in dictA.items():
        print(i,' : ',j)

    for i in dictA:
        print(i,' : ',dictA[i])
    ```

1. 增
    dicta["key"]=value
    有就是修改

    .setdefault(key,default=None)
        如果存在，则返回
        如果没有，则增加

1. 改
    dicta["key"]=value

1. 删
    dicta.pop("key")
        key不存在报错
        返回值
    dicta.pop("key",default)
        key不存在返回default
    dicta.clear()

    dicta.popitem() 随便删掉一个

    del()

1. 合并
    dicta.update(dictb)
        重复key取覆盖，即使用dictb的
        dicta 会进行更新

.values()

循环遍历
for k in dicta:
    print(dicta[k])

列表+字典
    将多个字典放入到一个列表中
    card_list  [
        {"name":"zhangsan",
         "qq":"123"
        },
        {"name":"lisi",
         "qq":"234"
        }
    ]
    
    for card_info in card_list:
        print(card_info)


切片
    [start:end:step]
    [)
    [0:]
    [:6]
    [:]
    [0::2]
    [::-1]
        step为负数,即从右向左提取元素
    深拷贝

    第二个索引是切片后余下的第一个元素的编号




len(item)
del(item)   del a   del(a)
max(item)   如果是字典，只针对key比较
    max("ksdfjla")
min(item)
cmp(item)   python3 取消了cmp函数
    使用 <  > ==
    "aa"<"bb"
    (1,1,1)<(2,2,2)
    [1,1,1]<[2,2,2]
    字典不适用,因为无序


[1,2]*4 返回[1,2,1,2,1,2,1,2,1,2,1,2]
    list
    tuple
    返回一个新的
[1,2] + [3,4] 返回[1,2,3,4]
    list
    tuple

in/ not in  成员运算符
    list
    tuple
    字符串
    字典(针对key)

< <= > >= ==
    

---
for in :

else:
    没有通过break退出循环，循环结束后，此处的代码会被执行
    集合全部遍历，才会执行
    有 break 就不会执行，continue无所谓

    student = [
        {"name":"zhangsan"},
        {"name":"lisi"}
    ]
    for i in student:
        if i["name"]=="lisi":
            print("found")
    else:
        print("Sorry, there is'nt ")

---


TODO注释
# TODO 显示功能     pycharm 中用
# TODO(张三) 显示功能     pycharm 中用

pycharm  变量 右键 refactor 快速更改所有变量名

pass

id(变量)
    查看变量的内存地址
    
    基础数据 相同的值 id一样
        id(1)
        id('*')
    修改变量对数据的引用

函数传的是引用，而不是数据，形参添加对这个数据的引用


返回值return的原理
    函数中创建了变量，引用返回


可变数据类型
list
dict

不可变数据类型
int
str
tuple

a = [1,2,3]
a = ["a","b"]
    这个是一个新的引用
    赋值语句是新的引用



unhashable  不能作为key
    hash(1)


变量的生命周期
    
**在函数内部，是不能对全局变量进行重新赋值的**
    是在函数内部建立新的变量


在函数内部对全局变量进行重新赋值
    num = 10
    def demo():
        global num
        num = 1

    num = 10 
    def demo(num):
        num = 99
        print(num)
    demo()  这个还是输出99,
    print(num) 输出10
    形参，开始指向10，后来指向99


全局变量必须放到执行代码的前边，因为从上到下执行,没有javascript的预编译


代码结构
    #!
    import
    全局变量
    函数定义
    执行代码

Pycharm
    如果局部变量的名字和全局变量的名字相同，会在局部变量下方显示一个灰色的虚线

全局变量的命名
    没有具体规定，一般加个gl_前缀

**如果return多个值，可以省略小括号**


a,b = (b,a)
a,b = b,a  返回元祖，()可以省略

**列表的 += 实质是调用 .extend方法 所以不会从新引用，可以改变值**
def demo(list):
    list += list
    print(list)

mylist = [1,2,3]
demo(mylist)
print(mylist)

结果都是 [1,2,3,1,2,3]


## 多值参数
*args       一个*可以接收一个tuple
**kwargs    两个*可以接受一个dict
拆包

def demo(num,*args,**kwargs):
    print(num)
    print(args)
    print(kwargs)

arg = ("a",18)
demo(1,arg)
    输出 1  
        (('a',18),)

正确用法
    demo(1,"qun","xian","liu",name="xian",age="2)
        返回结果为
            1
            ('qun','xian','liu')
            {'name'='xian','age'=2}

    多值参数使用一个tuple作为参数也可以，但是不美观，所有有了*args
        demo((1,2,3))   显然下面那个更美观
        demo(1,2,3)


## 拆包语法
简化tuple，和 dict的传值
def demo(*args,**kwargs):
    print(args)
    print(kwargs)

gl_nums=(1,2,3)
gl_dict = {"name":"li"}

demo(gl_nums, gl_dict)  这两个都被保存到tuple中
demo(*gl_nums, **gl_dict)


## 递归
自己调用自己
一定要对参数进行判断
首先考虑出口
函数执行完后返回函数调用处继续向下执行

def demo(n):
    if n == 1:
        return n
    else:
        return demo(n-1)+n

demo(5)



## 面向对象

面向过程基本上就是在主程序中调用函数
复杂的方案 函数调用将会非常复杂，相互调用

面向对象,主程序将会非常简单
不会出现彼此调用的情况
侧重的是谁来做事情
相比面向过程，是更大的封装
主程序不再关系具体的细节


类 和 对象

大驼峰命名
    一般用名词
    方法一般用动词

需求分析
    向日葵
    豌豆射手
    冰封射手
    普通僵尸
    跳跃僵尸

dir 内置函数
    dir(对象)
        输出这个对象所有的属性和方法

    __XXX__ 内置方法 或 属性


定义类
class 类名:
    def 方法1(self,参数):
        pass
    def 方法1(self,参数):
        pass

创建对象
    对象变量 = 类名()


class Cat:
    def eat(self):
        print("I like eating fishes")
    def drink(self):
        print("I need water")

tom = Cat()

print(tom)
id(tom)

"%x" % 16
%x 是16进制


可以在类的外部给对象增加属性



__new__(cls,*args,**kwargs)
__init__(self)
__str__(self)
    默认返回蓝图以及这个对象实例的内存地址
    必须返回一个字符串
__del__(self)



    ```
    class Animal:
        def __init__(self,name):
            self.name = name
        def __str__(self):
            return ("my name is %s" % self.name)
        def __del__(self):
            print("I am leaving...")

    dogA = Animal("AAA")
    print(dogA)

    print("*" * 20)

    "I am leaving 会在最下边输出"
    ```


在定义属性时，如果不知道设置什么初始值，可以设置为None
None 表示空对象，没有属性和方法，是一个特殊的常量


身份运算符 
    is
    is not
    用于比较两个对象的内存地址是否一致，是否是对同一个对象的引用
    

私有属性、方法
    属性名或方法前加两个下划线，就代表私有


Python没有真正意义的私有
    处理方法： 实例名_类名_私有属性或方法名
    伪私有，对私有加了前缀

    print(xiaofang._Woman__age)


## 继承

    ```
    class Animal:
        def eat(self):
            print("I am eating")
        def drink(self):
            print("I am drinking")

    class Dog(Animal):
        def dark(self):
            print("wang wang")

    class Xiaotianquan(Dog):        继承的传递性
        def fly(self):
            print("I can fly")
    aWang= Dog()
    aWang.dark()
    aWang.eat()
    aWang.drink()
    ```

## 方法重写 override
直接在派生类中重新写一个和父类一样的方法名即可


## 对父类的方法进行扩展
super
    是一个特殊的类
    super() super类创建出来的对象

    在重写父类方法时，调用在父类中封装的方法实现

    class Xiaotianquan:
        def wang(self):
            print("Woo~")
            super().wang()
            print("哮天犬来也")
    
python2.x 早起版本中是没有super类的，是直接用父类.方法名(self)来进行调用的
python3 还支持，但不推荐

    ```
    class Animal:
        def eat(self):
            print("eating")
    class Dog(Animal):
        def eat(self):
            print("Woo~")
            Animal.eat(self)
            print("哮天犬来也")
    xiao = Dog()
    xiao.eat()
    ```


       ```
        class Dog:
            def eat(self):
                Dog.eat(self)   //递归调用，死循环,要用父类，而不是自己
                print("eating")
            
       ```

在子类的对象方法中，不能访问父类的私有属性
                    不能访问父类的私有方法

    ```
    class Father:
        def __init__(self):
            self.num1 = 100
            self.__num2 = 200

    class Son(Father):
        def demo(self):
            print(self.num1)
            print(self.__num2)

    b = Son()

    AttributeError: 'Son' object has no attribute '_Son__num2'
    ```


一般是通过给父类添加一个共有的方法给子类  让其通过这个共有方法访问自己的私有属性和私有方法

## 多继承
class 子类名(父类1,父类2,...):

class Father:
    def Strong(self):
        pass
class Mather:
    def Jian_ren(self):
        pass
class Son(Father,Mather):
    pass

xian = Son()
xian.Strong()
xian.Jian_ren()


当父类之间存在同名的属性或者方法，应该尽量避免使用多继承

class A:
    def say(self):
        print("Hello from A")
    def bye(self):
        print("Bye from A")

class B:
    def bye(self):
        print("Bye from B")
    def say(self):
        print("Hello from B")

class C(A,B):
    pass



**MRO : method resolution order 多继承时判断方法、属性的调用路径**
print(C.__mro__)
    (<class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>)

    按照Linux 防火墙的逻辑，找到就执行了，不再继续查找


新式类 与 旧式（经典）类
object 是 Python 为所有对象提供的 基类，提供有一些内置的属性和方法，可以使用 dir 函数查看

新式类：以 object 为基类的类，推荐使用
经典类：不以 object 为基类的类，不推荐使用

python3 中都是以 object 作为类的基类
Python2 中定义类时，如果没有指定，则不会以 object 作为基类

新式类 和 旧式类 在多继承时，会影响到方法的搜索顺序

建议统一手动继承自 object
    class 类名(object):
        pass




## 多态
不同的子类对象调用相同的父类方法，产生不同的执行结果

以继承和重写父类方法为前提
是调用方法的技巧，不会影响到类的内部设计

人类-work(self)
    程序员-work(self)
    设计师-work(self)

    ```
    class Dog(object):
        def __init__(self,name):
            self.name = name
        def game(self):
            print("%s 普通的玩" % self.name)
    
    class Xiaotianquan(Dog):
        def __init__(self,name):
            self.name = name
        def game(self):
            print("%s 在天上玩" % self.name)
    
    class People(object):
        def __init__(self,name):
            self.name = name
        def play_with_dog(self,dog):
            dog.game()
    
    dog1 = Dog("普通狗")
    dog1.game()
    
    print("-"*20)
    dog2 = Xiaotianquan("哮天犬")
    dog2.game()
    
    print("-"*20)
    xiaoming = People("小明")
    xiaoming.play_with_dog(dog1)
    xiaoming.play_with_dog(dog2)
    ```


类是一个特殊的对象
    在程序运行时，类同样会被加载到内存，不过只有一份，
    除了封装 实例 的属性和方法外，类对象还可以拥有自己的属性和方法

    1. 类属性
    1. 类方法
        通过类名. 的方式访问


    ```
    class Tool(object):
        count = 0
        def __init__(self,name):
            self.name = name
            Tool.count += 1     # 不能使用self 而应该使用类名, 没有super() 一样的替代方法???

    tool1 = Tool("锤子")
    tool1 = Tool("斧头")
    print(Tool.count)
    ```

属性的获取机制
    向上查找机制
    
    类名.类属性
    对象.类属性(不推荐) 容易产生混淆

    如果使用 对象.类属性=值 赋值语句，只会给对象添加一个属性，而不会影响到类属性的值

类方法
    @classmethod
    def 类方法名(cls):
        pass

    1. @classmethod 修饰器
    1. 第一个参数必须是cls(class),其他也可以，习惯问题

在方法内部，
    可以通过cls. 访问类的属性
    可以通过cls. 访问类的方法
    同self一样

class Tool(object):
    count = 0

    @classmethod
    def getCount(cls):
        print(cls.count)

    def __init__(self,name):
        self.name = name
        Tool.count += 1

tool1 = Tool("锄头")
Tool.getCount()



## 静态方法

类方法
实例方法
静态方法

既不需要访问类属性，也不需要访问实例属性，则应该被定义为静态方法    

@staticmethod
def 静态方法名():   既不访问类属性，也不访问实例属性，所以不设置第一参数
    pass

不需要创建对象，通过类名.静态方法 的方式调用
                类方法也可以

class Dog:
    
    @staticmethod
    def run():
        print("running happily")

Dog.run()



## 单例设计模式

让类创建的对象，在系统中只有唯一的一个实例
每一次执行 类名() 返回的对象，内存地址是相同的


__new__  
    为对象分配独立空间
    返回对象的引用
__init__ 
    为对象进行初始化
    利用__new__返回的引用进行初始化


class Music(object):
    def __new__(cls,*args,**kwargs):
        instance = super().__new__(cls)     # 是 super(), 有小括号
        return instance

    def __init__(self):
        print("initial")

player = Music()
print(player)

__new__是静态方法




单例模式代码
class Music(object):
    instance = None

    def __new__(cls,*args,**kwargs):
        if cls.instance is None:
            cls.instance = super().__new__(cls)
        return cls.instance

player1 = Music()
print(player1)

player2 = Music()
print(player2)

只初始化一次
class Music(object):
    instance = None
    init_flag = False

    def __new__(cls,*args,**kwargs):
        if cls.instance is None:
            cls.instance = super().__new__(cls)
        return cls.instance
 
    def __init__(self):
        if Music.init_flag == False:
            print("hello")
            Music.init_flag = True

player1 = Music()
print(player1)

player2 = Music()
print(player2)


## 捕获异常
try 尝试,不确定是否能够正确执行的代码
except 如果不是，下方写尝试失败后的代码

try:
    numa = int(input("input a number"))
except:
    print("请输入数字")


针对不同的错误进行捕获
ValueError
ZeroDivisionError

try:

except 错误类型1：

except 错误类型2：

except 错误类型3：

except 错误类型4：


try:
    numa = int(input("input a number"))
except ZeroDivisionError:
    print("除数不能为0")
except ValueError:
    print("只能是数字")









except Exception as result:
    print("请输入正确的数字")



## 装饰器
python2.4才开始支持这个
本质上是一个返回函数的函数
给函数增加功能

某些函数已经上线，却要增加功能


装饰一个函数，所以肯定要传入一个函数作


新增的功能1                 三者封装称为一个新的功能函数
原来函数的功能  fun()
新增的功能2




高阶函数
变量指向函数
函数递归


    ```
    def func():
        print("I am  years old")

    def out(fun):
        def inner():            //如果不定义里边的这个函数，也可以实现同名，但是那样就直接执行了
            print("-" * 20)
            fun()
            print("-" * 20)
        return inner

    f = out(func)
    f()

    只有一层，直接执行的例子：
    def say():
        print("This is saying")

    def outer(fun):
        print("装饰1")
        fun()
        print("装饰2")

    say = outer(say)            //直接执行了,改变了调用方式,使用方式


    --------------


    def say(age):
        print("i am %d years old" % age)        
    
    def outer(fun):
        def inner(age):
            if age < 0:
                print("no")
            else:
                fun(age)
        return inner
    
    say = outer(say)
    say(-9)

    装饰器的参数只要包含一个函数作为参数
    被装饰的函数有自己的参数


    def outer(fun):                         //装饰器要写在被装饰函数的上边，因为形式如下:  @装饰器  ==》 被装饰函数 = 装饰器()
        def inner(age):                     //如果写在下边，顺序执行，装饰器还没有定义，则报错
            if age < 0:
                print("no")
            else:
                fun(age)
        return inner

    @outer              即 say = outer(say)
    def say(age):
        print("i am %d years old" % age)

    say(-9)



    3层装饰器

    def auth(fun):
        def inner(*args,**kwargs):
            username = input("Username:").strip()
            password= input("password:").strip()
            
            if username == "user" and password == "pass":
                return(func(*args,**kwargs))                //如果被修饰函数有返回值
            else:
                exit("wrong username or password")
        return inner

    def index():
        print("index")

    @auth
    def home():
        print("home")
        return('return from home')                          //如果被修饰函数有返回值

    @auth
    def bbs():
        print("bbs")


    3层

    def auth(auth_type):
        def wrap(fun):                                          //当然也可以把要添加的条件写在这里作为参数,但是这样就改变了调用方式
            def inner(*args,**kwargs):
                username = input("Username:").strip()
                password= input("password:").strip()
                
                if username == "user" and password == "pass":
                    return(func(*args,**kwargs))                //如果被修饰函数有返回值
                else:
                    exit("wrong username or password")
            return inner
        return wrap

    def index():
        print("index")

    @auth(auth_type='local')
    def home():
        print("home")
        return('return from home')                          //如果被修饰函数有返回值

    @auth(auth_type='ldap')
    def bbs():
        print("bbs")





    ```

**通用装饰器**

def outer(func):
    def inner(*args,**kwargs):
        print("hhhh")
        func(*args,**kwargs)                //关键是这个参数
    return inner

@outer
def say(name,age):
    print("i am %s i am %d years old" %(name,age))

say("liu",29)



## 编译

方法1
python -m py_compile /root/{file1,file2}.py     这是同时转换多个文件
python -m py_compile /root/file1.py     这是转换单个文件

-m 相当于import

方法2
import py_compile
py_compile.compile(r'/root/a.py)


BIF(Built in Functions)


**Python默认向下取整**
    10//3       返回3   实际返回3.3333      向下取整得到3
    10//-3      返回-4  实际返回-3.3333     向下取整得到-4

    10%3       返回1   
    10%-3      返回-2  

    10/-3 == -3.33333   向下取整等于 -4

    10/-3向下取整的商 乘以 除数 + 余数 == 被除数(由此得到余数)
    10 除以  3 ==  3 余  1
    10 除以 -3 == -4 余 -2
    取余数看取整的结果,向下取整

int("011",base=8)


python 变量没有默认值，必须赋值

表达式 是一些东西，而语句 做一些事情。例如，2*2的结果是4，而print(2*2)打印4

repr
    在代码中的样子
    print(repr("Hello\tWorld\n!!!"))
    'Hello\tWorld\n!!!'
str
    便于人类理解的样子
    print("Hello\tWorld\n!!!")

str是一个类，而repr是一个函数


pow(2,3)    或者import math ; math.pow(2,3)
pow(x,y[,z])    x**y  对z求模

round(a.xyz[,n])   
        n:保留n位小数
        将浮点数取整为与之**最接近的整数**
        round(3.2)  返回3
        四舍五入，5 舍入到偶数
abs     绝对值


math.floor()
math.ceil()
math.sqrt(9)
cmath.sqrt(-1)

尽量不使用 from ...  import ...

原始字符串
    r' '
长字符串
    print('''lkafjklsajfkjeklajflksdjlkfajkdsjflkjalkjf
        jsldkfj
        lkdsjfk''')
    可以包含单引号和双引号,3个单/双引号是开始结束

常规字符串也可以横跨多行，行尾加反斜杠,反斜杠和换行符会被转义，即被忽略
    1 + 2 + \
    3 + 4

容器基本上就是可包含其他对象的对象。两种主要的容器是序列(如列表和元组)和映射(如字典)。
    一种既不是序列也不是映射的容器,它就是集合(set)

索引、切片、相加、相乘和成员资格检查,序列的长度以及找出序列中最大和最小的元素,迭代(iteration)

要将列表的长度初始化为10,可像下面这样做:
    sequence = [None] * 10

切片赋值
    a[1:1] = range(3)
    a[1:4] = []
    a[2:] = "y"  list("hello")->"hey"

### format
"{}, {} and {}".format("first", "second", "third")
"{3} {0} {2} {1} {3} {0}".format("be", "not", "or", "to")

from math import pi
"{name} is approximately {value:.2f}.".format(value=pi, name="π")
'π is approximately 3.14.'

在Python 3.6中,如果变量与替换字段同名,还可使用一种简写。在这种情况下,可
使用 f 字符串——在字符串前面加上 f 。
>>> from math import e
>>> f"Euler's constant is roughly {e}."
"Euler's constant is roughly 2.718281828459045."


>>> "{foo} {} {bar} {}".format(1, 2, bar=4, foo=3)
'3 1 4 2'


>>> "{foo} {1} {bar} {0}".format(1, 2, bar=4, foo=3)
'3 2 4 1'

>>> "The number is {num}".format(num=42)
'The number is 42'
>>> "The number is {num:f}".format(num=42)
'The number is 42.000000'
你也可以将其作为二进制数进行处理。
>>> "The number is {num:b}".format(num=42)
'The number is 101010'

b 将整数表示为二进制数
c 将整数解读为Unicode码点
d 将整数视为十进制数进行处理,这是整数默认使用的说明符
e 使用科学表示法来表示小数(用 e 来表示指数)
E 与 e 相同,但使用 E 来表示指数
f 将小数表示为定点数
F 与 f 相同,但对于特殊值( nan 和 inf ),使用大写表示
g 自动在定点表示法和科学表示法之间做出选择。这是默认用于小数的说明符,但在默认情况下至少有1位小数
G 与 g 相同,但使用大写来表示指数和特殊值
n 与 g 相同,但插入随区域而异的数字分隔符
o 将整数表示为八进制数
s 保持字符串的格式不变,这是默认用于字符串的说明符
x 将整数表示为十六进制数并使用小写字母
X 与 x 相同,但使用大写字母
% 将数表示为百分比值(乘以100,按说明符 f 设置格式,再在后面加上%)

宽度、精度和千位分隔符

宽度是使用整数指定的,如下所示:
>>> "{num:10}".format(num=3)
'
3'
>>> "{name:10}".format(name="Bob")
'Bob
'
如你所见,数和字符串的对齐方式不同。


可使用逗号来指出你要添加千位分隔符
>>> 'One googol is {:,}'.format(10**100)
'One googol is 10,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,00
0,000,000,000,000,000,000,000,000,000,000,000,000,000,000'
同时指定其他格式设置元素时,这个逗号应放在宽度和表示精度的句点之间.
>>> "{num:10,.2f}".format(num=123456789.567)
'123,456,789.57'


要指定左对齐、右对齐和居中,可分别使用 < 、 > 和 ^ 。
>>> print('{0:<10.2f}\n{0:^10.2f}\n{0:>10.2f}'.format(pi))
3.14
3.14
3.14

>>> "{:=^15}".format(" WIN BIG ")                                                                                             
Out[32]: '=== WIN BIG ==='
>>> "{:=<15}".format(" WIN BIG ")                                                                                             
Out[33]: ' WIN BIG ======'


info = {"name":"xina","age":2}
xian = "{name} is {age} years old".format_map(info)

In [64]: "{name:#^10} is {age:5} years old".format_map(info)                                                                       
Out[64]: '###xian### is     2 years old'

In [65]: "{name:#^10} is {age:#^5} years old".format_map(info)                                                                     
Out[65]: '###xian### is ##2## years old'






## 多任务

windows,macos,linux,unix 都支持多任务

轮转时间片

单核CPU实现多任务

进程，线程


并发:
    看上去是一起执行
    任务数多余CPU核心数
并行
    真的在一起执行
    任务数<=CPU核心数
    不可能实现

实现多任务的方式
1. 多进程
1. 多线程
1. 协程模式
1. 多进程+多线程

### 进程

对于操作系统，一个任务就是一个进程;一个浏览器，一个QQ

进程是系统中程序执行和资源分配的基本单位

每个进程都有自己的数据段、代码段、堆栈段

#### 单任务


```
def run():
    while True:
        print("run...")

from time import sleep

if __name__ == "__main__":
    while True:
        print("hello")
        sleep(1)

    run()

    像上边的代码，run() 根本没有机会执行。只有上面的while hello 执行完成后，才有机会执行，因为单任务,只有一个进程

```


#### 多任务

multiprocessing 多进程库,跨平台
    提供了Process类来代表一个进程对象

linux 还可以用fork,windows不支持

```
from multiprocessing import Process
import time

def run():
    while True:
        print("run...")
        time.sleep(1.5)

if __name__ == "__main__":  ## 这个是主进程,父进程
    p = Process(target=run)
        # target 进程执行的任务
    p.start()   # 启动进程

    while True:
        print("hello world")
        time.sleep(1)


```

```
from multiprocessing import Process
import time

def run(string):
    while True:
        print("run... %s" % string)
        time.sleep(1.5)

if __name__ == "__main__":  ## 这个是主进程,父进程
    p = Process(target=run,args=("BillScofield",))
        # target 进程执行的任务
        # args 需要一个元祖
    p.start()   # 启动进程

    while True:
        print("hello world")
        time.sleep(1)

```


os.getpid()     进程号
os.getppid()    父进程号

```
from multiprocessing import Process
import time
import os

def run(string):
    while True:
        print("run... %s #子进程号: %d #父进程号:%d" % (string,os.getpid(),os.getppid()))
        time.sleep(1.5)

if __name__ == "__main__":  ## 这个是主进程,父进程
    p = Process(target=run,args=("BillScofield",))
        # target 进程执行的任务
        # args 需要一个元祖
    p.start()   # 启动进程

    while True:
        print("hello world ## %d" % os.getpid())
        time.sleep(1)

```



```
from multiprocessing import Process

def run(string):
    print("子进程开始%s " % string)
    print("子进程结束%s " % string)

if __name__ == "__main__":
    print("主进程开始...")
    p = Process(target=run,args=("HelloWorld",))
    p.start()
    print("主进程结束...")
    
    这种状况的输出结果为
        主进程开始
        主进程结束
        子进程开始
        子进程结束
```


一般都是子进程结束后，父进程才结束,将子进程纳入到父进程的管理之中，只需 p.join()即可
子进程结束后再执行父进程

```
from multiprocessing import Process

def run(string):
    print("子进程开始%s " % string)
    print("子进程结束%s " % string)

if __name__ == "__main__":
    print("主进程开始...")
    p = Process(target=run,args=("HelloWorld",))
    p.start()
    p.join()
    print("主进程结束...")
    
    这种状况的输出结果为
        主进程开始
        子进程开始
        子进程结束
        主进程结束
```

父进程负责流程控制，多个任务由子进程去处理，全部子进程结束后，父进程结束

**全局变量在多个*进程*中不能共享**

```
from multiprocessing import Process

num = 100

def run():
    print("子进程开始")
    global num
    num += 1
    print("子进程结束")

if __name__=="__main__":
    print("父进程开始")
    p = Process(target=run)
    print("父进程结束%d" % num)
```

独享数据段，堆栈段，



from multiprocessing import Pool    进程池


pp = Pool(N)
    # 创建多个进程
    # 默认是CPU核心数





pp = Pool(2)

for i in range(5):
    # 创建进程，放进进程池统一管理
    pp.apply_async(run,args=(1,))    异步async  同步sync

# 在调用join之前必须先调用close，在close后边不能再添加新的进程
pp.close()
# 所有子进程结束后再去调用父进程
pp.join()

random.choice([1,2,3])

    ```
    from multiprocessing import Pool
    import os
    import time
    
    def run():
        print("子进程开始 %d " % os.getpid())
        start = time.time()
        end = time.time()
        print("子进程结束 耗时:%.2f" % (end - start))
    
    if __name__=="__main__":
        print("父进程开始 %d " % os.getpid())
        pp = Pool(8)
        for i in range(10):
            pp.apply_async(run)
         
        pp.close()
        pp.join()
        print("父进程结束")

    ```




## 文件
help(open)

open("FILE","r+",encoding='utf8')

    mode
        r
        w:从头开始写，覆盖
        a:append ,这个不能读， a+ 就可以了
        +    
        b:二进制文件
            rb

            wb
                .write('helo'.encode())
        U 表示在读取时，可以将\r\n 自动转换为\n
            rU
            r+U        

    以普通方式打开的文件，seek只能从0开始，不能是1 和 2， 错误提示:
        io.UnsupportedOperation: can't do nonzero end-relative seeks
        io.UnsupportedOperation: can't do nonzero cur-relative seeks
        但是 seek(0,1)可以
    二进制方式不受限制,open("FILE","rb")

    读下一个位置,写下一个位置
    
    r+ 还是 rw 都是从位置1开始写

    换行符\n 

使用编辑器例如vi时，会自动添加\n换行符，但是Python的write不会这样做，真实的写入你告诉他的每个字符


    ```迭代器
    for line in handle:
        print(line)

    ```


with open ... as ...
    __enter__
    __exit__

文件对象是可迭代的，行
    

.tell()
.seek(offset[,whence])

.encoding

.name           //文件名
.isatty()       //unseekable
.seekable()
.readable()
.writable()
.flush()
.closed()

.truncate(Num)     //从文件开头其，跳到Num这个位置，将后边的删除,seek不管用，仅保留从开头到Num这些字符

写入是有缓冲区的，缓冲区满或换行会触发写入操作


python里怎么终止程序的执行
    quit() exit()

mode
    r+  方式写入时，是在最后边追加
    w+  清空，写还是在最后边追加


### 修改

    ```
    import sys

    target_str = sys.argv[1]
    new_str= sys.argv[2]

    f = open(file_one,'r')
    f_new = open(file_two,'w')

    for line in f:
        if target_str in line:
            line = line.replace(target_str,new_str)
        else:
            f_new.write(line)
    ```

### with

with open(one) as f1, open(two) as f2:
    pass
