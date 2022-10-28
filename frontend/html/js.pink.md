


alert("alert")

console.log("console")
prompt(info)

数组.length()


## number string boolean undefined null

Math.random   [0,1)
    Math.random()*100 是没有问题的

Number.MAX_VALUE
Number.MIN_VALUE
Infinity
NaN
isNaN(a)


推荐使用单引号, 单引号可以转义
单双引号不可以解析变量
\b  blank 空格
length 属性
    console.log(mystr.length)
拼接(加号)
    console.log('a' + 'b')
    console.log('a' + 18 + '岁')
    console.log('a' + true)
    console.log('12' + 12)     1212

    数字相加，字符相连


true + 1 == 2
false + + == 1

undefined + 1 == NaN    // 不确定的数据类型和数字相加是 NaN
null + 1 = 1            // 空, 占位

undefined == null
undefined !== null
NaN != NaN


typeof 1                // number
typeof(1)
typeof(null)            // object


黑色是字符型的
蓝色是数字类型
深蓝色是 boolean
灰色是 undefined 和 null
    不是说变量，而是直接的数据
    'a'
    18
    true
    undefined, null


### 数据类型转换

1. -> 字符串
    1. toString(radix)
        var a = 10;
        var res = a.toString(10)

    2. String()

    3. 加号拼接字符串
        var a = '' + 18;


2. -> number

    1. parseInt(string)
        截取整数部分
        第一个必须是数字，**连续**取到合法的数字, 可以用来去除单位
            parseInt('123.45.6') -> 123
        否则 NaN   parseInt('rem12')

        parseInt('')        -> NaN

        截取数字

    2. parseFloat(string)
            parseInt('123.45.6') -> 123.45
        

    3. Number(string)
        Number('123')       -> 123
        Number('123a')      -> NaN
        Number(true)        -> 1
        Number('')          -> 0
        Number(undefined)   -> NaN      // 数据类型都不知道，只能是 NaN, 例如，如果是空串还i是 true 
        Number(null)        -> 0

        数学上的意义


    4. 隐式转换
        
        '12' - 0

3. boolean

    Boolean()

    仅有的false
    1. ''
    2. 0(0.0 === 0)
    3. NaN
    4. undefined
    5. null


编译型
    炒菜
解释型
    火锅



## 运算

    ```
    0.07*10  -> 0.7000000000000001

    ```

算数赋值
    +=

比较运算符
    console.log(18 == '18')         // true

    **相等比较运算符会把字符串转换为数字(parse)**
        1. 首先要一样，不能多字符
        2. 对字符串进行 parse 运算

    **纯数字字符串 会转换为数字类型**
        3 < '5'     // true

    65 == 'a'       // false



else if

switch(xxx)         // xxx 可以是其他数据类型, 是 ===


## 循环

for
    for(初始化变量;条件表达式;操作表达式)
while
do..while


var sum = 0;
for(var i = 1; i< 101 ;i++){
    !(i%3) ? sum+=i : 1
}
console.log(sum)


### break 多层循环
```
outer:
for(var i=0;i<10;i++){
    inter:
    for(var j=0;j<10;j++){
        if(i>5){
            console.log(i);
            break outer;
        }
    } 
}
```

## 数组

访问不存在的数组元素放回 undefined

forEach() 方法对数组的每个元素执行一次提供的函数。

var array = ['a', 'b', 'c'];

array.forEach(function(element) {
    console.log(element);
});



增加元素

    方法一: 修改 length 属性
    方法二: a[a.length] = value


    a[1000] = value, 中间元素值为 undefined



## 函数

函数名一般用动词
函数不调用自己 不执行




实参少于形参时，是 undefined

return n1,n2        // 会返回最后一个


冒泡排序
    [5,4,3,2,1]

    length = 5

      + 4 3 2 1    内循环
    0 | 4 3 2 1 5
    1 | 3 2 1 4 5
    2 | 2 1 3 4 5
    3 | 1 2 3 4 5
外循环

    外  内次数
    0   4       length - 1
    1   3       length - 1 - 外
    2   2       length - 1 - 外
    3   1       length - 1 - 外

内循环 = length -1 - 外循环

表达式的结果要立即算出来，所以立即执行函数就是被当成了一个操作数，数要立即算出结果
    
    (function(){console.log(0)})()
    (function(){console.log(0)}())
    +function(){console.log(0)}()
    -function(){console.log(0)}()
    1*function(){console.log(0)}()
    1/function(){console.log(0)}()


