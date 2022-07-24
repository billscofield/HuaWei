

## 

在Python中，一行就是一行。如果你愿意，也可加上分号，但不会有任何影响（除非后面
还有其他代码），况且大家通常都不这样做。

### 除法

除法运算的结果为小数，即浮点数（float或floating-point number）。
    1/2 = 0.5

整除运算，可使用双斜杠
    1//2 = 0

在较旧的Python版本中，对整数执行常规除法运算的结果与使用双斜杠类似。

如果你使用的是Python 2.x，要对整数执行常规除法运算，可在程序开头添加如下语句
    from __future__ import division


!! 求余运算符也可用于浮点数。这种运算符甚至可用于负数

对于整除运算，需要明白的一个重点是它向下圆整结果。因此在结果为负数的情况下，圆
整后将离0更远。这意味着对于-10 // 3, 将向下圆整到-4，而不是向上圆整到-3。

```
>>> 10 // 3 
3 

>>> 10 // -3 
-4 

>>> -10 // 3 
-4 

>>> -10 // -3 
3

因此取余运算要先做整除运算

>>> 10 % 3 
1 
>>> 10 % -3                 // 10 // -3 = -4    10 - 3 * 4 
-2 
>>> -10 3 %
2 
>>> -10 % -3 
-1
```

为解释器总是将表达式的值打印出来（打印的是repr表示的内容

这个表达式确实会执行一些操作：计算2和2的乘积。但既不会将结果保存起来，也不会向
用户显示它。因此除执行计算外，没有其他任何作用。


username = input("What is your name?\n")
type(username)


鉴于函数调用返回一个值，因此它们也是表达式，就像本章前面讨论的算术表达式一样

abs计算绝对值
round将浮点数**圆整**为与之最接近的整数
    round(-1.5) == -2

**整数总是向下圆整，而round圆整到最接近的整数，并在两个整数一样近时圆整到偶数。**
    round(2.5) == 2

    math.floor(2.5)     == 2
    math.floor(-2.5)    == -3



还有一些类似的函数，可用于转换类型，如str和float。实际上，它们并不是函数，而是
类。


    math.ceil()
    math.sqrt()

**可使用变量来引用函数（以及其他大部分Python元素）。**
    foo = math.sqrt
    foo(4) == 2.0


专门用于处理复数的模块 cmath
    
    cmath.sqrt(-4) == 2j

Python没有专门表示虚数的类型，而将虚数视为实部为零的复数。


通过神奇模块__future__让Python具备了时光机的部分功能。对于Python当前不支持，但
未来将成为标准组成部分的功能，你可从这个模块进行导入。


Python打印所有的字符串时，都用引号将其括起。是因为Python打印值时，保留其在代码
中的样子，而不是你希望用户看到的样子。但如果你使用print，结果将不同。
    
```
>>> "Hello, world!" 
'Hello, world!' 
>>> print("Hello, world!") 
Hello, world!

如果再加上表示换行符的编码\n，差别将更明显。
>>> "Hello,\nworld!" 
'Hello,\nworld!' 

>>> print("Hello,\nworld!") 
Hello, 
world!
```


使用**str**能以合理的方式将值转换为用户能够看懂的字符串。例如，尽可能将特殊字符编码
转换为相应的字符。然而，使用**repr**时，通常会获得值的合法Python表达式表示。

```
>>> print(repr("Hello,\nworld!")) 
'Hello,\nworld!' 
>>> print(str("Hello,\nworld!")) 
Hello, 
world!
```

长字符串
    三单引号

    三双引号


原始字符串不能以单个反斜杠结尾。换而言之，原始字符串的最后一个字符不能是反斜杠，
除非你对其进行转义（但进行转义时，用于转义的反斜杠也将是字符串的一部分）

    如果要指定以反斜杠结尾的原始字符串, 基本技巧是将反斜杠单独作为一个字符串

    print(r'c:\Program Files' '\\')

编码和解码的最重要用途之一是，将文本存储到磁盘文件中。然而，Python提供的文件读
写机制通常会替你完成这方面的工作！只要文件使用的是UTF-8编码，就无需操心编码和解
码的问题。


