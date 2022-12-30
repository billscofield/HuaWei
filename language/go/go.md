
B语言: Ken Thompson 得名于他的妻子 Bonnie

C语言: Dennis Ritchie 

C++ :本贾尼-斯特劳斯特卢普 Bjarne Stroustrup
    
Python: Guido van Rossum

Java James Gosling 詹姆斯-高斯林, 1991年 还叫 Oak, 1994年改名为 Java， 1995年5月正式发布

Javascript: Brendan Eich 布兰登-艾奇

Golang: 
    Google
    Ken Thompson
    Rob Pike(罗勃 派克)
        贝尔实验室 Unix 成员, Plan 9 操作系统成员， 与 Ken Tompson 共事多年， 并共创出 UTF-8
    Robert Griesemer(罗伯特 格瑞史莫)
        V8 引擎

    吉祥物：gopher 囊地鼠（产自北美的一种地鼠）
    起源于2007年
    2009年发布
    速度和开发效率快

    静态，编译型语言
    语法简洁
    强类型

    既有 C 静态语言程序的运行速度，又能达到 Python 动态语言的快速开发 go = c + python

    引入包的概念, 



    **天生支持并发**

    golang的并发执行单元是一种称为 goroutine 的协程

    内存回收(GC)
        自动回收

    编译
        建立在 gcc 基础上的 Gccgo

        针对64位x64 和32位x86 计算机的一套编译器(6g 和 8g)

golang 的学习方向

    区块链(Blockchain Technology) BT

    Go服务器端/游戏软件
        美团后台支撑
        仙侠道（游戏）

    Go分布式/云计算
        K8s
        盛大云CDN
        京东云后台所有服务





环境安装

    去官网选择版本下载  https://golang.org/dl/

    解压, 推荐放在 /opt/ 下

    添加到PATH即可  /opt/go/bin/


    GOROOT:GOROOT就是go的安装路径   /opt/go/
        .zshrc
            GOROOT=/opt/go/
            export GOROOT
            export PATH=$PATH:$GOROOT/bin

    GOPATH
        go install/go get和 go的工具等会用到GOPATH环境变量

        GOPATH是作为编译后二进制的存放目的地和import包时的搜索路径 (其实也是你
        的工作目录, 你可以在src下创建你自己的go源文件, 然后开始工作)。

        GOPATH之下主要包含三个目录: bin、pkg、src
            bin目录主要存放可执行文件; 
            pkg目录存放编译好的库文件, 主要是*.a文件; 
            src目录下主要存放go的源文件

        可以自己在用户目录下面创建一个目录, 如gopath

        export GOPATH=/home/bill/goproject/

        GOPATH可以是一个目录列表, go get下载的第三方库, 一般都会下载到列表的第一个目录里面
        需要把GOPATH中的可执行目录也配置到环境变量中, 否则你自行下载的第三方go工具就无法使用了, 操作如下:
            export $PATH:$GOPATH/bin/



            ```
            export GOROOT=/opt/go/
            export PATH=$PATH:$GOROOT/bin/
            export GOPATH=$HOME/goproject/
            ```

查看go相关环境变量
    go env




GOPATH  
    bin
    pkg
    src
        网站域名 x 作者名 x 项目名


GOPATH
    bin
    pkg
    src
        公司代码仓库名 x 公司内部组织架构 x 项目名 x 模块名



go build -o 
go run 
go install 
    设置 GOBIN



内嵌C语言支持


不足
    包管理，大部分包都在 github 上
    无泛化类型
    所有 Exception 都用 Error 来处理
    对 C 的降级处理，并非无缝，没有 C 降级到 asm 那么完美(序列化问题)




编译执行
    go build hello.go
    ./hello


    go build /root/go/gitee.com/goyougoodthing/src/001/main.go          会在 "命令执行目录" 生成目标文件, 此处是 /


    go build -o 输出文件名 hello.go         //源文件要放在最后

方式二
    go run hello.go