## 作用域

es6 新增加了 块级作用域


```
var txt = '外层变量-->你好呀';

function fn() {
  console.log(txt);
  if (false) {
    var txt = '内层变量-->hello';       会覆盖, 1. 预编译(词法分析)阶段 / 2. 执行阶段
  }
}

fn();//undefined
```

作用域链


### 预编译/词法分析

1. 变量预解析
    
    变量声明提升到**当前作用域**的最前边
    只提升声明

2. 函数预解析

    变量声明提升到**当前作用域**的最前边



### 对象

对象一定是具体的


对象名.属性名
对象名['属性名']    // 必须有引号


1. 字面量创建
    {}

    ```
    var a = {};         // 逗号分隔
    var a = {
        uname:'a',
        age:18,
        gender:man,
        say:function(){...}
    }
    ```

2. new Object

    ```
    var obj = new Object();

    obj.name = 'a';
    obj.age = 18;
    obj.gender = 'man';
    ```

3. 构造函数

    上边两个都是系统定义的、最简单的对象，我们要自定义


遍历对象属性

    for(key in OBJ)

    for(key,value in OBJ)  x 错误, 只能有一个key


### 对象分类

1. 内置对象

    mdn/w3c

    Math
        Unlike many other global objects, Math is not a constructor. All properties and methods of Math are static. 

        Math.random()   [0,1)

        Math.PI

        Math.max()
            如果没有参数，返回 -Infinity
            如果参数中有非数字，返回 NaN
        Math.min()
        Math.abs()
            可以是纯数字字符串
        Math.ceil()
        Math.floor()
        Math.round()    四舍五入, **5: 向大取值**, -1.5 -> -1
            两个整数之间的随机整数
                Math.floor(Math.random()* (max-min) + min)      [min,max)
                Math.floor(Math.random()* (max-min+1) + min)    [min,max]
                随机点名

    Date
        是一个构造函数，必须用 new
        var a = new Date('2020-01-01 1:1:1')
        var a = new Date('2020/01/01 1:1:1')

        getFullYear()
        getMonth()          [0,11]
        getDate()           日
        getDay()            周几    [1,6,周日返回0]
        getHours()          s
        getMinutes()
        getSeconds()

        Date.now()
            距离1970年1月1日0:0:0 的毫秒数 milliseconds
            时间戳

            es5 中的方法
            var a = new Date();
            a.valueOf()

            var a = +new Date()



            秒数n

            d: parseInt(n/3600/24)          // parseInt()
            h: parseInt(n/3600%24)
            m: parseInt(n/60%60)
            s: parseInt(n%60)

    array
        new Array(n)            n 个 empty 元素
        new Array(element0, element1,  … , elementN)


        判断是否为数组
            方法一: a  instanceof Array
            方法二: Array.isArray(x)        (建议用这个)

            Array.isArray() also rejects objects with Array.prototype in its
            prototype chain but aren't actual arrays, which instanceof Array
            would accept.

            方法
                a.push
                    a.push(1)
                    a.push([1,3,4])     [1,3,4] 作为一个独立的元素加进去, 返回新数组的长度

                a.pop 删除最后一个元素
                    返回删除的那个元素

                a.unshift 在开头添加
                    返回新数组的长度

                a.shift 删除第一个元素
                    返回删除的那个元素



                a.reverse()
                    翻转数组
                a.sort()
                    排序 1 2 13 -> 1 13 2

                    sort(function compareFn(a, b))          return a-b 升序



                a.indexOf(元素)
                a.lastIndexOf(元素)
                    lastIndexOf(searchElement, fromIndex)
                    方向相反
                    只找一个
                    找不到返回 -1
                1 in a                      // true/false
                !(1 in a)


                a.toString()                // 形如 '1,4,5,6'   逗号分隔
                a.join('分隔符')            // 默认 逗号

                
                s.splice(index,count)       // 原地操作，返回被删掉的数组

        string
            string.length

            包装类型/装箱

            字符串不可变, 开辟了新空间，更改了变量的指针

            因为字符串不可变，尽量少拼接字符串

            indexOf(searchString, position)
            lastIndexOf (searchString, position)


            .charAt(index)
            .charCodeAt(index)              ASCII码
                A number representing the UTF-16 code unit value of the
                character at the given index. If index is out of range,
                charCodeAt() returns NaN.


            .concat(str1,str2,...)
            .substr(start,length)
            .slice(start,end)           [start,end)
            .replace('old','new')
            .split(',')
                'red,blue'.split(',')