**bytes(string, encoding[, errors]) 对指定的字符串进行编码，并以指定的方式处理错误**


## 第二章 列表华元祖

在Python中，最基本的数据结构为序列（sequence）。
    列表和元组,字符串

两种主要的容器是序列（如列表和元组）和映射（如字典）。

在序列中，每个元素都有编号，而在映射中，每个元素都有名称（也叫键）

有一种既不是序列也不是映射的容器，它就是集合（set）

对序列进行**迭代**意味着对其每个元素都执行特定的操作

Python没有专门用于表示字符的类型，因此一个字符就是只包含一个元素的字符串。

如果函数调用返回一个序列，可直接对其执行索引操作
    fourth = input("Year:")[3]


切片
    [)
    step 决定方向


不能拼接不同类型的序列


空列表是使用不包含任何内容的两个方括号（[]）表示的。

要将列表的长度初始化为10，可像下面这样做：

    >>> sequence = [None] * 10

内置函数len、min和max很有用，其中函数
    len返回序列包含的元素个数，
    max返回序列中最大的元素
    min返回序列中最小的元素


### 函数 list

从Python 2.2起，list就是类型，而不是函数了（tuple和str亦如此）。


"delimiter".join(somelist)

list()

    "-".join(list("hello"))

不能给不存在的元素赋值，因此如果列表的长度为2，就不能给索引为100的元素赋值。

删除元素
    del

使用切片赋值还可在不替换原有元素的情况下插入新元素。

    >>> a[1:1] = list("hello")
    >>> a
    [1, 'h', 'e', 'l', 'l', 'o', 2, 3]

    name[1:1] = list("hello")
    但是 'str' object does not support item assignment

列表方法

1. index
    方法index在列表中查找指定值第一次出现的索引。

2. count
    方法count计算指定的元素在列表中出现了多少次

    [1,2,3,4,5,6,1,2].count(1)

3. append

4. extend

    方法extend让你能够同时将多个值附加到列表末尾

5. insert

    方法insert用于将一个对象插入列表。

    a.insert(索引2,"插入值")

    与extend一样，也可使用切片赋值来获得与insert一样的效果。但可读性根本无法与
    使用insert媲美

6. copy
    方法 copy 复制列表

    这类似于使用a[:]或list(a)，它们也都复制a。

    看到 id(a) 和 id(b) 是不一样的

7. remove

    方法remove用于删除第一个为**指定值**的元素。

8. clear方法

    clear就地清空列表的内容。
    类似于 a[:] = []


9. pop

    方法pop从列表中删除一个元素（末尾为最后一个元素），并返回这一元素

    pop是唯一既修改列表又返回一个非None值的列表方法。


    push和pop是大家普遍接受的两种栈操作（加入和取走）的名称。Python没有提供push，
    但可使用append来替代。

    要创建先进先出（FIFO）的队列，可使用insert(0, ...)代替append。
    另外，也可继续使用append，但用pop(0)替代pop()。

    两个不同的方向

10. reverse

11. sort

    方法sort用于对列表就地排序①。就地排序意味着对原来的列表进行修改，使其元素按
    顺序排列，而不是返回排序后的列表的副本。

    且不返回任何值

12. sorted

    这个函数可用于任何序列，但总是**返回一个列表**

    要按字母表排序，可先转换为小写。为此，可将sort或sorted的key参数设置为str.lower。
    例如，sorted("aBc", key=str.lower)返回['a', 'B', 'c']。


13. reversed(seq)
    
    返回的是**迭代器**


高级排序

    sort(key=函数[,reverse=True/False])


### 元组：不可修改的序列

空元组用两个不包含任何内容的圆括号表示

如何表示只包含一个值的元组呢？这有点特殊：虽然只有一个值，也必须在它后面加上逗
号。
    (1,)
    2,



### 字符串

```
print("%s %s" % ("hello","world"))

```

编写新代码时，应选择使用字符串方法format，它融合并强化了早期方法的优点。

