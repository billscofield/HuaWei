
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
    **正常**退出是要执行的代码


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
copy.copy(元素) <==>  [:] 切片是浅拷贝

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

result=[str (i) + '*' + str (a) + '=' +str (a*i)  for i in list1   for a in list2  if a>=i]

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
