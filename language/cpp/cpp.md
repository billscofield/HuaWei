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


### 1. 变量作用范围

1. 局部变量

2. 全局变量

### 2. 变量的引用

变量的引用，跟指针有点像。他是C++对于C语言的一个重要的扩充。C语言中没有引用，
C++有引用，而且C++中更建议大家多用引用少用指针。

变量的引用就是一个变量的别名，变量和变量的引用代表着同一个变量。例如：

    ```
    int a = 5; //语句1
    int& b = a; //语句2
    int* p = &a; //语句3
    ```

a 和 b 的地址是一样的, printf("%p -> a\n%p -> b",&a,&b);

这里面a是一个普通的int类型变量，b呢，就是变量a的一个引用，p呢就是指向变量a地址
的一个指针变量。

其中语句2中的 & 符号是引用的声明符号，不是取地址哦，语句3中的 & 符号确实是取地
址符。

如何来区分呢？大家记住：紧跟在数据类型后面的&符号就是引用的声明符号，其他情况都
可以认为是取地址符号。


1. 注意:

    1. 引用不是一种独立的数据类型，引用只有声明，没有定义。
        
        **必须先定义一个变量，之后对该变量建立一个引用。**
        
        也就是说有变量才有变量的引用，不可能先声明一个引用而不去引用任何变量，这点
        跟指针不同，指针可以先声明，之后的任意时刻指向某个变量的地址，引用就不是；
        
        例如：
            > int &b; //先声明定义一个引用是错误的

    2. 声明一个引用时，必须同时对其初始化，即声明该引用代表哪一个变量。
        
        这个跟第①点要表达的意思一样。
        
        有一种例外的情况，当一个函数的参数是某个变量的引用时，形参不必在声明中
        初始化，他的初始化是在函数调用时的虚实结合实现的，即作为形参的引用是实
        参的别名；
        
        > void swap(int& a, int& b);

    3. **声明一个引用后，不能再让其作为另一个变量的引用了。**例如：
        
        ```
        int a1 = 2, a2 = 5;
        int& b = a1; //正确
        int& b = a2; //错误
        
        b = a2;      // 是将a2的值赋值给b,既a1
        ```

    4. 不能建立引用数组，例如：
        
        ```
        int a[5] = {0};
        int& b[5] = a; //错误
        int& c = a[0]; //正确（C++新标准支持）
        ```

    5. 可以建立引用的引用（C++新标准支持），也可以建立引用的指针，例如：
        
        ```
        int a = 3;
        int& b = a; //正确
        int& c = b; //正确
        int* p = &b; //正确，得到的是变量a的地址
        *p = 5;
        c = 6;
        ```

2. 引用和指针的联系：

    关于引用的性质，如果在程序中声明了b是变量a的引用，实际上在内存中为b开辟了一
    个指针型的存储单元，在其中存放变量a的地址，输出引用b时，就输出b所指向的变量
    a的值，相当于输出*b。

    引用其实就是一个**指针常量**，他的指向不能改变，只能指向一个指定的变量。所
    以，引用的本质还是指针，所有引用的功能都可以由指针实现。

    C++之所以增加引用的机制，是为了方便用户，用户可以不必具体去处理地址，而把引
    用作为变量的“别名”来理解和使用，而把地址的细节隐藏起来，这样难度会小一些。

    引用的具体使用：
    不用指针，用引用的方式实现 swap 函数，功能是交换两个整形变量的值，实现如下：

        ```
        void swap(int& a, int& b)
        {
            int t = a;
            a = b;
            b = t;
        }
        ```

    跟指针能达到一样的效果。



### 3. new 和 delete 动态分配内存

C++ 中的 new操作符 和C语言中的 malloc 函数类似，如果你不主动 delete 掉这段申请
的内存的话，它会一直存在，直到进程结束后系统会回收掉这段资源

而如果你delete掉这段申请的内存，则这段申请到的内存的生命周期为从你new（申请一段
内存）到你delete（释放掉这段内存）这段时间。