### 简单数据类型

栈内存
    number
    string
    boolean
    undefined
    null(object)

    传值
堆
    传引用




### 自我实现

1. Math.max的自我实现

```
var myMath = {
PI: 3.14,
    max: function () {
        var max = -Infinity;

        if (arguments.length == 0) {
            return -Infinity;

        }

        for (var i = 0; i < arguments.length; i++) {
            if (typeof (arguments[i]) !== 'number') {

                return NaN;

            }
            if (arguments[i] > max) {
                max = arguments[i];

            }

        }

        return max;

    }

}
```

2. 浏览器对象

3. 自定义对象


## web api

ECMAScript
DOM
BOM

Web APIs 是 w3c 组织的标准
主要学习 DOM 和 BOM


Web APIs 是 JS 的应用，大量使用 JS 基础语法做交互效果

mds 搜索  web apis


### dom

1. 获取元素

2. 给元素注册事件

3. 操作 DOM 元素的属性

4. 创建元素

5. 操作 DOM 节点


一个页面就是一个文档 document
所有标签都是元素，element
节点: 网页中所有内容都是节点（标签，属性，文本，注释）, 用 node 表示


### 1. 获取元素

得现有标签才能选择，要写在下边


查看element对象的属性

    **console.dir(a)**


document.getElementById("")     // 大小写敏感的字符串
    document.getElementById("time")

    An Element object describing the DOM element object matching the specified
    ID, or **null** if no matching element was found in the document.


document.getElementsByTagName()
    伪数组
    只有一个也是伪数组
    一个也没有也是伪数组, 长度为零

    var ol = document.getElementByTagName['ol']
    var li = ol[0].getElementByTagName['li']

document.getElementsByClassName()



document.querySelector("选择器")
    返回指定选择器的第一个元素对象
    document.querySelector("#box")


document.querySelectorAll()
    document.querySelectorAll("div.note")
    container.querySelectorAll("div.highlighted > p");


特殊元素

    document.documentElement;       html 元素
    document.head
    document.body



### 2. 给元素注册事件

可以被 js 侦测到的行为

触发-响应机制

1. 事件源
2. 事件类型,注册事件
3. 事件处理程序


var btn = document.getElementById('btn')
btn.onclick = function(){console.log("hello")}


常见事件
    onclick

    onmouseover             鼠标经过, 鼠标经过变色
    onmouseout              鼠标离开, 鼠标经过变色

    onfocus                 获得鼠标焦点
    onblur                  失去鼠标焦点

    onmousemove             鼠标移动
    onmouseup               鼠标弹起
    onmousedown             鼠标按下



### 3. 操作 DOM 元素的属性

element.innerText
    w3c 的

    会去除空格和换行等节点

element.innerHTML
    微软开发的


元素也可以不注册事件, 直接修改


表单类
    btn.disabled = true;
    this.disabled = true;

    密码框的可见性是改变 type


样式属性
    element.style.backgroundColor='red'         // 驼峰命名法
    element.


    this.style.className = 'xxx'

    console.log(box.style.width)            // 只能获取到行内样式的值, css 写的获取不到



表单全选
    checkbox
    onclick
    this.checked


自定义属性
    element.getAttribute('属性')
        也可以用于获取系统属性
    element.setAttribute('属性')
        主要用于自定义属性
    element.removeAttribute('属性')

    为了避免混淆，自定义属性最好都要以  "data-" 开头
        属性名：data-index
        element.dataset.index       dataset 是一个集合，H5新增
        element.dataset[index]

        属性名：data-index-name
        element.dataset.indexName       **驼峰命名法**




### 4. 创建元素

### 5. 操作 DOM 节点

利用 DOM 提供的方法获取元素

利用节点层级关系获取元素
    元素节点
    属性节点
    文本节点


nodeName
nodeType
    元素节点 1
    属性节点 2
    文本节点 3, 博爱阔文字，空格，缓行等
    注释节点
nodeValue



node.parentNode     // 直接父元素, 没有返回空

    var erweima = document.querySelector('.erweima')
    erweima.parentNode


