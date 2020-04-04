
## 
编译型语言
    优点: 速度快
    缺点: 移植性不好
    C, C++

解释型语言
    优点: 速度慢
    缺点: 移植性好
    特点: 单线程
    javascript, php, python

    单线程:同一时间做一件事叫

    同步(synchronous):一定要等任务执行完了，得到结果，才执行下一个任务。

    异步(asynchronous):不等任务执行完，直接执行下一个任务。
        js的加载是异步的
        asynchronous a process that operates independently of other processes


老张爱喝茶，废话不说，煮开水。 出场人物：老张，水壶两把（普通水壶，简称水壶；会响的水壶，简称响水壶）。 

1 老张把水壶放到火上，立等水开。（同步阻塞） 老张觉得自己有点傻 

2 老张把水壶放到火上，去客厅看电视，时不时去厨房看看水开没有。（同步非阻塞） 老张还是觉得自己有点傻，于是变高端了，买了把会响笛的那种水壶。水开之后，能大声发出嘀~~~~的噪音。 

3 老张把响水壶放到火上，立等水开。（异步阻塞） 老张觉得这样傻等意义不大 

4 老张把响水壶放到火上，去客厅看电视，水壶响之前不再去看它了，响了再去拿壶。（异步非阻塞） 老张觉得自己聪明了。

所谓同步异步，只是对于水壶而言。 普通水壶，同步;响水壶，异步。 
虽然都能干活，但响水壶可以在自己完工之后，提示老张水开了。这是普通水壶所不能及的。 

同步只能让调用者去轮询自己（情况2中），造成老张效率的低下。

所谓阻塞非阻塞，仅仅对于老张而言。 立等的老张，阻塞; 看电视的老张，非阻塞。 

情况1和情况3中老张就是阻塞的，媳妇喊他都不知道。虽然3中响水壶是异步的，可对于立等的老张没有太大的意义。所以一般异步是配合非阻塞使用的，这样才能发挥异步的效用。



ECMAScript

DOM 操作文档

BOM 操作浏览器



单线程：轮转时间片, 每个任务去争抢时间片, 和吃饭吃菜一样


IE          trident
Firefox     Gecko
Chrome      webkit/blink
Opear       presto
Safari      webkit




<script> 可以写在任何位置


<script src='out.js'>   //外部的生效
    in  //内部的失效
</script>


document.write('helloworld')


## 基本语法

强类型,弱类型
    容忍隐式类型转换

静态类型,动态类型
    可以更换类型
    a = 'h'
    a = 1

弱类型, 动态类型

### 原始类型
Number
    int     没有
    float   没有
String      优先级比number高, '123'+2 = 1232 只有是+连接的时候, '23' * 3 是number 
Boolean     true/false
undefined   没有赋值的(不会报错), 没有定义的(会报错)
null        占位(这个是小写)


typeof 返回
    number
    string
    boolean
    undefined

    object(null 是 object)
    function
    

类型转换
    Number(null)        -> 0
    Number(undefined)   -> NaN
    Number('123abc')    -> NaN
    **Number 不管你输入是什么，都要转为数字，不行的话就NaN**

    parseInt()  把输入转为整型
    parseInt(true)      -> NaN
    parseInt('12ab')    -> 12

    乘以 / % 都会使操作数变为Number
    var a = 1 == '1';   //隐式转换

    undefined == null   //true
    undefined >0 or undefined == 0 or undefined < 0 均为false
    null >0 or null == 0 or  null< 0 均为false
    NaN != NaN

    ===

    未定义的变量 当且仅当 typeof(a) 时不报错


//当字符串只有数字组成
var numbeTrans="9898";
alert(parseInt(numberTrans));  //9898
alert(Number(numberTrans));   //9898

//当数字只有字母组成
var numbeTrans="abab";
alert(parseInt(numberTrans));  //NaN
alert(Number(numberTrans));  //NaN