```
>>> "{}, {} and {}".format("first", "second", "third") 
'first, second and third' 

>>> "{0}, {1} and {2}".format("first", "second", "third") 
'first, second and third' 

然而，索引无需像上面这样按顺序排列。
>>> "{3} {0} {2} {1} {3} {0}".format("be", "not", "or", "to") 
'to be or not to be' 

命名字段的工作原理与你预期的完全相同。
>>> from math import pi 
>>> "{name} is approximately {value:.2f}.".format(value=pi, name="π") 
'π is approximately 3.14.'
```

如果变量与替换字段同名，还可使用一种简写。在这种情况下，可使用f字符串——在字符串
前面加上f。

```
In [11]: a = "hello world"

In [12]: f"what is wrong with you {a}"
Out[12]: 'what is wrong with you hello world'


"Euler's constant is roughly {e}.".format(e=e)
```

要在最终结果中包含花括号，可在格式字符串中使用两个花括号（即{{或}}）来指定

```
>>> "{{ceci n'est pas une replacement field}}".format() 
"{ceci n'est pas une replacement field}"
```


不能同时使用**手工编号**和**自动编号**，因为这样很快会变得混乱不堪。

```
>>> "{foo} {} {bar} {}".format(1, 2, bar=4, foo=3) 
'3 1 4 2'

>>> "{foo} {1} {bar} {0}".format(1, 2, bar=4, foo=3) 
'3 2 4 1' 

```





```
>>> print("{pi!s} {pi!r} {pi!a}".format(pi="π")) 
π 'π' '\u03c0' 
```

上述三个标志（s、r和a）指定分别使用str、repr和ascii进行转换。函数str通常创建外
观普通的字符串版本（这里没有对输入字符串做任何处理）。函数repr尝试创建给定值的
Python表示（这里是一个字符串字面量）。函数ascii创建只包含ASCII字符的表示，类似
于Python 2中的repr。


格式说明

```
>>> "The number is {num}".format(num=42) 
'The number is 42' 
>>> "The number is {num:f}".format(num=42) 
'The number is 42.000000'
```

b 将整数表示为二进制数
c 将整数解读为Unicode码点
d 将整数视为十进制数进行处理，这是整数默认使用的说明符
e 使用科学表示法来表示小数（用e来表示指数）
E 与e相同，但使用E来表示指数
f 将小数表示为定点数
F 与f相同，但对于特殊值（nan和inf），使用大写表示
g 自动在定点表示法和科学表示法之间做出选择。这是默认用于小数的说明符，但在默认情况下至少有1位小数
G 与g相同，但使用大写来表示指数和特殊值
n 与g相同，但插入随区域而异的数字分隔符
o 将整数表示为八进制数
s 保持字符串的格式不变，这是默认用于字符串的说明符
x 将整数表示为十六进制数并使用小写字母
X 与x相同，但使用大写字母
% 将数表示为百分比值（乘以100，按说明符f设置格式，再在后面加上%）


宽度、精度和千位分隔符

 "{num:10}".format(num=3) 
 '         3' 
 >>> "{name:10}".format(name="Bob") 
 'Bob       ' 

如你所见，**数和字符串的对齐方式不同。**


精度也是使用整数指定的，但需要在它前面加上一个表示小数点的句点。

>>> "Pi day is {pi:.2f}".format(pi=pi) 
'Pi day is 3.14'


最后，可使用逗号来指出你要添加千位分隔符。

```
>>> 'One googol is {:,}'.format(10**100)

```



```

>>> '{:010.2f}'.format(pi) 
'0000003.14' 


要指定左对齐、右对齐和居中，可分别使用<、>和^。
>>> print('{0:<10.2f}\n{0:^10.2f}\n{0:>10.2f}'.format(pi)) 
3.14 
 3.14 
  3.14
```

可以使用填充字符来扩充对齐说明符，这样将使用指定的字符而不是默认的空格来填充。

```
>>> "{:$^15}".format(" WIN BIG ") 
'$$$ WIN BIG $$$'
```


