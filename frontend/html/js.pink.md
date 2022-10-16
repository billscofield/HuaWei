


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
    for(key,value in OBJ)  x 错误, 只能有一个key
    for(key in OBJ)


### 对象分类

1. 内置对象

    mdn/w3c

    Math
        Unlike many other global objects, Math is not a constructor. All properties and methods of Math are static. 

        Math.random()   [0,1)

        Math.PI

        Math.max()
        Math.min()
        Math.abs()
        Math.ceil()
        Math.floor()

2. 浏览器对象

3. 自定义对象



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





