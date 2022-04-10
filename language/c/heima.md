
## const 修饰指针

```
int a = 10;
int b = 10;
int *p = &a;
```


### 1. 常量指针

```
const int a = 10;           // 常量指针，指针的指向可以修改，但是指针指向的值不可以修改
int b = 10;
    *p = 20;                // 错误
    p = &b;                 // 可以
int *p = &a;

const int * p = &;
```



### 2. 指针常量

```
int * const p = &a;         // 指针常量, 指针的指向不可以修改，但是指向的值可以修改
*p = 20;                    // 可以
p = &b;                     // 错误
```


### 3. 常量指针常量

```
const int * const p = &a;   // 都不可以修改
```


## 指针和函数

1. 值传递


2. 引用传递



## 内存4区

la : 0x7ffcfd8c3798
lb : 0x7ffcfd8c3794
str: 0x7ffcfd8c3770
cla: 0x7ffcfd8c3790

g_a: 0x55c677784078
g_b: 0x55c67778407c
s_a: 0x55c677784080
s_b: 0x55c677784084
cga: 0x55c677782008


全局区
    全局变量
    静态变量
    全局常量
        全局字符串常量
        const 修饰的全局变量


非全局区
    局部变量
    局部常量


1. 代码区

    运行前即存在

    函数体的二进制
    
    特点:
        1. 共享
        2. 只读

2. 全局区

    运行前即存在

    1. 全局变量
    2. 静态变量
        static int a = 1;

        内部静态变量
        全局静态变量

    3. 常量
        1. 字符串常量
            printf("%p\n","hello"); // h的地址
        1. const 修饰的变量
            1. const 修饰全局变量
            1. const 修饰局局变量

    程序结束后，由操作系统来释放


3. 栈区

    运行后存在
    
    编译器自动分配和释放, 函数的参数，局部变量等

    不要返回局部变量的地址(函数执行后自动释放，函数中的变量在函数执行完毕后就不存在了)

    ```
    int * say(){
        int a = 10;
        return &a;          // warning: address of local variable ‘a’ returned [-Wreturn-local-addr]
    }

    int main(){
        int * p = say();
        cout << *p << endl;
        cout << *p << endl;
    }
    ```

    栈区比较珍贵， 不能申请太多
        int a[1024*1024*2]          // 会报错段错误

4. 堆区

    运行后存在
    
    程序员分配和释放

    cpp 中主要利用 new 在堆区开辟内存

    ```
    void say(){
        int *p = new int(3);            // p 是局部变量，放在栈区，返回的是地址,数据(new int(3))放在堆区, p 不能被释放
        return p;
    }

    int main(){
        int *p = say();
        cout << "p --> " << p << endl;
    }
    ```

    c 是通过 malloc 实现

    ```
    char * a = malloc(1);
    if(!a){return}              // 申请失败
    free(a);                    // 手动释放内存
    a = NULL;
    ```

    char a[10] = "\0";          // 其它元素也是 \0