还有更具体的说明符=，它指定将填充字符放在符号和数字之间。
```
>>> print('{0:10.2f}\n{1:10.2f}'.format(pi, -pi)) 
      3.14
     -3.14
>>> print('{0:10.2f}\n{1:=10.2f}'.format(pi, -pi)) 
      3.14 
-     3.14
```


如果要给正数加上符号，可使用说明符+（将其放在对齐说明符后面），而不是默认的-。如
果将符号说明符指定为空格，会在正数前面加上空格而不是+。
```
>>> print('{0:-.2}\n{1:-.2}'.format(pi, -pi)) #默认设置
3.1 
-3.1 
>>> print('{0:+.2}\n{1:+.2}'.format(pi, -pi)) 
+3.1 
-3.1 
>>> print('{0: .2}\n{1: .2}'.format(pi, -pi)) 
  3.1 
 -3.1
```


#### 字符串方法

虽然字符串方法完全盖住了模块string的风头，但这个模块包含一些字符串没有的常量
和函数。下面就是模块string中几个很有用的常量。

    1. string.digits：包含数字0～9的字符串。
    1. string.ascii_letters：包含所有ASCII字母（大写和小写）的字符串。
    1. string.ascii_lowercase：包含所有小写ASCII字母的字符串。
    1. string.printable：包含所有可打印的ASCII字符的字符串。
    1. string.punctuation：包含所有ASCII标点字符的字符串。
    1. string.ascii_uppercase：包含所有大写ASCII字母的字符串。

虽然说的是ASCII字符，但值实际上是未解码的Unicode字符串。


1. center
    方法center通过在两边添加填充字符（默认为空格）让字符串居中。

    ```
    >>> "The Middle by Jimmy Eat World".center(39) 
    ' The Middle by Jimmy Eat World ' 
    >>> "The Middle by Jimmy Eat World".center(39, "*") 
    '*****The Middle by Jimmy Eat World*****'
    ```

2. find
    方法find在字符串中查找子串。如果找到，就返回子串的第一个字符的索引，否则返回-1。

    ```
    >>> 'With a moo-moo here, and a moo-moo there'.find('moo')
    ```

    字符串方法find返回的并非布尔值。如果find像这样返回0，就意味着它在索引0处找
    到了指定的子串。
    
    你还可指定搜索的起点和终点（它们都是可选的）。
         subject.find('!!!', 0, 16) # 同时指定了起点和终点

3. join
    join是一个非常重要的字符串方法，其作用与split相反，用于合并序列的元素。
    split是一个非常重要的字符串方法，其作用与join相反，用于将字符串拆分为序列。

4. lower
    方法lower返回字符串的小写版本。>>

5. title
    它将字符串转换为词首大写，即所有单

    词的首字母都大写，其他字母都小写。然而，它确定单词边界的方式可能导致结果不合理。

    ```
    >>> "that's all folks".title() 
    "That'S All, Folks" 
    ```

    另一种方法是使用模块string中的函数capwords。

    ```
    >>> import string 
    >>> string.capwords("that's all, folks") 
    That's All, Folks""
    ```

    string.capwords(s[, sep]) 使用split根据sep拆分s，将每项的首字母大写，再以空格为分隔符将它们合并起来

6. replace

    方法replace将指定子串**都**替换为另一个字符串，并返回替换后的结果。

7. strip
    方法strip将字符串开头和末尾的空白（但不包括中间的空白）删除，并返回删除后的结果。

    lstrip、rstrip

8. translate

    ```
    table = str.maketrans('cs', 'kz')
    'this is an incredible test'.translate(table) 
    'thiz iz an inkredible tezt'
    ```

#### 判断字符串是否满足特定的条件

isalnum
isalpha
isdecimal
isdigit
isidentifier
islower
isnumeric
isprintable
isspace
istitle
isupper


## 字典

每个键与其值之间都用冒号（:）分隔，项之间用逗号分隔

空字典（没有任何项）用两个花括号表示，类似于下面这样：{}。

可使用函数dict①从其他映射（如其他字典）或键值对序列创建字典

    ```
    items = [('name', 'Gumby'), ('age', 42)] 
    >>> d = dict(items) 
    >>> d 
    {'age': 42, 'name': 'Gumby'}
    ```

