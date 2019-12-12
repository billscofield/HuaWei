
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


## 三元运算

a = value if 条件 else value2