//当字符串由字母与数字组成
var numbeTrans="123ab";
alert(parseInt(numberTrans));  //123
alert(Number(numberTrans));  //NaN

//当字符串为小数时
var numbeTrans="123.123";
alert(parseInt(numberTrans));  //123
alert(Number(numberTrans));  //123.123

//当字符串为空null时
var numbeTrans="null";
alert(parseInt(numberTrans));  //NaN
alert(Number(numberTrans));   //0

//当字符串为空“ ”时
var numbeTrans=" ";
alert(parseInt(numberTrans));  //NaN
alert(Number(numberTrans));   //0




**Number(object)**
**parseInt(string,radix)**      源字符串是 radix 进制
    string 如果它以 “0x” 或 “0X” 开头，将以 16 为基数
    8进制没有
    也不识别 'oct11' 都是NaN

parseFloat(string)

String()
toString()
    var a = 123
    a.toString(radix)   //目标进制
    **nudefined 和 null 不能用这种**

    a.toString(2)
    a.toString(8)
    a.toString(16)
    a.toString(5)       //任意进制

    console.log(0b11 === 3)
    console.log(0o10 === 8)
    console.log(0x10 === 16)

Boolean()



如果对象的值无法转换为数字，那么 Number() 函数返回 NaN。
如果参数是 Date 对象，Number() 返回从 1970 年 1 月 1 日至今的毫秒数。



steak 栈
    first in last out
    栈内存放的是真实的值
    栈内存的不可改变性

    num = 101   0x1
    num2 = num  0x2
    num = 102   0x3, 此时0x1没有了引用，0x1 回收

    

### 引用类型

array
object
function
data
RegExp


heap 堆
    first in last out
    堆内存: 栈内存中放堆内存的地址




## 错误
1. 语法错误
    一行都不会执行

1. 逻辑错误
    一个<script>中的错误 不会影响 另一个<script>的执行




## 运算符
1. +
    数学运算
    字符串连接

1. /
    0/0 返回 NaN        数字类型
    1/0 返回 Infinity   数字类型

1. %
    取模


自加
自减


连续赋值:自右向左

var a = 2,
    b = 3;

b %= a + 3; 返回3, 右边作为一个整体


window.prompt("请输入")

类型转换
    parseInt
    




## 条件语句

if(){

}else if(){

}else{

}


switch(){
    case X:
        语句;
    break;
    case X:
        语句;
    break;
    default:
        语句;
}


---
for(var i=0;i<10;i++){
    语句;
}


var a = 1;
for(;;){
    if(a<10){
        console.log(a);
    
    }else{
        break;
    
    }
    a++;

}


中间其实是一个if判断
var i = 5;
for(;i--;){
    console.log(5-i);

}
---


while
其实就是
for(;条件;){

}



---

do{

}while()






质数判断
for(var i = 3;i<101;i++){
    for(var j=2;j<i;j++){
        if(i%j==0){
            //不是质数
            break;
        
        }

        if(j==(i-1)){//到了自身前一个数了就是质数了
            console.log(i);
        }
    
    }
}






斐波那契数列
var temp = [1,1];
for(var i = 2;i<=10;i++){
    temp.push(temp[i-2] + temp[i-1])

}
console.log(temp)




var first = 1;
var second = 1;
for(var i = 1;i<=6-2;i++){
    result = first + second;
    first = second;
    second = result;

}
console.log(result)



数列中的最大值
```
arr = [1,3,1,10,1,99,3]

max = arr[0]
for(var i = 1;i<arr.length;i++){
    max = max < arr[i] ? arr[i] : max

}
console.log(max)
```


## 对象
var info = {
    name:'liujiao',
    age:30,         //最后一个逗号可有可无
}

info.name
info['name']


## 数学
Math.sqrt()
变量.toFixed(小数位数)




isNaN()
    先将参数转化为Number,然后看是否是NaN



## 函数