还可使用关键字实参来调用这个函数，如下所示：
    >>> d = dict(name='Gumby', age=42)


### 基本的字典操作

1. len(d)返回字典d包含的项（键值对）数。
1. d[k]返回与键k相关联的值。
1. d[k] = v将值v关联到键k。  del d[k]删除键为k的项。
1. k in d检查字典d是否包含键为k的项。

与list、tuple和str一样，dict其实根本就不是函数，而是一个类

表达式k in d（其中d是一个字典）查找的是键而不是值，而表达式v in l（其中l是一个
列表）查找的是值而不是索引。

将字符串格式设置功能用于字典

```
nebook 
{'Beth': '9102', 'Alice': '2341', 'Cecil': '3258'} 
>>> "Cecil's phone number is {Cecil}.".format_map(phonebook) 
"Cecil's phone number is 3258."
```

#### 字典方法

1. clear

    方法clear删除所有的字典项，这种操作是就地执行的（就像list.sort一样），因此
    什么都不返回（或者说返回None）。

2. copy

    方法copy返回一个新字典，其包含的键值对与原来的字典相同（这个方法执行的是浅
    复制，因为值本身是原件，而非副本）。

    当替换副本中的值时，原件不受影响。然而，如果修改副本中的值（就地修改而
    不是替换），原件也将发生变化，因为原件指向的也是被修改的值

    可使用模块copy中的函数deepcopy
        from copy import deepcopy

3. fromkeys

    方法fromkeys创建一个新字典，其中包含指定的键，且每个键对应的值都是None

    >>> {}.fromkeys(['name', 'age']) 
    {'age': None, 'name': None}

    >>>  dict.fromkeys(['name', 'age']) 
    {'age': None, 'name': None}

    如果你不想使用默认值None，可提供特定的值。
    >>> dict.fromkeys(['name', 'age'], '(unknown)') 
    {'age': '(unknown)', 'name': '(unknown)'}

4. get

    方法get为访问字典项提供了宽松的环境。通常，如果你试图访问字典中没有的项，将
    引发错误。

    使用get来访问不存在的键时，没有引发异常，而是返回None。你可指定“默认”
    值，这样将返回你指定的值而不是None。
    >>> d.get('name', 'N/A') 
    'N/A'

5. items

    方法items返回一个包含所有字典项的列表，其中每个元素都为(key, value)的形式。
    字典项在列表中的排列顺序不确定。

    ```
    >>> d = {'title': 'Python Web Site', 'url': 'http://www.python.org', 'spam': 0} 
    >>> d.items() 
    dict_items([('url', 'http://www.python.org'), ('spam', 0), ('title', 'Python Web Site')])
    ```

    返回值属于一种名为字典视图的特殊类型。字典视图可用于迭代

    ??? 视图的一个优点是不复制，它们始终是底层字典的反映，即便你修改了底层字典亦如此。
    >>> d['spam']

6. keys
    方法keys返回一个字典视图，其中包含指定字典中的键。

7. pop

    方法pop可用于获取与指定键相关联的值，并将该键值对从字典中删除。

    ```
    >>> d = {'x': 1, 'y': 2} 
    >>> d.pop('x') 
    1 
    >>> d 
    {'y': 2}
    ```

8. popitem

    方法popitem类似于list.pop，但list.pop弹出列表中的最后一个元素，而popitem随
    机地弹

    如果你要以高效地方式逐个删除并处理所有字典项，这可能很有用，因为这样无需先
    获取键列表。


9. setdefault

    方法setdefault有点像get，因为它也获取与指定键相关联的值，但除此之外，
    setdefault还在字典不包含指定的键时，在字典中添加指定的键值对。

10. update

    方法update使用一个字典中的项来更新另一个字典。

    ```
    In [14]: a = {'name':'alice','age':10}

    In [15]: b = {'name':'dany'}

    In [16]: a.update(b)

    In [17]: a
    Out[17]: {'name': 'dany', 'age': 10}

    ```