node.chiildNodes    // 包含所有类型的节点
node.chiildren      // 所有**子元素**节点


    .firstChild     // 第一个子节点
    .lastChild      // 最后一个子节点

    .firstElementChild  // 第一个子元素节点
    .lastElementChild   // 最后一个子元素节点

    开发中一般使用 .children[0]
    开发中一般使用 ol.children[ol.children.length - 1]


node.nextSibling    // 包含各种类型的节点
node.previousSibling    // 包含各种类型的节点

node.nextElementSibling         // 元素节点, 没有返回 null
node.previousElementSibling     // 元素节点



创建节点

    document.createElement('tagName')       // 会自动创建闭合标签

    var ol = document.querySelector('ol')
    var li = document.createElement('li')
    ol.appendChild(li)


    node.insertBefore(child, 指定子元素)
    ol.insertBefore(li,ul.children[0])


删除节点

    node.removeChild(child)
    



javascript:;
javascript:void(0);
    阻止跳转



复制节点

    node.cloneNode()        // 括号为空或者 false , 为浅拷贝，只复制标签，不复制内容
    node.cloneNode(true)


三种动态创建元素的区别

    document.write()
        如果文档加载完毕，会导致页面全部重新绘制
    document.innerHTML()
        如果是拼接字符串的话是最慢的
        如果是采用数组的话效率是最高的
    document.createElement()
        创建多个元素的效率比较高



## 事件高级

1. 注册事件的另外一种方式

2. 删除事件的两种方式

3. DOM 事件流的三个阶段

4. 阻止冒泡

5. 事件委托原理

6. 鼠标和键盘事件


### 1. 注册事件的另外一种方式 监听注册方式

传统方式只能处理一个事件，后面的会覆盖前面的

addEventListener()


    eventTarget.addEventListener(type, listener[, useCapture])

    type: 事件类型，如: click, mouseover
    
    listener 事件处理函数, 事件发生时会调用该监听函数

    useCapture: 可选参数，是一个 bool 值，默认 false


    ```
    var btn = document.querySelector('button')
    btn.addEventListener('click', function(){
        alert('hi')
    })
    btn.addEventListener('click', function(){
        alert('nice 2 meet you')
    })

    ```


### 2. 删除事件(解绑事件)

传统方式  .onclick = null

```
btn.addEventListener('click', fn)
function fn(){
    alert('nice 2 meet you')
    btn.removeEventListener('click', fn)
}

```



3. DOM 事件流

    事件传播的过程


        1. 捕获阶段
    |   document -> element html -> element body
    |                                   \|/
    |                                element div    2. 当前目标阶段
    |                                   \|/
    |   document <- element html <- element body
        2. 冒泡阶段

    事件冒泡: IE 最早提出，事件开始时由最具体的元素接收，然后逐级向上传播到DOM最顶层节点的过程
        onclick / attachEvent 只能得到冒泡阶段

    事件捕获: 网景最早提出，由DOM最顶层节点开始，然后逐级向下传播到最具体的元素接收的过程

    就像往水中扔石头一样
        
    |    |    document    |
    |       |   html   |
    |        |  body  |
    |         | div |

    JS 代码只能执行捕获或者冒泡中的一个阶段

    onclick / attachEvent 只能得到冒泡阶段

    addEventListener(type, listener[, useCapture])
        第三个参数如果是 true:  表示在捕获阶段调用事件处理程序
        第三个参数如果是 false: 表示在冒泡阶段调用事件处理程序

        真捕获，假冒泡(default)

    ```捕获和冒泡
    var father = document.querySelector('.father')
    var son = document.querySelector('.son')

    son.addEventListener('click',function(){console.log('son')},true)
    father.addEventListener('click',function(){console.log('father')},true)

    son.addEventListener('click',function(){console.log('son')},false)
    father.addEventListener('click',function(){console.log('father')},false)

    ```

    有些事件是没有冒泡的: onblur, onfocus, onmouseenter, onmouseleave

    我们一般使用冒泡