命名函数表达式
    var a = function test(){

    }

    console.log(a.name) 输出 test

    console.log(test)   报错

匿名函数表达式
    var a = function(){

    }

    console.log(a.name) 输出 a



函数参数可以不一致

形参比实参多
    多余的形参值为undefined

实参比行参多
    可以, 多余的实参放到了 arguments 实参列表中
    形参的长度: 函数名.length

    function say(a,b){
        shican = say.length;
        xingcan = arguments.length  //typeof 是 object:[Arguments] { '0': 1, '1': 2, '2': 3  } 但是可以当做数组来用, 例如下边
        
        var sum = 0;
        for(var i = 0; i < arguments.length; i++){
            sum += arguments[i]
        }
    }

    **a 和 arguments[0]   不是同一个，他们只是内部绑定在了一起**

    arguments 是实参列表，和传入的实参个数相同，而不是和形参个数相同


    ```
    function say(a,b){
        console.log(arguments[1])
    }

    say(1)  输出 undefined      //arguments 对应实参

    ```
   
return 
    

## 预编译
一切声明的全局变量均归 window 所有, 即全局的域
未经声明的变量归 window 所有

```
function say(){
    var a = b = 123;    //b 是未经声明的变量, 归全局所有
}

console.log(b)
```

函数
1. 创建AO对象(activation object) 执行期上下文
1. 将形参 和 变量的声明 提升，值为 undefined(和是否在if中无关,但是 if语句中不可以定义函数)
1. 实参 和 形参 值统一
1. 函数声明提升

```注意

var b = function(){ //是变量声明

}

```

(window.foo || (window.foo = 'bar'))    先做括号，然后在做第一个 window.foo
(window.foo || window.foo = 'bar')      || 优先级更高 , 报错



## 作用域

function say(){}

say.[[scope]]   作用于，只能系统调用
    就是我们说的作用域, 其中存储了**运行期上下文的集合**

    [[scope]]中所存储的执行期上下文对象的集合，这个集合呈链式链接，我们把这种链式链接叫做**作用域链**

    多次调用一个函数，会导致创建多个执行上下文, 当函数执行完毕，它所产生的执行上下文被销毁


```
function outer(){
var a = 0;
function inner(){
a++;
return a;

}
return inner;

}

demo = outer()
demo()
demo()
console.log(demo())
```


内存泄露：用得多了剩下的就少了, 好像泄露了一样


闭包的功能
    实现公有变量


做缓存
    ```
    function eater(){
        var food = '';
        var obj = {
            eat:function(){
                console.log('i am eating')
                food = ''
            },
            push: function (myfood){
                food = myfood;
            }
        }
        return obj;
    }


    function say(){
        var a = 0;
        function add(){
            a++;
            console.log(a);
        
        }
        function minus(){
            a--;
            console.log(a);
        
        }
        return [add,minus];

    }

    demo = say()

    demo[0]();
    demo[1]();

    ```

实现封装，属性私有化

模块化开发，防止污染全局变量


---


立即执行函数


W3C建议这种写法
(function (){

 }())



(function(){})()


只有表达式才能被执行
123; 也是一个表达式

function(){}    //这是函数声明

**能被执行符号执行的表达式 的名字会放弃**

```
var x = 1;

if(function f(){}){
    x+=typeof f;

}

console.log(x)
```

var a = function(){
    console.log('hello');
}()
声明 = 表达式

a   输出hello
a   undefined


+ function(){
    console.log('hello');
}();


- function(){
    console.log('hello');
}();


|| function(){
    console.log('hello');
}();




(function say(){

 }())
首先执行外边的括号，里边的函数声明变成表达式，然后执行