11. values

    方法values返回一个由字典中的值组成的字典视图。不同于方法keys，方法values返
    回的视图可能包含重复的值。

## 第 5 章 条件、循环及其他语句

对很多应用程序来说，使用模块logging来写入日志比使用print更合适

print
    你可同时打印多个表达式，条件是用逗号分隔它们

    可自定义分隔符：
        >>> print("I", "wish", "to", "register", "a", "complaint", sep="_") 
        I_wish_to_register_a_complaint

    还可自定义结束字符串，以替换默认的换行符。
        print('Hello,', end='') 
        print('world!')


链式赋值
    a = b = "hello"
    a is b -> True


下面的值都将被解释器视为假：
    False None 0 "" () [] {}

而其他各种值都被视为真，包括特殊值True

实际上，True和False不过是0和1的别名
    True == 1


elif 子句

s：相同运算符

in：成员资格运算符


##### 断言

可要求某些条件得到满足（如核实函数参数满足要求或为初始测试和调试提供帮助），为
此可在语句中使用关键字assert。


```
age = 10 
>>> assert 0 < age < 100 
>>> age = -1 
>>> assert 0 < age < 100 
Traceback (most recent call last): 
  File "<stdin>", line 1, in ? 
AssertionError
```

还可在条件后面添加一个字符串，对断言做出说明。
```
>>> age = -1 
>>> assert 0 < age < 100, 'The age must be realistic' 
Traceback (most recent call last): 
 File "<stdin>", line 1, in ? 
AssertionError: The age must be realistic
```



##### 一些迭代工具

Python提供了多个可帮助迭代序列（或其他可迭代对象）的函数

1. 并行迭代

    zip，它将两个序列“缝合”起来，并返回一个由元组组成的序列。返回值是一个适合迭
    代的对象，要查看其内容，可使用list将其转换为列表。

    ```
    >>> list(zip(names, ages)) 
    [('anne', 12), ('beth', 45), ('george', 32), ('damon', 102)]

    ```

    “缝合”后，可在循环中将元组解包。

    for name, age in zip(names, ages): 
        print(name, 'is', age, 'years old') 

    函数zip可用于“缝合”任意数量的序列。需要指出的是，当序列的长度不同时，函数
    zip将在最短的序列用完后停止“缝合”。

2. 迭代时获取索引 enumerate

    for index, string in enumerate(strings):
        pass


循环中的 else 子句
    在循环正常结束时才采取某种措施
    判断循环是提前结束还是正常结束

    一种更简单的办法是在循环中添加一条else子句，它仅在没有调用break时才执行
    ```
    from math import sqrt 

    for n in range(99, 81, -1): 
    root = sqrt(n) 
        if root == int(root): 
            print(n) 
            break 
    else: 
        print("Didn't find it!")

    ```

#### 列表推导

导是一种从其他列表创建列表的方式

    [x * x for x in range(10)]

    [x*x for x in range(10) if x 3 == 0]

    还可添加更多的for部分。
    >>> [(x, y) for x in range(3) for y in range(3)]

使用圆括号代替方括号并不能实现元组推导，而是将创建生成器

然而，可使用花括号来执行字典推导
    
    ```
    >>> squares = {i:"{} squared is {}".format(i, i**2) for i in range(10)} 
    >>> squares[8] 
    '8 squared is 64'
    ```

使用 exec 和 eval 执行字符串及计算其结果

    函数exec将字符串作为代码执行。
        >>> exec("print('Hello, world!')")

    你添加第二个参数——字典，用作代码字符串的命名空间
        
    ```
    >>> from math import sqrt 
    >>> scope = {} 
    >>> exec('sqrt = 1', scope) 
    >>> sqrt(4) 
    2.0 
    >>> scope['sqrt'] 
    1
    ```

eval

    eval是一个类似于exec的内置函数。exec执行一系列Python语句，而eval计算用字符
    串表示的Python表达式的值，并返回结果（exec什么都不返回，因为它本身是条语
    句）。例如，你可使用如下代码来创建一个Python计算器：

    ```
    >>> eval(input("Enter an arithmetic expression: ")) 
    Enter an arithmetic expression: 6 + 18 * 2 
    42 
    ```

    与exec一样，也可向eval提供一个命名空间，虽然表达式通常不会像语句那样给变量
    重新赋值。


