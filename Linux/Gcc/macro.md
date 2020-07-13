define来定义数值类型的数据，一般只是用来定义 常量 

要定义一些变量，则可以使用c语言中const这个关键字

const 修饰的数据是有类型的，而define 宏定义的数据没有类型

为了安全，我建议你以后在定义一些宏常数的时候用const代替，编译器会给const 修饰的只读变量做类型校验，减少错误的可能。

const修饰的不是常量而是readonly 的变量, const 修饰的只读变量不能用来作为定义数组的维数，也不能放在case 关键字后面。







; 空语句

```
SQR(x) x*x
```

单纯的替换

```
#define SQR(n) n*n

int main() {
    printf("%d\n",SQR(10+1));
}
结果是21(10+1*10+1)

更好的写法是
    #define SQR(n) (n)*(n)

2000/SQR(10)
结果是2000

更好的写法是
    #define SQR(n) ((n)*(n))


#define max(a,b) (((a)>(b))?(a):(b))



```