C语言中是使用 malloc 和 free 两个函数来进行动态内存的申请和释放的，C++用引入了
更为智能的 new 和 delete 操作符来进行内存的申请和释放，举例：

    ```
    # C语言中使用 malloc 来申请一个int类型变量的内存
    nt* p = (int*)malloc(sizeof(int)); 
    *p = 5;
    free(p);


    # C++ 中使用 new 来申请一个int类型变量的内存
    int* p = new int(5);
    delete p;                                                   //删除变量


    # 使用new申请一个包含5个int元素的数组
    int* p = new int[5];
    delete [] p;                                                //删除数组
    delete[] p;                                                //删除数组


    # 结构体
    Student*  liming = new Student{"liming",23,EGender};        // 用大括号

    ```




## 数据类型

### 1. 数组

1. 字符数组
    
    char s[]="hello world";
    cout << char << endl;


### 2. 结构体 struct

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






### 3. 枚举类型 enum

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


### 4. 用 typedef 类型声明新的类型名字：

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



### 5. 类类型 class




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




## 面向对象

### 1. 对象的封装与信息屏蔽

对一个对象进行整理，我可以决定哪些东西可以让别人看到，哪些东西不想让别人看到。

封装是面向对象的程序设计中的一个特点。这里面的封装性有两方面的含义：

    1. 一方面就是将这个对象相关的属性和行为封装在对象中，集成在对象中，形成一个
       基本单位，各个对象之间相互独立，互补干扰。

    2. 另外一方面就是对象中的某些实现细节对外界屏蔽，隐藏内部实现的细节，只提供
       基本可用的函数接口，让外界调用。这样做也有利于数据的安全。

### 2. 抽象

抽象就是归类，或者说分类。按照类别把世间万物给归类。比如，男人，女人，是两个类
别。男人，女人又可以统称为人类，人类和狗可以不可以归类呢？当然也可以，都可以说
是哺乳动物，对不对？这就是归类，实际上这就是抽象。

抽象的作用就是表示同一类的事物本质。

C++中，类就是对象的抽象，而对象就是类的特例，即，类的具体表现形式。


### 3. 继承与重用 

### 4. 多态性：

面向对象编程中的多态性，主要指的是对同一类别的不同对象调用同一个行为或者函数的时候，表现不同。

在C++中多态性指的是由继承而产生的不同的派生类，派生类对象对同一行为调用会做出不同的响应。

### 5. 类的声明

C++中声明一个类类型跟声明一个结构体类型很像。例如，咱们之前讲解的声明一个结构体的类型如下：

```
struct Student
{
    string name;
    int num;
    char sex;
    int age;
};
```

C++中对结构体在基于C语言中的重要扩充就是可以添加函数了，类class也是一样，例如：

```
class Student
{
    string name;
    int num;
    char sex;
    int age;

    void print_name()
    {
        cout << "name = " << name << endl;
    }
};
```


### 6. 成员访问限定符：

C++针对类的成员，设定了三种方式的访问限定符：public、private、protected（用的不
多）

1. public：意为共有的，公开的，公用的 成员，既可以被本类中的成员函数引用，也可
   以被类的作用域的其他函数所引用，即从类的外部是可以调用的；例如，我家的房子就
   好比是一个类，如果来客人了，那么我可能招呼客人到客厅，这个客厅就是public类型
   的成员，外部可以访问，客人也可以到客厅中喝水，看电视等等；

2. private：(default)意为私有的，私生的 成员，只能被本类的成员函数所引用，类外部不能调用
   （友元类可以，这个以后说明），例如，我家的房子就好比是一个类，卧室就是
   private类型的成员，是一个相对隐私的地方。如果来客人了，我不希望客人访问我的
   卧室，除非经过我的允许（让成员函数去访问）；

3. protected：意为受保护的成员，不能被类外访问，这点类似private，但是可以被派生
   类的成员函数访问，有关派生类的说明，以后会讲解。


    ```
    class Student
    {
        public:
            string name;
            int num;
            int age;
            
        private:
            char sex;
            
        public:
            void print_name()
            {
                cout << "my name is " << name << endl;
            }
    };

    CStudent liming = {"liming",23,'m'};
    liming.print_name();
    ```


class默认的成员访问限定符是private，struct默认的成员访问限定符是public



### 7. 类的成员函数 

1. 类的普通成员函数

    必须由该类的实例化对象去调用。