**一个很值得看的例子**
    function say(a,b,c,d){
        console.log(a,b,c,d);
    }(1,2,3,4);

    并不报错

    一个脚本中单独只有一个(); 是会报错的，但是(1)就不同了

    上面的例子，系统为了不报错，拆解成两部分

    function say(a,b){
        console.log(a,b);
    }

    (1,2);

    这样并没有什么错




    function test(){
    var arr = [];
        for(var i = 0; i < 10; i++){
            arr[i]=(function (){
                console.log(i);
            }())
        }
        return arr;
    }

    var a = test();
    console.log("this is a:"+a)


    

    function test(){
    var arr = [];
    for(var i = 0; i < 10; i++){
        (function (j){
         arr[j] = function(){
                console.log(j)
                }
            }(i))
        }
        return arr;
    }
    var a = test();
    console.log(a)
    a[0]()
    a[1]()
    a[2]()






'a'.charCodeAt()
'abc'.charCodeAt(0)





var a = (2,3)   逗号运算符, 会把后边的表达式返回

```
var a = (
   function f(){
   return '1';

   },
   function g(){
   return 2;

   }

   )();

console.log(a)

```




## 对象

this 关键字


创建方法1 plainObject 对象字面量
var info = {
    name:'liu',
    age:27,
    height:170,
    eat:function(){
        info.height++;
        console.log('i am eating');
    
    },
run:function(){
        this.age--;
        console.log(this.age);
    }
}
info.run()
console.log(info.age)


增
删 delete 属性
    **删除一个没有的属性，返回true**
改
查



创建方法2 构造函数
    1. 系统自带的构造函数 Object()
        var obj = new Object() 和下面的那个是一样的
        var obj = {}    
        
        obj.name = 'hello'

    1. 自定义(和函数没有区别) 一般采用大驼峰命名

        function Person(){
            this.color = 'yellow',  //有了this才是属性
            this.height = '170',
            temp = 'hello'          //这个不是属性
        }
        var person1 = new Person();


        没有new 就是一个普通函数


        创建过程，
            1. new 之后 创建this={}对象
            2. 对this赋值
            3. 返回this对象

            可以手动的return一个值，但是这个值不能是原始类型，比如

            function Car(color){
                this.name = 'Ferrari',
                this.color = color
                
                return 123;
            }

            var a = new Car('red');
            console.log(a)

            发现没有效果

            结论：**只能手动返回一个复杂类型，原始类型无效**

### 包装类

卸磨杀驴,用完即丢

原始类型 没有方法，
原始数字类型，数字包装类


new Number()
new String()
    有包装类属性 .length, 但是为什么对length进行赋值没效果呢。。。卸磨杀驴，用完即丢(**凡是自定义的都是,系统自带的属性可以认为是只读的**)

new Boolean()

undefined 和 null 不能有属性


var a = New Number(123)




var a = 4;
a.name = 'helo'     隐式调用 new Number(4), 然后添加属性, **然后delete**
console.log(a.name) 隐式调用 new Number(4), 没有那个属性，返回 undefined

例子
var a = 'abcdefg'
a.length = 2;   是对包装类的操作
console.log(a)  仍然输出 abcdefg


## 原型

原型 是function对象的一个属性，他定义了构造函数制造出的对象的公共祖先, 



.prototype 原型, 构造函数的祖先


Person.prototype.name = 'hello world'
function Person(){}
var a = new Person()
var b = new Person()
console.log(a.name)
console.log(b.name)



Person.prototype.say = function say(){}
function Person(){
    this.say=function say(){
        console.log('hel');
    }
}


var info = {
    name:'liu',
    age:27,
    height:170,
    eat:function(){
        info.height++;
        console.log('i am eating');
    
    },
run:function(){
        this.age--;
        console.log(this.age);

    
    }

}

    **删除一个没有的属性，返回true**

    删除的是本身的，不是原型的
    增加的是本身的，不是原型的



另外一种写原型的方法, 但是不一样了

Car.prototype={
    xxx
    xxx
}

系统自带的prototype 有个属性叫 constructor 指向构造器 Car函数



