
混杂模式
严格模式

## 严格模式

"use strict"

不允许使用未声明的变量

函数内部的 this 不再指向 window, 而是 undefined

eval("中的变量是局部的")    // 混杂模式下是全局的, 现在的浏览器好像也改了，不是全局的




## ES6 的模块自动采用严格模式，不管你有没有在模块头部加上"use strict";。

严格模式主要有以下限制。

    变量必须声明后再使用
    函数的参数不能有同名属性，否则报错
    不能使用with语句
    不能对只读属性赋值，否则报错
    不能使用前缀0表示八进制数，否则报错
    不能删除不可删除的属性，否则报错
    不能删除变量delete prop，会报错，只能删除属性delete global[prop]
    eval不会在它的外层作用域引入变量
    eval和arguments不能被重新赋值
    arguments不会自动反映函数参数的变化
    不能使用arguments.callee
    不能使用arguments.caller
    禁止this指向全局对象
    不能使用fn.caller和fn.arguments获取函数调用的堆栈
    增加了保留字（比如protected、static和interface）




## 

    ```
    var car = {
        type:'car',
            say(){
                console.log("i can run")
            }
    }

    var bmw = Object.create(car,{
        brand :{
            value:'bmw'
        }
    })

    console.log(bmw)
    ```

    1. value:
    2. writable:       该属性是否可以被修改，默认 false
        bmw.brand = 'hhh'

    3. configurable:   该属性是否可以被删除, 默认 false
        delete bmw.brand
    4. enumerable:     该属性是否可以被 for in 枚举， 默认 false
        for(var i in bmw){
            console.log('i:',i)
        }
    5. get:            当获取当前属性时的回调函数
    6. set:            当设置当前属性时的
    


实际原因是箭头函数根本没有自己的this，导致内部的this就是外层代码块的this。正是
因为它没有this，所以也就不能用作构造函数。

箭头函数的this永远指向其上下文的this，任何方法都改变不了其指向，如call(), bind(), apply()。


箭头函数不绑定arguments,取而代之用rest参数…解决
    var C = (...arg)=>{ //...c即为rest参数

    console.log(arg); //[3]

    }

    A(1);
    B(2);
    C(3);

    是真数组而不是伪数组
