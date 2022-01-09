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

---

#define MAX(a,b)    ((a) > (b) ? (a) : (b)          // this is right
    
    比较 i++, 和 j++, 


#define MAX(a,b)    ({int A=a, B=b; ((A) > (B) ? (A) : (B));})


#define MAX(a,b)    ({typeof(a) A=a, B=b; ((A) > (B) ? (A) : (B));})


```



##

[存储类型] 数据类型 标识符 = value

           type     name   = value

    1. auto     : 默认，自动分配空间，自动回收空间

    1. static   : 静态型, 自动初始化为0值或空值, 有继承性, 也可修饰函数, 只能在当前文件中使用
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
    extern int i;

    void proj.c.fun(void){
        printf("%d\n",i);
    }

```



生命周期和作用范围

    全局变量和局部变量




    > __FUNCTION__, __LINE__


man 3 fopen  中最早的 error number 就是全局变量


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




## gcc

gcc 
    -Wall:   all warning

## make


man 2 stat
    struct stat 结构体
        st_mode 权限    



## 输入、输出专题

标准IO, 文件IO

格式化输入输出函数  printf()    scanf()
    man 3 printf
    scanf("%s")     %s 是危险的, 越界

字符输入输出函数    getchar()   putchar()
    man 3 getchar

字符串输入输出函数  gets()  puts()
    man 3 gets  
    gets 很危险

        gets()  reads  a  line  from  stdin  into  the buffer pointed to by s until
        either a terminating newline or EOF, which it replaces with a null byte
        ('\0').  No check for buffer overrun is performed (see BUGS below).

        fget

        getline 动态内存, 不会引起越界, 但是是 gun libc



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