如何查看对象的原型
    car.__proto__

    ```
    Grand.prototype.lastname='liu';
    function Grand(){}

    Father.prototype=Grand;
    function Father(){}

    Son.prototype=father;
    function Son(){}

    var grand = new Grand()
    var father = new Father()
    var son = new Son()

    console.log(grand.__proto__)
    console.log(father.__proto__)
    console.log(son.__proto__)
    ```


this的指向:谁调用，指向谁



创建对象的方法
    1. {}
    2. new 
    3. Object.create(原型 或 null)
        var a = Object.create(null)     没有prototpye,没有原型
            console.log(a)      一个空的{}
            即使认为的指定 __proto__ 也没有真实的效果
        
        var b = Object.create({name:'Bob'})
        b.__proto__   和new方法创建的还是不一样
            new 创建的输出为  constructor
            此方法没有constructor,


{constructor: } 正常的__proto__
    constructor:  Alice()
        length: 0
        name: "Alice"
        arguments: null
        caller: null
        prototype: {constructor: f}
        __proto__: f()
        [[FunctionLocation]]: VM1744:1
        [[Scopes]]: Scopes[1]
    __proto__: Object




{name: "alice"}   Object.create({name:'alice'}) 产生的prototype
    name: "liu"
    __proto__: Object




并不是所有对象都继承自Object.prototype


undefined 和  null 没有原型，没有包装类



toString
    var num = 123;
        num.toString(); --> new Number(num).toString()
        Number.prototype.toString = ...

        Number.prototype.__proto__ = Object.prototype
        Object.prototype.toString = ...



发生了截流
    Object.prototype.toString()
    Number.prototype.toString()
    Array.prototype.toString()
    Boolean.prototype.toString()


使用原生的toString方法
    Object.prototype.toStrig.call(123)  ->[object Number]
    Object.prototype.toStrig.call(true)  ->[object Boolean]





document.write()
    其实是调用了参数的toString方法, 如果没有原型(没有toString方法) 就会报错

    var a = Object.create(null)
    document.write(a)           //Uncaught TypeError: Cannot convert object to primitive value

    手动指定toString方法
    a.toString = function(){
        return 'hello'
    }

    document.write(a)


## call/apply

改变this指向

函数执行的真正面纱

function test(){

}

**test()  实际是 test.call()**


function Person(name,age){
    this.name = name;
    this.age = age;
}

var person = new Person('Alice',20);

var obj = {}
Person.call(obj,'Bob',20);





function Person(name){
    this.name = name;
}

var person = new Person('Alice');
console.log(person.name);               //person.name


var obj = {}
Person.call(obj,'Bob');
console.log(obj);                       //{name:'Bob'}  obj对象有得话会覆盖


一个例子
```
function Person(name,age){                  //基本的项目
    this.name = name;
    this.age = age;
}

function Student(name,age,gender){          //扩展的项目, 完全覆盖之前的功能
    Person.call(this,name,age);
    Person.apply(this,[name,age]);
    this.gender = gender

}

//var person = new Person('alice',20,'girl')

//Student.call(person,'alice',20,'girl')
var stu = new Student('alice',20,'girl')

console.log(stu)





function Wheel(size){
    this.wheel_size = size;

    }
function Surface(color){
    this.surface = color;

}

function Car(size,color,windows){
    Wheel.call(this,size);
    Surface.call(this,color);
    this.windows = windows;

}


var a = new Car(17,'red','dark');

console.log(a)

```

call 是一个个的传入
apply 必须传参数数组



## 防止变量污染
    很多人一起开发项目，防止变量污染问题

    ```
    var name = 'wang'           //这个是全局变量

    var liu = (function(){      //这里是定义员工个人的代码，立即执行函数的闭包(也可以不用立即执行函数，调用方式要改一下，多加一个括号)

        var name = 'liujiao';   //个人的变量

        function say(){
            return name;
        }

        return function(){      //将个人的要用的部分返回
            return say();
        };

    }())

    var a = liu()               
    console.log(a)
    ```



