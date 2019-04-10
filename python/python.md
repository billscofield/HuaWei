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
    333L
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
    .isnumeric()    只包含数字
        支持中文数字: "一千零一"
        '\u00b2'
        不支持小数

    .istitle()      每个单词的首字母大写    忽略数字，"Hello 5You" 返回True,数字被忽略，认为没有,"Hello 5you" 返回False
    .islower()
    .isupper()

    .startswith(str)
    .endswith(str)

    .find(str,start=0,end=len(string))
    .rfind(str,start=0,end=len(string))
        **没有不会报错，返回-1**
        而.index会报错

    .index(str,start=0,end=len(string))
    .rindex(str,start=0,end=len(string))

    .replace(old_str,new_str,num=string.count(old))
        返回一个新的字符串,不会修改原字符串


文本对齐
    .ljust(width,fillchar=" ")
    .rjust(width,fillchar=" ")
    .center(width,fillchar=" ")
        默认英文空格

去除空白字符
    .lstrip(char=" ")
    .rstrip(char=" ")
    .strip(char=" ")

拆分和连接
    .split(str="空白符",num) 返回list
    string.join(seq)    string作为分隔符







type()

input()
    name = input("ur name")

int()
float()
bool()

## 格式化输出
%s
%d
%f
%%
%x  十六进制

print("%4.2f" % 3.2)
    一共4位，不足会补齐，超过没关系，该怎么显示就怎么显示

print("%.2f" % 3.2)

print("%.2f%%" % 90.2)  90.20%  转换为百分数后保留2位小数

print("%05d" % 1)

标识符区分大小写

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

## list
其他语言中叫数组

.sort()  升序
.sort(reverse=True) 降序
    .sort(self,key=None,reverse=False)

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

a.remove()  相当于del，无返回
    remove first occurrence of value
    不存在会报错
a.clear()
    remove all items from list
a.pop()
    pop(self)   默认最后一个元素
    pop(self,index)
        删除并返回指定index的元素
del(a[n])
    本质上是将一个变量从内存中删除
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


dict
存储无序的对象的集合
键:值
键值对,键值对
{}
键只能是str,num,tuple

info = {"name":"xiaoming",
        "age":27,
        "gender":"boy",
        "height":174
        }

1. 取值
dicta["key"]
    没有会报错
.keys()
len(dicta)   键值对的数量

1. 增
dicta["key"]=value

1. 改
dicta["key"]=value

1. 删
dicta.pop("key")
    key不存在报错
dicta.pop("key",default)
    key不存在返回default
dicta.clear()

1. 合并
dicta.update(dictb)
    重复key取覆盖，即使用dictb的


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
class Son:
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



MRO : method resolution order 多继承时判断方法、属性的调用路径
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

    类属性
    类方法
        通过类名. 的方式访问


    ```
    class Tool(object):
        count = 0
        def __init__(self,name):
            self.name = name
            Tool.count += 1     不能使用self 而应该使用类名

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
        instance = super().__new__(cls)
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
本质上是一个返回函数的函数
给函数增加功能

    ```
    def func():
        print("I am  years old")

    def out(fun):
        def inner():
            print("-" * 20)
            fun()
            print("-" * 20)
        return inner

    f = out(func)
    f()
    ```

    ```
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
    ```

    ```
    def outer(fun):
        def inner(age):
            if age < 0:
                print("no")
            else:
                fun(age)
        return inner

    @outer              即 say = outer(say)
    def say(age):
        print("i am %d years old" % age)

    say(-9)
    ```

通用装饰器
def outer(func):
    def inner(*args,**kwargs):
        print("hhhh")
        func(*args,**kwargs)
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