4. 事件对象

    div.onclick = function(event){}

    event 就是事件对象，写在侦听函数的小括号里边,当形参来看,只有有了事件才存在,不需要传递参数
    事件对象是我们事件的一系列相关数据的集合
    可以自己来命名，一般写成 e


    ```
    div.onclick=function(e){console.log(e)}
    son.addEventListener('click',function(event){console.log(event)})
    ```

    e.target            触发事件的对象(元素对象)
    e.srcElement        触发事件的对象(非标准 ie678)
    e.type              事件的类型, 没有 on

    e.preventDefault()  组织默认事件(行为),比如不跳转

    e.cancelBubble      该属性阻止冒泡(非标准, ie678)
    e.stopPropagation() 该方法阻止冒泡

    this 绑定的对象
    event 触发的对象

    e.target : 点击了那个元素，就返回哪个元素
    this: 哪个对象帮顶了这个点击事件，就返回哪个元素


    ```this 和 event
    <ul>
        <li>Lorem, ipsum.</li>
        <li>Quas, inventore?</li>
        <li>Placeat, mollitia.</li>
    </ul>

    <script>
    var ul = document.querySelector('ul')

    ul.onclick = function(e){
        console.log(this)
        console.log(e.target)

    }

    </script>
    ```



    ```阻止默认事件
    <a href="http://www.baidu.com">hello</a>
    <script>
        var a = document.querySelector('a')
        a.addEventListener('click',function(e){
            e.preventDefault();     // 方法1
            return false            // 方法2, 没有兼容性问题,只能用于 onclick 这种传统的注册方式
        })
    </script>
    ```




    ```阻止冒泡
    <ul>
        <li>Lorem, ipsum.</li>
    </ul>

    <script>
        var ul = document.querySelector('ul')
        var li = document.querySelector('li')

        li.addEventListener('click',function(e){
            e.stopPropagation()         // 阻止冒泡
            console.log('li')

            },false)

        ul.addEventListener('click',function(e){
            console.log('ul')

        },false)
    </script>
    ```

    

6. 事件委托原理

    事件冒泡的用处

    ul>li*5

    点击li,返回一个相同的

    不是每个子节点单独设置事件监听器，而是在父节点上设置事件监听器，然后利用冒泡原理影响每个子节点

    ```
    <ul>
    <li>Lorem, ipsum.</li>
    <li>Lorem, ipsum.</li>
    <li>Lorem, ipsum.</li>
    <li>Lorem, ipsum.</li>
    </ul>
    <script>
    var ul = document.querySelector('ul')
    var li = document.querySelector('li')

    li.addEventListener('click',function(e){
            e.stopPropagation()
            console.log('li')

            },false)

    ul.addEventListener('click',function(e){
        console.log(e)
        if(e.target.nodeName == 'LI'){
        e.target.style.backgroundColor = 'green'

        }

        },false)
    </script>
    ```

7. 常用事件

    禁止右键菜单    contexmenu

        ```
        document.addEventListener('contextmenu',function(e){
            e.preventDefault()
        })
        ```

    禁止选中    selectstart

    ```
    document.addEventListener('selectstart',function(e){
        e.preventDefault()
    })

    ```

8. 鼠标和键盘事件

    鼠标事件 MouseEvent

    PointerEvents API 是Hmtl5的事件规范之一，它主要目的是用来将鼠标（Mouse）、
    触摸（touch)和触控笔（pen）三种事件整合为统一的API。

    e.clientX       可视区X坐标
    e.clientX       可视区Y坐标

    e.pageX         文档页面的X坐标
    e.pageY         文档页面的Y坐标

    e.screenX       电脑屏幕的X坐标
    e.screenY       电脑屏幕的Y坐标

    ```鼠标跟随图片
    <style>
    img{
        width: 50px;
        position:absolute;
        top:0px;
        left:0;
    }
    </style>

    <img src="./cluo.jpg" alt="">
    <script>
        var img = document.querySelector('img')
        document.addEventListener('mousemove',function(e){
            console.log(e.clientX)
            img.style.top = e.clientY + 'px';
            img.style.left = e.clientX + 'px';

        })
    </script>

    ```

    键盘事件 KeyboardEvent

    onkeyup             抬起时触发
                        不区分大小写

    onkeydown           按下时触发, 优先级比 onkeypress 高
                        不区分大小写

    onkeypress          按下时触发,不识别功能键 ctrl alt shift 箭头
                        区分大小写

    e.keyCode       该键的 ASCII




### bom

Browser Object Model

BOM 缺乏标准，JS语法的标准化组织是 ECMA
DOM的标准化组织是 W3C
BOM最初是 Netscape 浏览器的一部分

顶级对象是 window

window.document

window.name 是 window 的一个特殊属性

window
    document
    location
    navigation
    screen
    history


window.onload 是窗口(页面)加载事件，当文档内容全部加载完会触发该事件(包括图像，
脚本文件，css文件等),就调用的处理函数

    传统的方式，只能写一次，多次会被覆盖

    可以用 addEventListener('load'), 没有限制