## jQuery式调用

var robot = {
    say:function(){
        console.log('i am a robot')
        return this;
    },
    work:function(){
        console.log('i am working')
        return this;
    }
}

robot.say().work()


## 对象的调用 [] 更加灵活

var robot = {
    robot1 : 'robot1',
    robot2 : 'robot2',
    robot3 : 'robot3',
    robot4 : 'robot4',

    myRobot : function(num){
        //return this.('robot'+num);
        return this['robot'+num];
    }
}

console.log(robot.myRobot(1))


[] 的原理就是:
    info.name 在内部 info['name']
    因此 info.name 中name 不能是变量
    下面的例子更具代表性


## for in 遍历对象

in 的第一个操作数 要是字符串, 原型上的属性也算

提取对象的属性名

var info = {
    name : 'alice',
    age : 29,
    gender : 'girl'
    i : 'i love u my sons'
}

for(var i in info){
    cosole.log(i+':'+info.i)
    cosole.log(i+':'+info[i])
}




如果是 cosole.log(i+':'+info.i) 结果将是:
    name:i love u, my sons
    age:i love u, my sons
    gender:i love u, my sons
    i:i love u, my sons


但是有个问题，就是 for in 循环会输出原型上的属性(__proto__上的属性), 如:
    （注: 默认是不会打印 **Object.prototype上系统设定的属性**,自己设定的还是能打印出来）

```
Grand.prototype.lastName='liu'
function Grand(){
    this.color= 'green'

}

var grand = new Grand()

Father.prototype = grand
function Father(){
    this.color = 'blue'

}

var father = new Father();

for(var i in father){
    console.log(i)
}

```

解决方法 对象.hasOwnProperty(属性名), 是否是自己的属性，是返回true

for(var i in father){
    if(father.hasOwnProperty(i)){
        console.log(i)
    }
}

这样就会只打印自己的属性了


打印 Object.prototype 上自定义的属性

```
Object.prototype.fly = 'i can fly'
for(var i in father){
    if(!father.hasOwnProperty(i)){
        console.log(i)
    }
}
```


instanceof
    A instanceof B
    A对象是不是 B构造函数构造出来的对象

    ```
    [] instanceof Array
    [] instanceof Object
    ```

    看A对象的原型链上，有没有B的构造函数


typeof []   返回 object
typeof {}   返回 object

如何判断呢？
    方法一:变量.__proto__.constructor   或者 变量.constructor
    方法二: instanceof
    方法三: Object.toString.call([])    -> [object Array]


### 数组

var a = new Array(10)       //10个undefined 的数组
var a = new Array(10.1)     //wrong

可以越界读
可以越界写

因为是基于对象的

a=[1]
console.log(a[10])      //返回undefined
a[20] = 10              


### 改变原数组
push    返回数组的新长度, 可以加多个
pop     剪切最后一个

shift   在前边剪切
unshift 在前边加, 可以加多个

reverse 逆转

splice
    arr.splice(start,length,toAdd)
    **start 在第几项前边切一刀**

     ```
    var arr = [1,2,3,5]
    arr.splice(3,0,['hello','world'])
     ```

    支持start 为负数， 同 Python
    splice = function (pos){
        pos += pos > 0 ? 0 : this.length;
    }

sort    
    默认是安装ascii的方法比较的
    1,10,2

    前面的数-后面的数 ? 大于0 调换位置 : 小于0 不换位置
    冒泡排序

    ```
    var arr = [1,4,10,3,9,-1]
    arr.sort(function(x,y){return x-y ? 1 : -1})
    

    ```
    

不改变原数组




### try catch

```
try{
    code1
    code2   错误，这里就停止了
    code3
    ...

}catch(e){
    console.log(e.message + ' ' + e.name)
}

other codes 继续执行
```

