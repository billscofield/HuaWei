
## 编译型 解释型

解释型语言：BASIC


## 动态类型语言 静态类型语言
动态类型语言:
    在运行期间才去做数据类型的检查。
    不用指定类型

静态类型语言：
    需要指定类型

## 强类型 弱类型
强类型
    一旦指定为了某类型，如果不经过强制转换，那么他就永远是这个数据类型了
    例如 8 + "2" 会报错, 而弱类型不会报错

弱类型
    一个变量可以赋不同类型的值


Python
    动态、解释型、强类型


如果不依赖特别需要某个系统的库, 移植性几乎所有平台

Python解释器
    CPython 我们最广泛使用的
    IPython 交互式
    PyPy


```
#!/usr/bin/env python
#!/usr/bin/python3

coding:utf8
```


没有常量


ascii 
    american standard code for information interchange



单引号，双引号 无区别


input 在 Python2 中
    a = input("name:")
    输入 liu, 解释器认为你输入的是变量
    输入 "liu", 认为是字符串


## getpass 模块
import getpass

password = getpass.getpass("prompt")

## while else
while 条件:

else:
    **正常**退出时要执行的代码


### while 中跳出两层循环
```
i = 0
j = 0

while i<=10:
    while True:
        print(i,"and","inner")
        j+=1

        if j == 3:
            break
    else:
        continue
    break
    i+=1    
```

## for else
for ...:

else:
    **正常**退出时执行的代码


### for 中跳出两层循环代码

```
for i in xrange(N):
    for j in xrange(M):
        if something:
            break
    else:
        continue        # 这个continue对应的是最外层的for循环
    break
```


## 模块

1. time
time.strftime("%F")     //%Y-%m-%d
%F   full date; same as %Y-%m-%d
%T   time; same as %H:%M:%S


1. 当前目录路径

自己安装的第三方库 一般放在 site-package 里边
标准库一般路径 /usr/lib/python3.6

pyenv 中的 site-packages 路径
    ~/.pyenv/versions/3.7.3/envs/liujiao373/lib/python3.7/site-packages

## sys 模块
这个模块用c语言写的，不是.py 这种

sys.path	//Python全局环境变量

sys.argv

	```
	# a.py
	#!/bin/python3
	import sys
	print(sys.argv)

	路径/a.py 参数1 参数2 参数3 ...

	返回结果: ['程序a.py的相对路径','参数1', '参数2','参数3',...]

	```

sys.getdefaultencoding()


## OS 模块
os.system('系统命令')
返回值为命令的执行成功否，0：成功，1：失败(同Linux)

os.popen('系统命令').read()
popen 返回一个内存地址, 用read读出
    只能用read读一遍，没有seek方法，underlying stream is not seekable


os.mkdir('目录')


```
#a.py
print("helo")

#b.py
import a

执行b.py,直接输出 helo
```

打字机效果
os.stdout.write()
os.stdout.flush()

## copy 模块
copy.deepcopy(元素)   
copy.copy(元素) <==>  [:] 切片是**浅拷贝**

切片(或者shallow copy)：对“是不可变对象的子元素“的修改或增删操作不会影响另一对象
切片(或者shallow copy)：对“是可变对象的子元素“的操作会影响另一对象


浅复制
**对被复制元素的引用**

a = ['a','b',['liu','jiao'],'c']

b = a.copy()

id(a[1])
id(b[1])
上边的两个内存地址一样，

listA.copy() //shallow copy
    copy第一层，list中的list copy的也是地址，但是这个地址又指向了另外一个地址, 是一个地址指针
    
    b 复制了 这个地址指针, 这个地址指针还是指向那个子list

    1 is 1 => True
    

shallow copy 的作用:类似联合账号

```
info = ["name",['saving',100]]
husband = info[:]
wife = info[:]
husband[0] = 'husband'
wife[0] = 'wife'

husband[1][1]=1000
```




## 函数
默认返回 None

对应的关键字参数不能写在位置参数前边

```
def say(x=1,y=x):   //不合法， name 'x' is not defined
    pass
```

位置参数
默认参数
关键字参数
args
kwargs
    不能喝默认参数一样的名字，否则报错 got multiple values for argument '名字'
    不论位置放到哪里，即使放在后边


## 三元运算

a = value if 条件 else value2




## 变量


## 递归

```
def say(n):
    print(n)
    if n//2 > 0:
        return say(n//2)
    print("底部")
```


## 高阶函数 (1或2)

1. 可以接受函数作为参数的函数
2. 返回之中包含函数名

lambda x:x+3


```
def say():
     print("saying")
     print(walk())      //函数的定义在下边，但是无妨,下边有函数或变量的定义即可
    print(id(walk))
    print(x)

def walk():
    print("walking")

x = 10

say()

print(id(walk))






```
### 列表生成器
案例一
[(x,y) for x in [1,6] for y in range[6,10]]


案例二
list1=[1,2,3,4,5,6,7,8,9]

list2=[1,2,3,4,5,6,7,8,9]