document.addEventListener('DOMContentLoaded',function(){})
    DOMContentLoaded 仅当 DOM 加载完成，**不包括样式表，图片等**


窗口大小发生变化
    window.onresize = function(){}

    window.innerHeight      屏幕宽度
    window.innerWidth       屏幕高度


定时器
    setTimeout(调用函数, 延迟毫秒数)
        延迟默认是0

    setInterval(调用函数, 延迟毫秒数)
        延迟默认是0

    可能有很多的定时器，所以赋值
        var a = setTimeout(调用函数, 延迟毫秒数)


    清除定时器
        window.clearTimeout(timeoutID)

        window.clearInterval


    短信
    ```
    <script>
        var btn = document.querySelector('button')
        var timer = 2;
        btn.addEventListener('click', function () {
            btn.disabled = true;
            var daojishi = setInterval(function () {
                if (timer <= 0) {
                    clearInterval(daojishi)
                    btn.innerHTML = '发送短信'
                    btn.disabled = false
                    tiemr = 2
                } else {
                    btn.innerHTML = '还剩' + timer + '秒再次发送'
                    timer--
                }
            }, 1000)
        })
    </script>
    ```



执行队列

    单线程,任务需要排队,这就是同步

    于是，出现了同步和异步


JS 执行机制
    同步任务都放在主线程的执行栈


    一般而言，异步任务有以下三种类型
        1. 普通事件: click,resize
        2. 资源加载: load, error
        3. 定时器  : setInterval, setTimeout

    JS 的异步任务是通过回调函数实现的，异步任务相关回调函数添加到**任务队列**中(任务队列也称为消息队列)


     主线程执行(同步任务)         任务队列(消息队列), 异步任务
    +-------------------+       +-------------------------------+
    |                   |       |                               |
    | console.log(1)    |       |                               |
    | setTimeout(fn,0)  |       | function fn(){console.log(3)} |
    | console.log(2)    |------>|                               |
    |                   |       +-------------------------------+
    +-------------------+                       |
           /|\          event loop(事件循环)    |
            |                                   |
            +----------------<------------------+

    !!!首先执行主线程中的同步任务，遇到异步任务,则放到任务队列中，一旦同步任务
    执行完毕，系统就会依次读取任务队列中的异步任务, 于是被读取的异步任务结束等
    待状态，进入执行栈，开始执行

    异步任务会由"异步进程"进行处理，异步进程会决定是否放入任务队列，如 click 只
    有在 click 的时候才会放到任务队列

    事件循环
        由于主线程不断的重复获得任务，执行任务，在获取任务，在执行，所以这种机制被称为**事件循环(event loop)**


location

    protocol://host[:port]/path/[?query]#fragment
        query : 以键值对的形式，通过 & 符号分隔开来
        fragment: 片段 #后面内容常见于链接锚点

        http://www.itcast.cn/index.html?name=andy&age=18#link


    location.href           获取或设置整个 URL
    location.search         返回参数,如: ?name=andy&age=18
    location.host           返回主机(域名)
    location.port           返回端口号 如果未写返回空字符串
    location.pathname       返回路径
    location.hash           返回片段 #后面内容 常见于链接 锚点, 如 #link


    window.location.href
    location.href

    ```
    <button>location.href 实现页面跳转</button>

    <script>
        var btn = document.querySelector('button')
        btn.addEventListener('click',function(){
            window.location.href="https://www.baidu.com"
        })
    </script>
    ```



    5秒后自动跳转

    ```
    <h1></h1>

    <script>
    var h1 = document.querySelector('h1')
    var timer = 5;
    var time = setInterval(function () {
        h1.innerText = timer--
        if (timer < 0) {
            // window.clearInterval(time)           // 跳转了就不用取消了
            window.location.href = 'http://www.baidu.com'
            }
        }, 1000)
    </script>
    ```


    登录页传参
    ```
    login.html
    <form action="index.html" method="'GET">
        username: <input type="text" name="username" id="username">
        <button>submit</button>
    </form>"'"


    index.html
    <h1>首页</h1>
    <p>你好: <span></span></p>
    <script>
        var span = document.querySelector('span')
        var a = location.search.substr(1).split('=')[1]
        span.innerText = a
    </script>

    ```


    location.assing()
        跟 href 一样，可以跳转页面(重定向页面)

        ```
        var btn = document.querySelector('button')
        btn.addEventListener('click',function(){
            location.assign('http://www.baidu.com')
        })
        ```

    location.replace()  替换当前页面，不记录历史，不能后退

        location.replace('http://www.baidu.com')

    location.reload()   重新加载页面，相当于刷新按钮或者 F5, true 表示强制刷新