2. inline 内联函数

    际上inline内联函数是从C语言的宏发展而来的。例如，程序main函数中直接执行以下
    三行代码：

    ```
    int a = 5;
    ++a;
    int b = a + 3;
    ```

    和将该三行代码封装成一个函数让main函数调用的开销是完全不一样的。函数调用的
    过程中需要将参数压栈等等操作

    C语言中可以用宏来实现一些相对简单的函数，例如：
        
        > #define MAX_NUM(x, y) (x > y ? x : y)

    调用的时候代码可以这样写：
        
        > int ret = MAX_NUM(3, 6);

    调用的时候感觉 MAX_NUM 像个函数，但是他是个宏，宏跟函数的区别是，在**编译**
    阶段就将宏的代码展开直接替换调用宏的地方。所以省去了函数调用的压栈、出栈等
    开销。所以执行效率方面要比函数高。


    宏定义比较复杂,代码的可阅读性会变差。

    所以C++中引入了inline内联函数这么个东西，用inline关键字声明的函数，可以在调
    用的时候，将函数的代码直接嵌入到调用的地方，所以大大的减少了函数调用的开销，
    提高了效率。

    ```
    class Student
    {
        public:
            string name;
            int num;
            int age;
        
        private:
            char sex;
            inline int max_num(int x, int y)            // 显示生明
            {
                return x > y ? x : y;
            }
            
        public:
            int get_max_num(int a, int b, int c)
            {
                int max_ab = max_num(a, b);
                return max_ab > c ? max_ab : c;
            }
            
            void print_name()
            {
                cout << "name = " << name << endl;
            }
    };
    ```

    默认情况下，在类体中直接定义/实现的函数，C++会自动的将其作为inline内联函数
    来处理，所以类似上面的代码：max_num、get_max_num、print_name 函数都会被看成
    是 inline 内联函数。

    而在类体外部定义的函数C++则会将其作为普通的类的成员函数来处理。那么如何在类
    体外部定义成员函数呢，接着往下看！

    
3. **类的声明和实现分离**

    一般情况下，可以把类的声明和实现都写在一起

    随着类的功能越来越多，类中的成员变量和成员函数也是越来越多，类的代码长度就
    越来越大，而且随着长度的增加不太便于阅读，层次不清晰，让人一眼望过去就一大
    面。那怎么办呢？

    好的做法就是将类的声明和成员函数的定义分离开，成员函数的声明放在类的内部，
    实现或者定义放在类的外部，加上作用域限定一下就行，类似下面这样：


    ```
    //类的声明
    class Student
    {
        public:
            string name;
            int num;
            int age;

        private:
            char sex;
            int max_num(int x, int y);

        public:
            int get_max_num(int a, int b, int c);
            void print_name();
    };


    // 类的成员函数的实现, **类的作用域修饰**
    int Student::max_num(int x, int y)
    {
        return x > y ? x : y;
        
    }

    int Student::get_max_num(int a, int b, int c)
    {
        int max_ab = max_num(a, b);
            return max_ab > c ? max_ab : c;
            
    }

    void Student::print_name()
    {
        cout << "name = " << name << endl;
    }

    ```

    1. 在类内部进行声明
    2. 在类外部进行定义

4. 使用多文件分离类的声明和实现

    将类的声明放到 .h 头文件中，将类的实现放到 .cpp 实现文件中，谁要使用这个类，
    就 include 包含 .h 类的头文件就可以啦


5. 内存对齐

    类的大小,会大于成员变量相加,是因为内存对齐, 可以进行关闭,就是对齐设置为1

    成员函数不占用存储空间

    ```
    #pragram pack(push)
    #pragram pack(1)
    #pragram pack(pop)
    ```

6. this

    在调用成员函数的时候，函数如何区分是哪一个对象调用的呢？

    在每一个成员函数中都包含一个特殊的指针，这个指针的名字是固定的，称为 this，
    它也是C++中的保留关键字，它是指向本类对象的指针，它的值是当前被调用的成员函
    数所在的对象的起始地址。

    ```
    class Student
    {
        public:
            char name[50];
            int num;
            int age;
            
        public:
            void set_age(int age)
            {
                this->age = age;            // this->age
            };
    };
    ```