go install 
    go build
    copy 到 bin目目录，当然要首先进行设置   export GOBIN=/root/go/gitee.com/goyougoodthing/bin/

    然后把这个 GOBIN 添加到 PATH 中


交叉编译
    GOOS=linux GOARCH=amd64 go build hello.go   //linux 和 mac
        darwin (macos)


如果是 package main 会编译成可执行文件



**逻辑语句，算数运算等不能在函数外写(语句只能写在函数里)，只能是变量声明**



一条语句后边不用加分号

**import的包没有用到，编译是不能通过的, 变量也是**, 不允许说废话

用了 vim-go ，保存时应该是会自动调用 gofmt




vim-go 是一款go代码高亮和语法检查的插件
当你保存代码时，如果检测到有语法错误，会在底部给出提示。

Plugin 'fatih/vim-go'
let g:go_gopls_enabled = 0

:GoInstallBinaries


gocode是一款go的代码提示插件

YouCompleteMe 
    python install.py --go-completer



注释
    行注释//

    块注释`/**/

    尽量用行注释


格式化代码
    gofmt 文件.go
    gofmt -w 文件.go



逗号 连接
    fmt.Println('aaaa',
        'bbb',
        'ccc'
    )


/opt/go
    src/
    pkg/
    bin/        这个添加到PATH中


### 打印

fmt.Print(xxx)                  不会换行, 最后会打印一个#
fmt.Printf("name is %s", name)  格式化
    fmtpPrintf("%% value:%v\n",a,b)
    %v 任何
    %T 变量类型
        fmt.Printf("%T", a)
fmt.Println(xxx)                最后会换行


### 变量

int
float
string


推荐小驼峰式命名



var i int
i = 10

var i int = 10


变量都有默认值


1. 声明后不赋值，使用默认值
    var i int       //默认零
    var i string    //空

1. 根据值自行判断变量类型
    var num = 10.11     //自动判断为浮点数
    var num = 10        //自动判断为整数

1. 省略 var ，注意 := 左侧的变量不应该是已经声明的，否则会导致编译错误
    name := 'tom'   // var name = 'tom'
    不能用在函数外


匿名变量

    "_"

    不占用命名空间，不分配内存，所以匿名变量之间不存在重复声明(在lua语言中，匿名变量也被叫做 哑元变量)

    多用于占位

函数外的每个语句都必须以关键字开始(var, const, fun等)

#### 多变量声明

不允许存在废话

var n1, n2, n3 int                      //必须要给出类型


var n1, n2, n3 = 100, 'tom', 888        //对应赋值

n1, n2, n3 := 100, 'tom', 888           //对应赋值

全局变量:在函数外定义声明的
    var n1 = 100
    var n2 = 200
    var n3 = 'nihao'

    
    var (
        n1 = 100
        n2 = 200
        n3 = 'nihao'
    )

    var (
        name string
        age int
    )

    import (
        "fmt"
        "math"
    )


不可以重复定义

变量名 值 数据类型



加号
两边都是数值，加法
两边都是字符串，字符串拼接



## 常量

放在全局

1. 普通
const pi = 3.1415926

1. 批量
const (
    numA = 100
    numB = 200
)

1. 漏斗批量
const (
    a = 1
    b           //批量声明常量的时候,若没有赋值，就是和上边一样，漏斗
    c
)


iota 常量计数器，只能在表达式中使用
    iota 在出现的时候被置为零
    const 中每新增一行常量声明将使 iota 计数一次（iota可理解为const语句块中的航索引）。使用iota能简化定义，在定义枚举是很有用

    const a = iota          出现这样的就是为零了，批量设置的时候不会, 批量的时候只要有iota，不论第几个是，第一个为零, 显式赋值的话就用显式值，漏斗赋值的话就用iota
    const b = iota

    fmt.Println(a) 返回零
    fmt.Println(b) 返回零


    const (
        a = iota
        b
        _
        c
    )
    fmt.Println(a)  返回零
    fmt.Println(b)  返回1
    fmt.Println(c)  **返回3**




    const (
        a = iota        -> 0
        b               -> 1
        c = 100         -> 100
        d               -> 100
        e = iota        -> 4
    )


    const (
        d1, d2 = iota + 1, iota + 2     //1, 2

        d3, d4 = iota + 1, iota + 2     //2, 3
    )


定义数量级(简单应用)

const (
    _ = iota
    KB = 1 << (10 * iota)
    MB = 1 << (10 * iota)
    GB = 1 << (10 * iota)
    TB = 1 << (10 * iota)
    PB = 1 << (10 * iota)
)


## 基本数据类型


整型
    无符号 uint8 uint16 uint32 uint64

    uintpr  指针


    8进制
        fmt.Printf("%d\n",077)

    16进制
        fmt.Printf("%d\n",0xff)


浮点数
    默认是 float64 的

    a := 1.2
    fmt.Printf("%T",)

    float32 和 float64 类型的变量不能相互赋值, 类型不一样

复数
    var c1 complex64 = 1 + 2i

布尔值
    默认为false
    不允许将整型强转为布尔型
    布尔型无法参加数值运算，也无法与其他类型进行转换

    ```
    var b2 bool
    fmt.Printf("%T value:%v\n",b2,b2)

    ```

字符串
    使用 UTF-8 实现
    只能用双引号


    多行字符串（元意输出, Python中的 r"d:\a\b"）
        s2 := `hello
        world
        `

    fmt.Sprintf 返回拼接字符串
        ```
        func main() {
             a := `hello`
             b := "world"
             aa := fmt.Sprintf("%s %s", a, b)
             fmt.Println(aa)
        }

        ```

    strings.Split   分割字符串
    strings.Join([],"")

        ```
        import "strings"

        func main() {
            a := `d:\a\you\comple\me`
            aa := strings.Split(a, "\\")
            fmt.Println(aa[1])
        }
        ```

    strings.Contains(ss,"")
    strings.HasPrefix(ss,"")
    strings.HasSuffix(ss,"")

    strings.Index(ss,"")
    strings.LastIndex(ss,"")


    字符
        int32
        单引号

        fmt.Printf("%v",'a')

        英文叫byte类型:uint8
        中文叫rune类型:int32


    修改字符串
        ```
        ss := "白萝卜"
        res := []rune(ss)       或者 res:=[]byte(ss)        rune切片    类型:[]int32
        res[0]='红'             这里要用单引号              int32
        fmt.Printf(string(res))

        ```





占位符
    %T          变量类型
    %v          变量值
    %b          二进制
    %d          十进制
    %o          八进制
    %x          十六进制
    %s          字符串
    %#v         类似python中的repr，如果是string, 添加双引号, 人类可读
    %c          字符(for range)


## math

math.pi
math.MaxFloat32




## 流程控制

### if

```
func main(){
    age := 19
    if age > 10{
        fmt.Printf(">10")
    }else if age >0{
        fmt.Printf(">0")
    }else{
        fmt.Printf("<0")
    }
}

```


if 作用域

```
func main(){
    if age := 19; age > 10{
        fmt.Printf(">10")
    }else if age >0{
        fmt.Printf(">0")
    }else{
        fmt.Printf("<0")
    }


    fmt.Println(age)        //undefined
}
```


### for

没有while

for 初始;条件;

```基本
for i := 0; i < 10; i++ {
    fmt.Println(i)
}
```


```变种1
i:=5

for ;i<10;i++{

}

```


```模仿while
i:=1
for i<10{
    i++
}

```


for{
    xxx
}


for range 
    返回key,value
    key 包含字节，一般中文3个字节

    ```
    s := "hello"
    for k,v := range s{
        fmt.Printf("%d %c\n",k,v)
    }
    ```




类型转换
    浮点型和整型

    ```
    n := 10

    var f float64

    f = float64(n)

    ```