navigator

    navigator 对象包含有关浏览器的信息，我们最常用的是 userAgent属性，该属性可
    以返回由客户机发送服务器的 user-agent 头部的值，判断是电脑还是手机


    navigator.userAgent

    navigator.appVersion 浏览器的版本号 

    navigator.appName 浏览器的名称 

    navigator.language 浏览器使用的语言 

    navigator.platform 浏览器使用的平台 

    navigator.userAgent 浏览器的user-agent信息



    其中userAgent 属性是一个只读的字符串，声明了浏览器用于 HTTP 请求的用户代理头的值。

    一般来讲，它是在 navigator.appCodeName 的值之后加上斜线和 navigator.appVersion 的值构成的。

    例如：Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)。


    //判断苹果、安卓、pc

    ```
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) { //判断iPhone|iPad|iPod|iOS

      window.location.href ="iPhone.html";

    } else if (/(Android)/i.test(navigator.userAgent)) { //判断Android

      window.location.href ="Android.html";

    } else { //pc

      window.location.href ="pc.html";

    };
    ```


history

    .back()      后退功能
    .forward()   前进功能
    .go(参数)    1：前进1个页面，-1:后退一个页面





## PC 端网页特效

常见 offset 系列属性的作用

常见 client 系列属性的作用

常见 scroll 系列属性的作用

封装简单动画函数

网页轮播图


### 1. offset

可以动态的得到该元素的位置（偏移）、大小等

    1. 获得元素距离带有定位父元素的位置
    2. 返回元素自身的大小（宽度和高度）

    注意:返回的数值都是不带单位的

常用属性:
    1. element.offsetParent         返回作为该元素带有定位的父级(上级)元素，如果父级没有定位，则返回 body
    2. element.offsetTop            返回元素相对带有定位父元素上方的偏移
    3. element.offsetLeft           返回元素相对带有定位父元素左边的偏移
    4. element.offsetWidth          返回自身包括 padding, border, 内容区的宽度，返回数值不带单位, border-box
    5. element.offsetHeight         返回自身包括 padding, border, 内容区的高度，返回数值不带单位, border-box


    ```
    <style>
        *{
            margin:0;
            padding:0;
        }

        .father {
            width: 200px;
            height: 200px;
            border: 1px solid green;
            margin: 100px;
            position:relative;
        }

        .son {
            width: 100px;
            height: 100px;
            border: 1px solid red;
        }
    </style>

    <div class="father">
        <div class="son"></div>
    </div>

    <script>
        var f = document.querySelector('.father')
        var s = document.querySelector('.son')
        // console.log(s.offsetParent)
        // console.log(s.offsetTop)

        console.log(f.offsetWidth)
        console.log(f.offsetHeight)
        console.log(s.offsetWidth)
        console.log(s.offsetHeight)
    </script>

    ```

    offset 和 style

    有单位       无单位
    borderbox    内容宽度
    只读         读写


    鼠标在盒子内的距离
        
        e.pageX - 盒子的 offsetLeft





## jQuery

javascript 库
    一个封装了很多函数、方法的js文件

jQuery: 学习调用这些函数(方法)

轻量级，即使KB
兼容性
链式编程
隐式迭代

jquery.com


1.x 兼容 ie678
2.x 不兼容 ie678, 不再更新


$(document).ready(function(){
    // 此处是页面 DOM 加载完成的入口
})



$(function(){
    // 此处是页面 DOM 加载完成的入口
})

相当于 DOMContentLoaded



jQuery 顶级对象 $, 和 jQuery 是等价的,互换的,



DOM对象
jQuery 对象
    用 jQuery 获得到的对象
    对原生对象进行了封装, 伪数组, 不能混用方法

    $('div').hide()


### jQuery 和 DOM 对象的转换

1. DOM -> jQuery

    $(DOM对象)


2. jQuery -> DOM

    原生的 video 才有 play 方法

    方法一: $('video')[0]
        $('video')[0].play()

    方法二: $('video').get(0)
        $('video').get(0).play()


### jQuery 常见 API


#### 1. jQuery 选择器