7. 什么是构造函数？

    构造函数是一种特殊的成员函数，与其他成员函数不同，不需要用户来主动调用它，
    构造函数会在对象被建立时自动被调用的。作用就是用来处理对象的初始化操作。


    构造函数的注意事项：

    1. 构造函数的名字必须与类名同名，不能随意命名，这样的话才能让编译器认为该函
       数是构造函数，而不是类的普通成员函数；
        
    2. 构造函数不具有任何类型，不返回任何值，连 void 都不是；
        
    3. 构造函数不需要用户调用，也不应该被用户调用，它是对象建立的时候自动被系统
       调用，用来初始化刚刚建立的对象的；
        
    4. 如果用户没有定义自己的类的构造函数，那么系统会自动生成一个默认的构造函数，
       只不过该构造函数的函数体是空的，也就是什么都不做。


        ```
        方式一
        
        class CStudent{
            public:
                
            public:
                CStudent::CStudent(){
                    this->name = "liming";
                }
        }; 
        

        ---
        
        方式二
        
        class CStudent{
            public:
                
            public:
                CStudent();
        }; 
        
        CStudent::CStudent(){
            
        }


        CStudent liming;
        cout << liming.name << endl;
        ```


    构造函数中的参数初始化方式二:**参数初始化表**

    ```
    class CStudent
    {
    public:
        char name[50];
        char sex;
        int num;
        int age;
        
        CStudent(char* pname, char t_sex, int t_num, int t_age);
    };

    ---

    CStudent::CStudent(char* pname, char t_sex, int t_num, int t_age) :sex(t_sex), num(t_num), age(t_age)
    {
        strcpy(name, pname);
        
    }
    但是我喜欢构造函数的参数和真正的参数一致, 这个不太符合我的习惯
    ```




8. 函数的重载与默认参数

    C++允许同一函数名定义多个函数，这些函数的参数类型和个数可以不相同，而且至少
    要有一个不相同，如果都相同的话就会报重复定义的链接错误了。使一个函数名可以
    多用。

    ```
    int max_num(int a, int b);
    float max_num(float a, float b);

    ```

    重载函数的参数个数、参数类型、参数顺序 三者中必须至少有一种不同（不然会产生
    调用疑惑）。函数的返回值类型可以相同也可以不同。

    单纯返回值类型不同的两个同名函数不能构成函数重载，会报链接错误。

9. 函数默认参数

    1. 在函数声明的时候指定，如果没有函数的声明则可以放在函数的定义中，但是声明
       和定义只能选一个
        
    2. 从第一个有默认值的参数开始，后面的所有参数必须都有默认值才行
        
    3. **调用的时候**如果**要自定义非第一个默认值**的参数，那么前面所有的参数都
       要明确的写上默认值才行
        
    4. 从使用角度来说函数的默认值比重载更方便，从函数内部实现角度来说比函数的重
       载更复杂

    
    函数的默认参数对函数重载所造成的歧义

    ```
    int get_min_max(int src[], int* max_v=NULL, int* min_v=NULL){};


    int get_min_max(int src[], int arr_len)
    {
        int var_max = src[0];
        for (int i = 1; i < arr_len; ++i)
        {
            if (var_max < src[i]) var_max = src[i];
        }
        return var_max;
    }
    和上边的有歧义
    ```


10. 析构函数

    在C++中析构函数的名字跟类名相同，并且前面带上一个取反的符号~，表达的意思也
    就是跟构造函数的过程相反

    默认情况下，如果类的设计者没有自己定义析构函数，那么编译器会自动为该类生成
    一个默认的析构函数，只不过函数体是空的，也就是什么都没做。所以，如果需要在
    对象被删除的时候做一些操作的话，那么就得自己定义析构函数喽。

    以下几种情况会自动调用析构函数：

        1. 如果在一个函数中定义了一个局部变量的对象，那么当这个函数执行结束时也
           就是该变量对象生命周期结束的时候，所以析构函数会被自动调用；
        
        2. 全局变量或者static类型的变量，他们的生命周期一般是在程序退出的时候，
           这时候该对象的析构函数才会被调用；
        
        2. 如果是用new操作符动态的创建了一个对象，只有当用delete进行释放该对象
           的时候，析构函数才会被调用；

    构造函数是新建对象吗？回答：不是，而是在对象被创建出来之后自动被调用的，用
    来初始化相关信息的函数。

    同理，析构函数也不是用来删除对象的，而是当对象被删除的时候自动会被调用的，
    用来做一些对象被删除之前的清理工作。


