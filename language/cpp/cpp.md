[link1](https://www.cctry.com/thread-276447-1-1.html)

## 

C++ 是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言，支持过
程化编程、面向对象编程和泛型编程。

C++ 是由 Bjarne Stroustrup 于 1979 年在新泽西州美利山贝尔实验室开始设计开发的。
C++ 进一步扩充和完善了 C 语言，最初命名为带类的C，后来在 1983 年更名为 C++。

C++ 是 C 的一个超集，事实上，任何合法的 C 程序都是合法的 C++ 程序。

注意：使用静态类型的编程语言是在编译时执行类型检查，而不是在运行时执行类型检查。


## C++的特点

C++是由 AT&T Bell实验室 于20世纪80年代初在C语言的基础上成功开发出来的。C++保留
了C语言原有的所有优点，并增加了面向对象的机制。

C++是由C语言发展而来的，与C兼容。用C语言写的程序基本上可以不加修改地用于C++。从
C++的名字可以看出它是C的超集。C++既可用于面向过程的程序设计，又可用于面向对象的
程序设计，是一种功能强大的混合型程序设计语言。

备注：**C++不是纯面向对象语言。**


## 用途

C语言：操作系统底层、系统驱动、单片机、嵌入式方面 等等；

C++：网络游戏开发、音视频技术、Socket网络通信，另外，苹果/谷歌/微软 等大型软硬
件公司的系统或者软件上面都支持C/C++语言的集成开发。


## C/C++ 同其他语言的区别 

1. 编译型语言(compiler)
    代表语言：C、C++、Pascal、Object-C 以及苹果的 Swift


2. 解释型语言

    解释型语言执行效率较低，且不能脱离解释器运行

3. 脚本语言

    定义：为了缩短传统的编写-编译-链接-运行（edit-compile-link-run）过程而创建
    的计算机编程语言。

    它的特点是：程序代码即是最终的执行文件，只是这个过程需要解释器的参与，所以
    说脚本语言与解释型语言有很大的联系。脚本语言通常是被解释执行的，而且程序是
    文本文件。

    代表语言：JavaScript，Python、Perl 等。

4. 混合型语言

    既然编译型和解释型各有缺点就会有人想到把两种类型整合起来，取其精华去其糟粕。
    就出现了半编译型语言。比如 C#，C#在编译的时候不是直接编译成机器码而是中间码，
    .NET平台提供了中间语言运行库运行中间码，中间语言运行库类似于Java虚拟机。
    .Net在编译成IL代码后，保存在DLL中，首次运行时由JIT在编译成机器码缓存在内存
    中，下次直接执行。

    严格来说混合型语言属于解释型语言。C#更接近编译型语言。代表语言：C#、Java



## g++与gcc的区别

    gcc是C的编译器，g++是C++的编译器。那是不是说gcc只能编译编译C语言，而g++只能
    编译C++呢？其实不是，gcc也可以编译C++程序，而C++是C的基础上发展而来的，所以
    g++也不可能编译不了C语言。它们之间的区别有如下几点：

    1. 后缀为.c的，gcc把它当作是C程序，而g++当作是c++程序；后缀为.cpp的，两者都
       会认为是c++程序。
        
       注意，虽然c++是c的超集，但是两者对语法的要求是有区别的，C++的语法规则更
       加严谨一些。

    2. 编译阶段，g++会调用gcc，对于c++代码，两者是等价的，但是因为gcc命令不能
       自动和C＋＋程序使用的库联接，所以通常用g++来完成链接，为了统一起见，干
       脆编译/链接统统用g++了，这就给人一种错觉，好像cpp程序只能用g++似的。
        
       用gcc进行编译，在选项中加上要链接的库，也可以编译c++。如上面的HelloWorld
       程序我们也可以用以下的命令进行编译：

    g++ 是将 gcc 默认语言设为 C++ 的一个特殊的版本，链接时它自动使用 C++ 标准库
    而不用 C 标准库。通过遵循源码的命名规范并指定对应库的名字，用 gcc 来编译链
    接 C++ 程序是可行的

    ```
    gcc main.cpp -lstdc++ -o main
    ```


## 标准库

标准的 C++ 由三个重要部分组成：

    1. 核心语言，提供了所有构件块，包括变量、数据类型和常量，等等。
    2. C++ 标准库，提供了大量的函数，用于操作文件、字符串等。
    3. 标准模板库（STL），提供了大量的方法，用于操作数据结构等。




## 第一个程序

   ```
   #include <iostream>
   using namespace std;                     // 告诉编译器使用 std 命名空间。命名空间是 C++ 中一个相对新的概念。

   int main(int argc, char* argv[]){
        cout << "hello world"<<endl;        // << 运算符用于向屏幕传多个值
        return 0;
   }
   ```

   argc: arg count
   argv: arg value
   cout: c out
   endl: "\n"   cout << "hello" << "\n";


    我们可以指定使用 C++11 来编译 main.cpp 文件

        > g++ -g -Wall -std=c++11 main.cpp

## 注释

属于**条件编译**，0 即为参数。
    > #if 0 ... #endif

可以把 #if 0 改成 #if 1 来执行 code 的代码。

这种形式对程序调试也可以帮助，测试时使用 #if 1 来执行测试代码，发布后使用 #if 0
来屏蔽测试代码。

if 后可以是任意的条件语句。

下面的代码如果 condition 条件为 true 执行 code1 ，否则执行 code2。

```
#if condition
    code1
#else
    code2
#endif
```




## 变量

匈牙利命名法, 在变量前面加一个字母表示变量的类型

iSum, cSex, 


### 变量作用范围

1. 局部变量

2. 全局变量


## 数据类型

### 数组

1. 字符数组
    
    char s[]="hello world";
    cout << char << endl;


### 结构体 struct

    ```
    struct Student{¬
        string name;¬
        int age;¬
    };¬
    ¬
    int main(){¬
    ¬
        Student liujiao = {"liujiao",32};¬      // C: 还要写上 struct
      ¬
        cout << liujiao.name << endl;¬
    ¬
        return 0;¬
    }
    ```

    访问： .

    一定要进行初始化，不然是随机值，故引出了构造函数的概念

和数组进行配合使用:

    ```
    struct Student{
        string name;
        int id;
        int age;
        char gender;
    }

    Student stu[2];
    for(int i=0;i<2;i++){
        cin >> stu[i].name;
        cin >> stu[i].id;
        cin >> stu[i].age;
        cin >> stu[i].gender;
    }
    for(int i=0;i<2;i++){
        cout << stu[i].name << "\n" << stu[i].id <<"\n"<<stu[id].age<<"\n"<<stu[id].gender<<endl;
    }
    ```

作为函数参数
    **值传递**

    ```
    void set_num(Student* stu){
        static int num = 1001;
        (*stu).id = num++;          // 通过变量引用方法成员
        stu->id = num++;            // 通过指针引用方法成员
    }
    接上面的代码
    ```






### 枚举类型 enum

    ```
    enum Egender{
        male,
        female
    };
    ```

1. 枚举元素按常量处理，所以称作枚举常量。他们不是变量，所以不要对他们进行赋值，即枚举元素的值是固定的；

2. **枚举元素是常量**，所以其也是有值的，他们的值是一个整数，按照元素声明时候的顺序从0开始依次进行+1操作，默认的值就是：0,1,2,3，...

3. 枚举元素有默认的值，但也可以在声明的时候指定值，例如：

    ```
    enum EWeekDay
    {
        EWeekDay_1 = 3,
        EWeekDay_2 = 4,
        EWeekDay_3 = 5,
        EWeekDay_4,
        EWeekDay_5,
        EWeekDay_6,
        EWeekDay_7          // 可以有 ",", 也可以没有
    };
    ```

    其中从 EWeekDay_4 开始未赋值，所以按照他的上一个元素的值+1的规则进行默认赋值，也就是 EWeekDay_3 + 1 = 6。
    这里面有个注意事项，即，上面赋值的最好是依次增大，不然有可能会造成两个枚举元素是一样的值，不会报错，例如：

    ```
    enum EWeekDay
    {
        EWeekDay_1 = 3,
        EWeekDay_2 = 2,
        EWeekDay_3 = 1,
        EWeekDay_4,
        EWeekDay_5,
        EWeekDay_6,
        EWeekDay_7
    };
    ```

    ```
    int day = EWeekDay_4;       // 可以用int直接拿来用, 
    ```
4. 枚举值可以用来进行跟整数一样的判断，比较，switch-case 等操作

5. 虽然枚举类型的变量可以看做是整形类型的变量，但是不能把普通的整数赋值给枚举类型变量，例如：

    > EWeekDay day = 2;

    这种是错误的，除非进行强制类型转换，但是不建议。最好还是：

    > EWeekDay day = EWeekDay_2;

枚举类型举例：枚举类型和结构体类型结合：


struct Student
{
    string name;
    int num;
    EGender sex;
    int age;
};

Student stu;
stu.sex = ESex_Male;


### 用 typedef 类型声明新的类型名字：

除了可以用 struct 结构体，union 联合体，enum 枚举 等自定义类型以外，还可以使用
typedef 声明一个新的类型名字来代替已有的类型名。注意是新的类型名字，只是名字而
已，不是一种全新的类型，只是改个名字而已。

例如，我们定义一个无符号的整型int变量可以这样来定义：unsigned int a = 5;

类型的名字比较长，unsigned int，而且以后所有定义无符号的整型int变量都得这么写，
那么有没有简单的写法呢，typedef就派上用场了，咱们可以给 unsigned int 改个名字，
例如：

    > typedef unsigned int uint;
    > uint a = 5;

所以，以后所有的 unsigned int 都可以改成 uint 了，方便吧？同理，其他的类型也都
可以使用 typedef 改名，例如：

    ```
    typedef int myint;
    typedef unsigned long ulong;
    typedef Student StuT;
    typedef EWeekDay EWDay;
    ```



### 类类型 class




## 运算

char 和 short 参与运算时,自动转为 int; 也就是说最小的运算整形单位是 int；

所有的浮点运算都是以双精度进行的，即使仅含 float 单精度量运算的表达式，也要先转
换成 double 类型，再作运算；

## 类型转换

(int)x

int(x)

这两种都可以


逗号表达式：
    逗号表达式在以后的编程中也会经常遇到，其规则是：

    所有以逗号间隔的表达式都进行计算，各个表达式的计算顺序按照从左往右。**整个表达式的值是最后一个逗号表达式的值。**例如：

    ```
    int x = 0;
    int y = 0;
    x +=2, y+= 3;
    int q = ((x++), (++y));
    我要问问大家了，q的值是多少呢？

    ```

## 语句

1. 输入与输出

    输入与输出流库中的 cin 和 cout 来实现的

    cin 和 cout 的定义是在 iostream 中，命名空间为 std，所以如果我们的程序中要使用 cin 和 cout 就必须要加上以下两条语句：

    ```
    #include <iostream>
    using namespace std;
    ```

    ```
    int a = 0;
    int b = 0;
    cin >> a >> b;

    ---

    int a = 0;
    int b = 0;
    cin >> a;
    cin >> b;

    ---

    cin >> a,b;     // wrong
    ```


2. 兼容C语言的输入与输出：

    之前跟大家说过，C++ 本身兼容 C语言，所以C语言中的输入与输出函数在C++仍然可以使用。例如：

    getchar：字符输入函数
    putchar：字符输出函数
    scanf：输入
    printf：输出

    其中，scanf 和 printf 跟 C++ 中的 cin 和 cout 功能很类似，但是没有 cin 和
    cout 智能。例如我用 printf 输出多个值，要这么写：

        int x = 2;
        int y = 3;
        printf("%d + %d = %d", x, y, x+y);

    printf 中的输出参数中要明确指定每个变量要输出的类型，%d 代表整形，%s 代表字
    符串，%c 代表字符型。而 cout 就不用，全部智能识别了。



3. if语句

    if 
    else if
    else

4. switch 语句

switch语句的case标签中定义变量的问题：

不能直接在 case/default 的内嵌语句中定义局部变量，会报错的，大家不妨试试。如果
真的需要定义的话，可以加上一对大括号，如下：

    ```
    char ch = 'A';
    switch(表达式)
    {
        case 'A':cout << "case A reach." << endl;
            break;
        case 'B':
            {
                int a = 6;
                ++a;
            }
        break;
        default:
            break;
    }

    ```



5. while / do while

    ```
    sum += x;
    ++x;
    ---
    sum += x++;
    ```

6. for

    打印图形

    x
    xxx
    xxxxx
    xxx
    x

## 函数

不允许嵌套定义



1. 字符串函数

    1. 连接函数: strcat

        该函数的定义原型为：
        
        char * strcat (char destination[], const char source[]);
        
        [相关的说明在这里](http://www.cplusplus.com/reference/cstring/strcat/)
        
        其作用就是将第二个参数的字符串连接到第一个参数的字符串结尾，所以要保证第一
        个参数的字符数组大小够用，能装的下第1个和第2个字符串的总长度才行，不然就会
        发生内存溢出啦！
        
        返回值是第一个字符串的首地址


    2. 字符串拷贝函数：strcpy

        该函数的定义原型为：
        
        char * strcpy( char destination[], const char source[] );
        
        相关的说明在这里：http://www.cplusplus.com/reference/cstring/strcpy/
        
        其作用就是将第2个参数的字符串拷贝到第一个参数的字符数组中，所以要保证第1个
        参数的字符数组大小够用。注意：第2个参数的结束符 '\0' 也会拷贝过去哦。
        
        返回值是第一个字符串的首地址

    3. 字符串比较函数：strcmp

        该函数的定义原型为：
        
        int strcmp (const char str1[], const char str2[]);
        
        相关的说明在这里：http://www.cplusplus.com/reference/cstring/strcmp/
        
        其作用就是对比第1个和第2个参数的字符数组字符串，逐个字母比对，直到字符
        串结束。即比较每个字母的ASCII码值。
        
        当第1个参数大于第2个参数，返回 > 0 的数，当第1个参数小于第2个参数，返回
        < 0 的数，当第1个参数和第2个参数相等，返回0

    4. 字符串求长度函数：strlen

        该函数的定义原型为：
        
        size_t strlen (const char str[]);
        
        相关说明在这里：http://www.cplusplus.com/reference/cstring/strlen/
        
        其作用就是求得参数字符串的长度，通过返回值返回。