result=[str (i) + '*' + str (a) + '=' +str (a*i) for i in list1 for a in list2 if a>=i]

print(result)


### 迭代器

判断方法
    from collections import Iterable
    isinstance(对象,Iterable)

    from collections import Iterator


next()方法, 直到抛出异常

---
可以被next()函数调用并不断返回下一个值的对象称为**迭代器**: Iterator
可迭代对象：可以直接作用于for循环的对象
---

生成器都是 Iterator 对象, 但 list,dict,str虽然是 Iterable, 却不是 Iterator
iter() 能把list,dict,str等 Iterable 变成 Iterator

Iterator 可以表示一个无限大的数据流，例如全体自然数



### 生成器  generator
姑且叫她元祖推导式吧

```
方法只有一个
.__next__()


yield 方法

def say(max):
    n = 0
    while n<max:
        yield n
        n += 1

print(type(say))    -> function
print(type(say(2))) -> generator
for i in say(2):
    print(i)



用__next__() 方法最后一个没有了，会抛异常
next(生成器)

```


## 生产者消费者



## 序列化

### json

```
import json

info = {'name':'liujiao'}

with open('文件','w') as handle:
    handle.write(json.dumps(info))

print('序列化完毕')

---
import json

res = ''

with open('文件','r') as handle:
    res = json.loads(handle.read())

print('结果是: %s\n反序列化完毕' % res)

```

json只能序列化基础数据类型，不能序列化复杂数据类型

json 中只能有一个对象，不能存两个对象？
    loads 两个对象出错

### pickle

```
import pickle

def say():
    print("saying")


info = {
    'name':'liujiao',
    'age':30,
    'fun':say
}

with open('文件','wb') as handle:           //一定是 b(bytes)
    handle.write(pickle.dumps(info))
    #pickle.dump(info,文件句柄)

print("Pickle 序列化成功")

---
res = ''
with open('文件','rb') as handle:
    res = pickle.loads(handle.read())       //复杂对象,如函数可以，但是如果反序列化脚本是一个单独的文件
    #pickle.load(文件句柄)                  //则反序列化文件也要有这个对象的定义

print("反序列化完毕")




一个handle json.dumps(对象)两次，是写入两边




```


## 项目结构

```
Foo/
|---bin/
|   |---foo
|
|---foo/
|   |---tests/              //测试代码
|   |---|---__init__.py
|   |---|---test_main.py
|   |
|   |
|   |---__init__.py
|   |---test_main.py
|
|
|---docs/
|   |---conf.py   
|   |---abc.rst
|
|---setup.py
|---requirements.txt        //pip依赖关系
|---README

```



## class 类

```

class Dog(object):                  //新式类,主要体现在继承上，super是新式的
    mouth = 'big'                   //类变量  直接Dog.mouth 或 实例.mouth
    def __init__(self,name):        //构造函数,实例化时做一些类的初始化工作
        self.name = name            //实例变量，静态属性
    def bark(self):                 //方法，动态属性
        print("%s is barking" % self.name)

dog1 = Dog('wangcai')               //实例 等价于 Dog.(dog1,'wangcai')
```


类变量
实例变量
    私有变量

实例方法
    私有方法




### 继承

    ```
    def __init__(self,参数...):
        super(子类自己,self).__init__(参数,没有self) 或者 
        父类.__init__(self,参数)

    ```


多继承
    从左到右依次继承
    第一个没有显示声明构造函数，就从下一个里边找


    ```
    class A(object):
        def __init__(self,a):
            print('A')

    class B(object):
        def __init__(self,b):
            print('B')

    class C(object):
        def __init__(self,c):
            print('C')

    class D(A,B,C):
        def __init__(self,a,b,c)
            super(D,self).__init__(a)
            super(A,self).__init__(a)
            super(B,self).__init__(c)

    ```




python2中的经典类 是深度优先,旧式类
python2中的新式类 是广度优先,新式类
python3中的新式类和广式类 都是广度优先

C3算法

```
类名._mro__
类名.mro()
```




### 多态
一种接口多种实现
**不同的子类对象 调用相同的 父类方法，产生不同的执行结果**

```
        人类
        (工作)
程序员          设计师
(工作)          (工作)

继承 + 重写

```



## 单例模式
正在播放的音乐只有一个
打印机对象同时只有一个

### __new__()方法

内置静态方法

为对象分配内存空间
返回对象的内存引用

new 分配空间，返回给 init, init 进行初始化

```
class MusicPlayer():
    instance = None
    def __new__(cls,*args,**kwargs):    //cls 相当于self    new 是静态方法，必须有类参数
        if cls.instance is None:
            cls.instance = super().__new__(cls)      //调用父类的new方法进行空间分配, cls为当前类
        return cls.instance                           //返回即可,两种情况都返回 cls.instance

    def __init__(self):
        print("init")

player = MusicPlayer()

```



初始化方法 只执行一次
```
init_flag = Flase
def __init__(self):

    if not init_flag:
        return
    else:
        ...

```
