非数学运算
    字符串表示
        __repr__
        __str__
    集合、序列相关
        __len__
        __getitem__
        __setitem__
        __delitem__
        __contains__
    迭代相关
        __iter__
        __next__
    可调用
        __call__
    with上下文管理器
        __enter__
        __exit__

    数值转换
        __abs__
        __bool__
        __int__
        __float__
        __hash__
        __index__

    元类相关
        __new__
        __init__

    属性相关
        __getattr__ __setattr__
        __getattribute__ __setattribute__
        __dir__

    属性描述符
        __get__
        __set__
        __delete__

    协成
        __await__
        __aiter__
        __anext__
        __aenter__
        __aexit__

数学运算
一元运算符
    __neg__ (-)
    __pos__ (+)
    __abs__
二元运算符
    __lt__ (<)
    __le__ (<=)
    __eq__ (==)
    __ne__ (!=)
    __gt__ (>)
    __ge__ (>=)
算数运算符
    __add__ (+)
    __divmod__ divmod()
    __pow__ ** 或 pow()
    __round__ round()
反向算数运算符
    __radd__
    __rsub__
    __rmul__
    __rtruediv__
    __rfloordiv__
    __rmod__
    __rdivmod__
    __rpow__
增量赋值算数运算符
    __iadd__
    __isub__
    __imul__
    __itruediv__
    __ifloordiv__
    __ipow__
位运算符
    __invert__ ~
    __lshift__ <<
    __rshift__ >>
    __and__ &
    __or__ |
    __xor__ ^
反向位运算符
    __rlshift__
    __rrshift__
    __rand__
    __rxor__
    __ror__
增量赋值算数运算符
    __ilshift__
    __irshift__
    __iand__
    __ixor__
    __ior__


深入类和对象
1. 鸭子类型

    ```
    class Duck():
        def say(self):
            print("i am a duck")

    class Dog():
        def say(self):
            print("i am a dog")

    class Cat():
        def say(self):
            print("i am a cat")

    animal_list = [Cat,Dog,Duck]
    for animal in animal_list:
        animal.say()

    ## Duck, Dog, Cat 都实现了同一种方法, 则我们可以将他们视为一个类
    ## 不同于 C, Java 这种需要继承父类的重写
    ## python中不需要继承自共同的父类，只要实现了共同的方法名即可


    listA = ['a','b','c']
    tupleA = ('aa','bb','cc')

    ## 只要实现了某个内置函数，就是这种鸭子了。比如实现了 __repr__ 就是repr的鸭子了
    ## 实现了某个方法就是某个类
    
    ```

2. 抽象基类（abc模块）
python不是通过继承某一个类才实现某种特性，只要实现了某个魔法方法，就是某种类型的对象

抽象基类 无法实例化




MRO
    深度优先算法
    广度优先算法
    C3算法
    
    A       B
    C       D
        E
    print(E.__mro__)    => E C A D B
        AC 看成一个，DB看成一个
        


自省：通过一定的机制查询到对象的内部结构
    __dict__
    dir()

    ```
    class Person:
        name = "user"

    class Student(Person):
        def __init__(self,school_name):
            self.school_name = school_name

    user = Student("闲")
    print(user.__dict__)
    ```


super()
    不是调用父类，而是调用 mro 顺序中的下一个类


mixin模式(继承)



try:
    print("start")
    raise KeyError
    return 1
except KeyError:
    print("key error")
    return 2
else:
    print("success")
    return 3
finally:
    print("finally")
    return 4



class Sample:
    def __enter__(self):
        print('enter')
        return self
    def __exit__(self):
        print('exit')
    def do(self):
        print('doing sth')

with Sample() as e:
    e.do()




列表可以伸缩，从这点来讲，列表是动态的，

dir(__builtins__)

suit(组):python代码块


pypi 读作 pie-pie
