错误类型
    1. EvalError: eval() 错误
    1. RangeError: 数值越界
    1. ReferenceError: 非法或不能识别的引用数值
    1. SyntaxError: 语法错误
    1. TypeError: 类型错误
    1. URIErrorr: URI处理函数使用错误


### 严格模式

es3.0 和 es5.0 产生冲突的部门，
es5.0 严格模式，那么冲突的部分就用 es5.0

"use strict"    //页面最顶端

也可对单独的函数，在函数中的首行代码之上写 "use strict"


不可以使用 with(){} 改变作用于链, 放置在最顶端

with(document){
    write('hello world')
}


变量复制前必须声明
    var a = b = c = 3


局部的this


不能使用 eval()



## DOM(Document Object Model)
一系列 方法的集合 ，操作 html 和 xml

对 html 和 xml 的操作接口

查
    document.getElementsByTagName('div')
        div.style.width = '100px'
        div.style.backgroundColor = '#fff'      //不能有 dash - 必须用小驼峰

        div.onclick = function(){
            this.style.backgroundColor = 'green'
        }


    document.getElement

增 
    var div = document.creteElement('div');
    document.body.appendChild(div);

    var timer = setInterval(function(){
        div.style.left = parseInt(div.style.left) +1 + 'px'
    },100) 毫秒


    document.onkeydown = function(e){
        switch(e.which){
            case 38:    //上
                
            case 40:    //下

            case 37:    //左

            case 39:    //右
        }
    }



ul.onmouseover = function()










## es6

### let

限定作用域 
重复定义(var 可以重复定义)

if(true){
    let i = 0;
}


switch(score){
    case 1:
        var a = 'a1';
        break
    case 2:
        var a = 'a2';
        break
    case 3:
        var a = 'a3';
        break
}

### const 常量

const DATA = 3.1415926

const DATA2 = [1,2,3]


### 嵌入字符串

```
let name = 'alice'
let str1 = `hello ${name}`                  //反单引号, 模板



let name = 'bob'
let address = 'gym'
let str1 = `hello, ${name}!
let's go to ${gym} tonight,shall we?
wait u
`

console.log(str1)

对模板的操作解析
```
function test(format,...args){              //第一个参数表示模板, ...args 表示被替换的参数, 是一个数组，如果没有..., 就只能输出第一个参数了
    console.log(format)
    console.log(args)
}

var name = 'alice'
test`hello ${name}, nice to meet you`

输出结果
[ 'hello ', ' nice to meet you'  ]
[ 'liujiao'  ]
```

```
一个例子
let name = 'Alice'
let age = 26

//let str1 = 'hello ${name} so glad to meet you at ur ${age}'
let str1 = test`hello ${name}
so glad to meet you at ur ${age}`

function test(format,...args){
    //console.log(format)
    //console.log(args)

    var result = '## title\n';

    for(var i = 0; i < format.length; i++){
        //console.log(format[i])
        //console.log(args[i] || '')
        result += format[i] + '**' + (args[i] || '') + '**'
    
    }
    return result;

}

console.log(str1)

```


### symbol

原始数据类型
let s1 = Symbol('hello')
let s2 = Symbol('hello')

console.log(s1 == s2)   //false
    在symbol内部分配了id， symbol 比较的是 id

console.log(s1 + s2)
    TypeError: Cannot convert a Symbol value to a number

作用
    作为常量:关心的不是值，而是名字???
    作为属性
    作为半隐藏属性 




### class

创建

    ``` 
    类中的函数不能写function关键字, 多个方法间也不能添加逗号
    class Person{
        constructor(name,age){              //构造器函数
            this.name = name;
            this.age = age;
        }

        say(){
            console.log('saying');  //普通函数
        }
    }

    var alice = new Person('alice',27)
    alice.say()
    ```


继承

```
class Father{
    constructor(){

    }
    money(){
        console.log(100)
    }
}


calss Son extends Father{
    
}

var son = new Son()
son.money()
```