## 函数

放在函数开头的字符串称为文档字符串（docstring），将作为函数的一部分存储起来。


```
quare(x): 
    'Calculates the square of the number x.' 
    return x * x 

可以像下面这样访问文档字符串：
    >>> square.__doc__ 
    'Calculates the square of the number x.'
```


内置函数help很有用。在交互式解释器中，可使用它获取有关函数的信息，其中包含
函数的文档字符串。

```
>>> help(square) 
Help on function square in module __main__: 
square(x) 
Calculates the square of the number x.
```


编写函数旨在为当前程序（甚至其他程序）提供服务，你的职责是确保它在提供的参数正
确时完成任务，并在参数不对时以显而易见的方式失败。（为此，通常使用**断言或异常**。)


位置参数, 关键字参数和默认值
    关键字参数最大的优点在于，可以指定默认值

收集参数

    ```
    def print_params(*params): 
        print(params)
    ``` 

    前面有星号的参数将被放在元组中

    如果没有可供收集的参数，params将是一个空元组

    与赋值时一样，带星号的参数也可放在其他位置（而不是最后），但不同的是，在这种情况
    下你需要做些额外的工作：使用名称来指定后续参数。

    ```
    >>> def in_the_middle(x, *y, z): 
    ... print(x, y, z) 
    ... 
    >>> in_the_middle(1, 2, 3, 4, 5, z=7) 
    1 (2, 3, 4, 5) 7
    ```

    
    星号不会收集关键字参数
    ```
    def print_params_2(title, *params): 
        print(title) 
        print(params)

    print_params_2('Hmm...', something=42) 
    Traceback (most recent call last): 
     File "<stdin>", line 1, in <module> 
    TypeError: print_params_2() got an unexpected keyword argument 'something'
    ```

    要收集关键字参数，可使用两个星号。这样得到的是一个字典而不是元组
    ```
    >>> def print_params_3(**params): 
        print(params) 

    >>> print_params_3(x=1, y=2, z=3) 
    {'z': 3, 'x': 1, 'y': 2}
    ```

    可结合使用这些技术。
     
    ```
    def print_params_4(x, y, z=3, *pospar, **keypar): 
        print(x, y, z) 
        print(pospar) 
        print(keypar) 

    其效果与预期的相同
    >>> print_params_4(1, 2, 3, 5, 6, 7, foo=1, bar=2)
    ```

分配参数

```
通过在调用函数（而不是定义函数）时使用运算符*实现的

def add(x, y): 
    return x + y

params = (1, 2)

add(*params)

---

通过使用运算符**，

可将字典中的值分配给关键字参数。如果你像前面那样定义了函数hello_3，就可像下面这样做：

>>> params = {'name': 'Sir Robin', 'greeting': 'Well met'} 
>>> hello_3(**params) 
Well met, Sir Robin!

```

```
def story(**kwds): 
    return 'Once upon a time, there was a {job} called {name}.'.format_map(kwds)

print(story(job='king', name='Gumby'))

```

全局变量
    必要时可使用globals()['parameter']来访问

    ```
    >>> def combine(parameter): 
        print(parameter + globals()['parameter'])
    ```

    在函数内部给变量赋值时，该变量默认为局部变量，除非你明确地告诉Python它是全
    局变量。那么如何将这一点告知Python呢？

    >>> x = 1 
    >>> def change_global(): 
        global x 
        x = x + 1


???map、filter和reduce

    map(func, seq[, seq, ...]) 对序列中的所有元素执行函数
    filter(func, seq) 返回一个列表，其中包含对其执行函数时结果为真的所有元素
    reduce(func, seq[, initial]) 等价于 func(func(func(seq[0], seq[1]), seq[2]), ...)
    sum(seq) 返回 seq 中所有元素的和
    apply(func[, args[, kwargs]]) 调用函数（还提供要传递给函数的参数）