$('选择器')
    ID          $('#id')
    通配符      $('*')
    class       $('.one')
    标签        $('a')
    幷集        $('div,p,hr')
    交集        $('li.current')
    子代        $('ul>li')
    后代        $('ul li')


    $('div').css('属性':'值')
    $('div').css('background':'green')          隐式迭代(内部遍历操作)


筛选选择器
    :first      $('li:first')
    :last       $('li:last')
    :eq(index)  $('li:eq(2)')                   从零开始
    :odd        $('ol li:odd')                  奇数
    :even       $('ol li:even')                 偶数

筛选方法
    $('.son').parent()                          直接父元素
    $('.father').children('li')                 亲儿子, 相当于 >
    $('.father').find('li')                     后代选择器
    siblings(selector)                          所有兄弟元素,不包括自己
    $('li').eq(4)                               相当于 $('ol li:eq(4)')
    $('li').hasClass(类名)                      判断某个元素是否含有某个类名
    nextAll()                                   当前元素之前的所有同辈元素
    pretAll()                                   当前元素之后的所有同辈元素
    

    $(this).index() 当前所引号


排它思想

链式选择


#### 2. jQuery 样式操作

#### 3. jQuery 效果

#### 4. jQuery 属性操作

#### 5. jQuery 文本属性值

#### 6. jQuery 元素操作

#### 7. jQuery 尺寸、位置操作









## 数据可视化库

D3.js
    入手难
ECharts.js
    百度开源
Highcharts.js
    国外
AntV
    蚂蚁金服


技术栈
    html5 css 布局
    css3 渐变，动画
    jQuery库 原生js
    flex布局 rem 适配
    图片边框 border-image
    es6模板字符
    ECharts 可视化库


### echarts

底层依赖 ZRender

可以高度个性化定制


1. 引入 echarts.js文件
2. 一个 dom 容器
3. 初始化 echarts实例对象
4. 指定配置项和数据
5. 将配置项传递给 echarts 实例对象



```
// 1. 基于准备好的dom，初始化echarts实例
var myCharts = echarts.init(document.getElementById('main'))

// 2. 指定图表的配置项和数据
var option = {
title: {
text: 'ECharts 入门示例'

       },
tooltip: {},
         legend: {
data: ['销量']

         },
xAxis: {
data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']

       },
yAxis: {},
       series: [
       {
name: '销量',
      type: 'bar',
      data: [5, 20, 36, 10, 10, 20]

       }

       ]

};

// 3. 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
```


title 标题

tooltip 提示框组件

legend  图例组件

toolbox 工具栏(保存图片等)

grid    指教坐标系内绘制网格
    containLabel: left,right,为0时, 刻度标签溢出时，是否显示???

xAxis   x轴
    type:   
        value       数值
        category    类目轴,必须有 data
        data: ['one','two','three']
    boundryGap
        坐标轴上的刻度的对齐方式

yAxis   y轴

color   线条颜色
    color:['pink','red','yello']

series      系列
    type 
        line    线性
        bar
        pie
    name    用于 tooltip, 图例legen
    stack   数据堆叠，删掉即可








## AJAX (Asynchronous Javascript And XML)

页面无刷新获取数据

xml
    XML 中没有预定义的标签, 全都是自定义标签

    wechat

    现在已经被 JSON 取代了

优点:
    1. 无刷新获取数据
    2. 允许根据用户事件更新部分内容

缺点:
    1. 没有历史记录，不能回退
    2. 存在跨域问题
        可以解决
    3. SEO 不友好
        数据都没有请求回来，所以爬虫根本爬不到


XMLHttpRequest  AJAX的所有操作都是通过该对象进行的


    1. 创建 XMLHttpRequest 的实例对象

    2. 绑定监听

    3. 设置请求信息

    4. 发送请求




## 前端工程化

模块化(js 的模块化)

组件化(服用现有的UI结构,样式，行为)

规范化(目录结构的划分，编码规范，接口规范,文档规范化)

自动化(自动构建，自动部署，自动化测试)

早期的前端工程化解决方案
    grunt
    gulp

现在主流的前端工程化解决方案
    webpack
    parcel


代码压缩混淆，处理浏览器JS兼容性, 性能优化等

```
mkdir webpack && cd webpack
npm init -y
npm install jquery -S           // -S(--save) 要记录到 package.json 中
mkdir src
touch src/index.html
touch src/index.js

```
