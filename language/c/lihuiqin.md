[link](https://www.bilibili.com/video/BV18p4y167Md)


## stdlib.h

    > #include <stdlib.h>   -> exit(0); 代替 return 0;   man 3 exit

    exit(0) 结束当前进程

    malloc()

    > #include <stdbool.h>
        false
        true


vim 中 ctrl p  自动补全

shift k : man 手册帮助


``` 注释0

#if 0

#endif

```

算法: 流程图, NS图, 有限状态机FSM

防止写越界，防止内存泄漏




浮点数与0的比较
    fabs(x-0) < 1e-6


不同形式的零
    0
    '0'
    "0"
    '\0'

## math.h

gcc -c a.c -o a.o
gcc a.o -lm

## 常量

整型常量
实型常量
字符常量
字符串常量
标识常量
    > #define


## 带参数的宏

```
#define MAX(a,b)    (a > b ? a : b)

int a = 1, b = 2;
printf("%d\n",MAX(a,b))

MAX(i++,j++)

---

#define MAX(a,b)    ((a) > (b) ? (a) : (b)          // this is right
    
    比较 i++, 和 j++, 


#define MAX(a,b)    ({int A=a, B=b; ((A) > (B) ? (A) : (B));})


#define MAX(a,b)    ({typeof(a) A=a, B=b; ((A) > (B) ? (A) : (B));})


```



##

[存储类型] 数据类型 标识符 = value

    存储类型    type     name   = value

    1. auto     : 默认，自动分配空间，自动回收空间
        栈空间

    1. static   : 静态型, 自动初始化为**0值**或**空值**, 有继承性, 也可修饰函数, 只能在当前文件中使用
        修饰全局变量,
        类似 private 属性

        ```
        void funct(void)
        {
            static int x = 0;
            x = x+1;
        }
        
        ```
    1. register : 寄存器类型, 建议型, 还是由 gcc 决定, 
        只能用来定义局部变量
        数据大小有规定
        寄存器没有地址
        
    1. extern(说明型): 说明型, 也不能改变被说明的变量的值或类型

```
main.c
    int i = 10;
    proj.c.fun()
    printf("%d\n",i);


proj.c
    extern int i;               // 其实可以不用写, 类型都可以不用写
    extern i;                   // 类型都不写, 新标准默认为int型了, 会出错的

    void proj.c.fun(void){
        printf("%d\n",i);
    }

```


生命周期和作用范围

    全局变量和局部变量

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int i = 1000;

    int main(void){
        int i = 100;
        {
            int i = 10;
            printf("%d\n",i);
            exit(0);
        }
        
    }
    ```

    > __FUNCTION__, __LINE__


man 3 fopen  中最早的 errno(error number) 就是全局变量, 现在不是了


|   +----------------------------------------------------------------+
|   |          |    局部变量                   |      外部变量       |
|   +----------+------------------+------------+------------+--------+
|   | 存储类别 | auto | register  | 局部static | 外部static |   外部 |
|   +----------+------------------+------------+------------+--------+
|   | 存储方式 |       动态       |             静态                 |
|   +----------+------------------+----------------------------------+
|   | 存储区   |动态区|  寄存器   |          静态存储区              |
|   +----------+------------------+----------------------------------+
|   | 生存期   |函数调用开始指结束|          静态存储区              |
|   +----------+------------------+----------------------------------+
|   | 作用域   |定义变量的函数或复合语句内     |本文件      |其他文件|
|   +----------+------------------+----------------------------------+
|   | 赋初值   |每次函数调用时    | 编译时赋初值,只赋值一次          |
|   +----------+------------------+----------------------------------+
|   | 未赋初值 |不确定            | 自动赋初值0或空字符              |
|   +----------+------------------+----------------------------------+



## 表达式和语句

加上分号就是语句


## 运算符

1. %
    两边都必须是整型

1. 逗号运算符

1. 位运算

    >>
        a = a << 1;
    <<
    &
    |
    ^
    ~   取反


    num = num | 1<<n
    num = num & ~(1<<n)

1. 分量运算符(.  ->)

1. 

## gcc

gcc 
    -Wall:   all warning

## make


man 2 stat
    struct stat 结构体
        st_mode 权限    

    man 2 inode
        S_IROTH     00004   others have read permission
        S_IWOTH     00002   others have write permission
        S_IXOTH     00001   others have execute permission



## 输入、输出专题

标准IO, 文件IO

1. 格式化输入输出函数  printf()    scanf()

    man 3 printf
    scanf("%s")     %s 是危险的, 越界

    d,i         10进制
    x,X         16进制无符号整数
    o           8进制无符号整数
    c           单一字符
    e,E         指数形式浮点小数
    g           e/f 中较短的一种
    %%          %
    -           左对齐
    +           显示正负符号
    #           8进制,16进制显示前导符号
    l           d,o,x,u :       long
    l           e,f,g   :       double

    char a[] = "helloworld";
    printf("%.5s\n",a);

    12 是没有单位的, int, long short等就是单位
    12L/12LL 也是有单位的

    缓冲区
        1. 程序结束
        2. 强制输出缓冲区
        3. 缓冲区满

    scanf("%s",a);         // %s 很危险,不会检查越界

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(void){
        int a;
        while(1){
            int res = scanf("%d",&a);
            if(res == 1){
                printf("a is : %d\n",a);            // 没有 if 的判断的话,如果输入a, 会陷入死循环, 希望得到 %d, 但是输入'a', 则持续输入缓冲区中的合法值
            }else{
                break;
            }
        }
            exit(0);
    }
    ```

    scanf 返回不包括 \0


2. 字符输入输出函数    getchar()   putchar()

    man 3 getchar

    char a = getchar();


    fputc(), putc(), and putchar() return the character written as an unsigned char cast to an int or EOF on error.

    puts() and fputs() return a nonnegative number on success, or EOF on error.
        
        没有回车，还需要手动写个回车

    fgetc(), getc(), and getchar() return the character read as an unsigned char cast to an int or EOF on end of file or error.



3. 字符串输入输出函数  gets()  puts()

    man 3 gets  

    **gets() 很危险**

        gets()  reads  a  line  from  stdin  into  the buffer pointed to by s until
        either a terminating newline or EOF, which it replaces with a null byte
        ('\0').  No check for buffer overrun is performed (see BUGS below).

        fget

        getline 动态内存, 不会引起越界, 但是是 gun libc


    puts() writes the string s and a trailing newline to stdout.

    数字是有单位的, int , long 

    ```
    #define SEC_YEAR (365LL * 24LL * 3600LL)
    ```


    变参函数, printf



    ```
    printf("xxxx")              // 输出不了, 要加上 \n
    while(1);
    printf("yyyy")
    ```

    scanf("%s") 很危险，会发生越界行为
        ```
        char name[3];
        scanf("%s",name); // 应该是只能输入2个字符，但是可以输入很多
        
        ---
        
        int i;
        while(1)
        {
            scanf("%d",&i);
            printf("i = %d\n",i);   //如果输入 'a', 死循环
        }

        On  success, these functions return the number of input items successfully matched and assigned;

        ---
        
        int i;
        while(1)
        {
            int ret = scanf("%d",&i);
            if(ret !=1 )
                break;
            printf("i = %d\n",i);   //如果输入 'a', 死循环
        }
        ```



        scanf("%d", &i)
        scanf("%*c%c",&ch)          抑制符, 吃掉一个符号

        ```
        #include <stdio.h>¬
            
        int main(void){¬
            
            int a;¬
            char b;¬
            
            printf("Plz input a int and a char:\n");¬
            scanf("%d",&a);¬
            getchar();¬
            scanf("%c",&b);¬
            
            printf("int a is |%d|, char b is |%c|\n",a,b);¬
            
            return 0;¬
        }¬

        ```


        ```gets and puts
        int main(void){¬
            char a[3];¬
            
            gets(a);¬
            
            puts(a);¬
            
            return 0;¬
        }
        ```

## 流程控制

有限状态机
    switch
        case 常量/常量表达式

if-goto
    无条件跳转
    不能跨函

```
int score;
printf("Plz input score:");
scanf("%d",&score);

if(score == 100){
    goto a;
}else if(score == 200){
    goto b;
}
a:
    printf("100");
b:
    printf("200");
}

```

## 数组

### 1. 一维数组

    [存储类型] 数据类型 key[]

    变长数据要看编译器支持否

    数组名：表示地址的常量, 数组的起始位置
    不检查越界





### 2. 二维数组
### 3. 多维数组


## 共用体

共用同一块空间, 里边那个最大就占用多少

就像单选按钮, 而结构体就像复选项

类型描述

    ```
    union 共用体名{  
        数据类型 成员名1;
        数据类型 成员名2;
        ...
    };
    ```


    ```
    union test_un{
        int i;
        float f;
        double d;
        char ch;
    };

    int main(){
        union test_un a;    //一个时间只有一个成员可以生效
        a.f = 1.1;
        printf("%d\n",sizeof(a));
        printf("%f\n",a.i);
    }
    ```

成员引用
    变量名.成员名
    指针名->成员名


x86 大部分是小端

位域
    共用体的一种形式，不是以字节为单位，而是以位为单位

    ```
    union{
        struct{
            char a:1;       // a 占用1bit
            char b:2;       // b 占用2bit
            char c:1;       // c 占用1bit
        }x;
        int y;
    }w;
    ```

    因为大小端的问题, 移植性不强

    +---+---+---+---+---+---+---+---+
    | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
    +---+---+---+---+---+---+---+---+

    w.y = 1;
    printf("%d\n",w.x.a)



## 枚举

    enum 标识符{
        成员1,
        成员2,
        成员3
    };

    ```
    enum day{
        mon = 1,
        tus,
        wes,
        thr,
        fri,
        sat,
        sun
    };

    enum day a = wes;
    ```


    ```
    enum{
        STATE_RUNNING=1,
        STATE=CANCELED,
        STATE_OVER
    };

    struct job_st{
        int id;
        int state;
        time_t start,end;
    };

    int main(void){
        struct job_st jobs;
        获取任务状态
        job1.state = STATE_OVER;
        switch(job1.state){
            case STATE_RUNNING: do sth;break;
            case STATE_CANCELED: do sth;break;
            case STATE_OVER; do sth;break;
            default:abort();
        }
    }

    gcc -E 可以看到是没有变化的，当作宏来处理，但是比宏的好处是，不会变成宏值
    ```


## 动态内存管理

malloc
    man 3 malloc

ralloc

realloc

谁申请，谁释放
    alloc

free
    释放


1. malloc
    
    ```
    void *malloc(size_t size);
    ```
    
    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(){
        int* p = NULL;
        p = malloc(sizeof(int));
        if(p == NULL)
        {
            printf("error");
            exit(1);
        }
            
        *p = 10;
        free(p);
    }
    ```


2. calloc

    ```
    void *realloc(void *ptr, size_t size);
    ```

3. realloc

    ```
    void *realloc(void *ptr, size_t size);
    ```

    

## 指针

指针有两个运算, 取地址和取值

还可以作 ++ -- 比较

指针的大小在某一个平台下是一定的, 一般是 8


```
*q -> *(&p) -> p
p 即 &a

**q -> **(&p) -> *p -> *(&a) -> a
```

空指针
    NULL 是一个宏


void 指针类型

    > void *memcpy(void *dest, const void *src, size_t n);


    ```
    int a[3] = {1,2,3};
    int *p = a;
    int i;

    a[i] = *(a+i) = *(p+i) = p[i]
    &a[i] = a+i   = p+i    = &p[i]

    *a <-> *(a+0)
    sizeof(a)/sizeof(*a)

    a 是一个数组名,是一个存方地址的常量
    p 是一个变量, 存放地址的变量
    ```




    ```
    int main(void){

        int a[3];
        int *p = a;
        
        for(int i=0; i<3; i++){
            scanf("%d",p++);
        }
        
        for(int i=0; i<3; i++){
            printf("%d\n",a[i]);
        }
        ---或者---
        p = a;
        for(int i=0; i<3; i++){¬
            printf("%p -> %d\n",p,*p);¬
            p++;¬
        }¬
    exit(0);
    }
    ```


    ```
    int main(void){

        int *p = (int [3]){1,2,4};          // **无名数组**
        
        for(int i=0; i<3; i++)
            printf("%d\n",p[i]);
        exit(0);
    }
    ```

    ``` 练习
    int main(void){

        int a[] = {5,3,9,1,8};
        int y;
        int *p = &a[1];
        y = (*--p)++;
        printf("%d\n",y);                   // 输出 5
        printf("%d\n",a[0]);                // 输出 6
        exit(0);
    }
    ```

    **是次内层**

    ```
    int main(void){

        int a[2][3] = {1,2,3,4,5,6};
        
        for(int i=0; i<2; i++){
            for(int j=0; j<3; j++){
                printf("%p -> %d\n",&a[i][j],a[i][j]);
                printf("%p -> %d\n",*(a+i)+j,*(*(a+i)+j));          //!!!
            }
            printf("\n");
        
        }
        
        printf("%p ->\n",a);
        printf("%p ->\n",a+1);
        
        exit(0);

    }
    ```




## 函数

### 1. 函数的定义

数据类型  函数名([形式参数说明表])

1. 定参

2. 变参, eg. printf

    int printf(const char *format, ...);

3. main参数

    (int argc, char *argv[])

    int argc: 多少个参数

    char * argv[]: 参数列表, 指针数组


4. 返回值

    一个进程的返回状态是给它的父进程看的

### 2. 函数的传参

### 3. 函数的调用

### 4. 函数与数组

### 5. 函数与指针

1. 指针函数
    
    返回值是指针

    > 返回值 * 函数名(形参)
    > 如 int * fun(int a);

2. 函数指针

    指向函数的指针

    > 类型 (*指针名) (形参)

    > 如 int (*p)(int)

3. 函数指针数组
    
    > 类型 (*数组名[下标])(形参)

    int (*funcp[2])(int,int)
        int (int,int) * funcp[2]

[指向指针函数的函数指针数组](https://www.bilibili.com/video/BV18p4y167Md?p=59&spm_id_from=pageDriver)

    > int *(*funcp[N])(int)


### 6. 函数与一维数组


### 7. 函数与二维数组


## 构造类型

### 1. 结构体

1. 产生和意义

    不像数组，存放不同类型的数据

2. 类型描述

    一般定义在函数外

    ```
    struct 结构体名字{
        数据类型 成员1;         // 不占据空间的
        数据类型 成员2;
        ...
    };                          <--- 这里的分号
    ```

    e.g.

    ```
    struct simple_st{
        int i,j;
        float f;
        char ch;
    }
    ```

3. 嵌套定义

```
#define NAMESIZE 32


struct birthday_st{
    int year;
    int month;
    int day;
};

struct student_st{
    int id;
    char name[NAMESIZE];
    struct birthday_st birth;           // struct birthday_st 数据类型
    int math;
    struct collage_day{
        int year;
        int month;
        int day;
    };
    collage_date;
    int chinese;
};
```

4. 定义变量(变量，数组，指针), 初始化及成员引用

    成员引用
        变量名.成员名

        ```
        #include <stdio.h>
        #include <stdlib.h>
    
        struct simp_st{
            int a;
            int b;
            char c;
        };

        int main(int argc, char *argv[]){
            struct simp_st a = {1,2,'c'};
            a.a = 111;
            printf("%d\n",a.a);
        }
        ```

    可以只初始化部分元素
    
    ```
    struct student_st liu = {.math=99};
    ```

    还可以用指针, 使用箭头 
        指针->成员名
        (*指针).成员名
    
    ```
    struct student_st liu = {.name="liu"}
    struct student_st *pliu = &liu;
    printf("%d %s\n",pliu->id,pliu->name);
    ```

    数组
        ```
        struct student_st liu[2] = {{.name="liu"},{.name="wang"}};
        p = &liu[0];            //
        for(int i=0; i<2; i++,p++){
            printf("%s\n",p->name);
        }
        ```

5. 占用内存空间大小

    内存对齐, 占据大小为 address/sizeof(成员)
    ```
    struct simp_st{
        int i;              0/sizeof(int)   ok->占用4Byte
        char ch;            4/sizeof(char)  ok->占用1Byte
        float f;            5/sizeof(float) no  空
                            6/sizeof(flaot) no  空
                            7/sizeof(flaot) no  空
                            8/sizeof(flaot) ok ->占用4Byte
    };                      所以一共占用13
    ```

    但是也可以不对齐
    ```
    struct simp_st{
        int i;              0/sizeof(int)   ok->占用4Byte
        char ch;            4/sizeof(char)  ok->占用1Byte
        float f;            8/sizeof(float) ok ->占用4Byte
    }__attribute__((packed));               所以一共占用13
    ```

6. 传参
    
    指针方式
       truct simp_st a;
       truct simp_st *p = &a;
       func(p);



### 2. 共用体 union

1. 共用体的产生和意义
    
    多个成员只有一个存在, 例如单选; 而结构体类似多选

2. 类型描述

    ```
    union 共用体名{
        数据类型 成员1;
        数据类型 成员2;
        ...
    };
    ```

3. 嵌套定义

    结构体嵌套共用体或者共用体嵌套结构体

    ```
    struct {
        int i;          //4B
        char ch;        //1B

        union{
            int a;      //4,取4
            char c;     //1
        }un;

        float f;        //4
    };



    union{
        int a;
        double d;
        struct{
            int arr[10];
            float f;
        }c;                 // 44, 取这个
    };


    到底可以做什么

    大：低位保存在高位
    小：低位保存在低位

    32bit 数，高16bit 和低16bit的和
        解法1
            #include <stdint.h>
            uint32_t =0x11223344;
            printf("%s\n",i>>16 + i & 0xFFFF);

        解法2
            
            union{
                struct{
                    uint16_t i;
                    uint16_t j;
                }x;
                uint32_t y;
            }a;
            
            a.y = 0x11223344;
            printf("%d\n",a.x.i + a.x.j);
    ```

4. 定义变量(变量，数组，指针),初始化和成员引用

```
union test_un{
    int i;          // 只占用一块内存空间
    float f;
    double d;
    char ch;
};

union test_un a;

a.f = 3.1;          // 其它值是

printf("%d\n",sizeof(a));   // 输出4
printf("%d\n",a.f);


union test_un *p = &test_un;

变量名.成员名
指针名->成员名
```

5. 占用内存大小

    以最大的成员为准

6. 函数传参(值，地址)

    

7. 位域

    没有实际开发的意义

    ```
    union{
        struct{
            char a:1;       //1bit
            char b:2;       //1bit
            char c:1;       //1bit
        }x;
        char y;             //8bits
    }w;                     //8bits


    w.y = 1;
    printf("%d\n",w.x.a);

    7    6    5    4    3    2    1    0
    +----+----+----+----+----+----+----+----+
    |    |    |    |    |    |    |    | 1  |           // 补码形式存在, 为-1
    +----+----+----+----+----+----+----+----+
                          c    b    b    a
    ```

### 3. 枚举类型

    enum 标识符{
        成员1,      可以赋值，下面的值依次
        成员2,
        成员3
    };


    enum day{
        mon,    // 默认为0
        tue,
        thr,
        wes,
        fri,
        sat,
        sun
    };

    enum state_en{
        STATE_RUNNING = 1,
        STATE_CANCELED,
        STATE_OVER
    };

    struct job_st{
        int id;
        enum stat_en state;
        ...
    };


## 








## 数据结构

线性(有头，无头)
    线性表
        顺序存储的线性表
            e.g. fat文件系统
            数组
        链式存储的线性表
            单链表
                单向循环
                单向不循环
            双链表
                双向循环
                双向不循环
    栈
    队列

树状(有向无环图)
    1:N
    
    递归

图
    N:M

    最短路径


存储形式
    顺序存储
        array
    链式存储
        链表(指针实现)








## 静态库与动态库





## 未看
p32
