# webpack


https://www.bilibili.com/video/BV1kP41177wp/?p=7&spm_id_from=pageDriver&vd_source=f1507fc10dd8d384b7dba30d9bd02202

CommonJS
    一个文件就是一个模块
    每个模块都有单独的作用域
    通过 module.exports 导出成员
    通过 require 函数载入模块

AMD(Asynchronous Module Definition)
    Require.js 实现了 AMD

Sea.js + CMD
    淘宝
    类似 Require.js


nodejs 中
    CommonJS
    内置的模块系统
浏览器中
    ES Module
    ES6 定义的

ES Module 特性

    1. 自动采用严格模式
        不能在全局使用 this, 默认为 undefined
    2. 每个 ES Module 都是运行在单独的私有作用域
        <script type="module">
            var a = 10
        </script>
        <script type="module">
            console.log(a)          // 报错
        </script>
    3. 外部 JS 文件是通过 CORS 方式请求的

    4. script 会自动延迟执行脚本
        类 defer 属性

    2014年提出

导入和导出

```
// module.js
var foo = 'es module'
export { foo }
export { foo, hello, Person }   // 这样用比较常见，放在最后

export {
    name as aliasName,
    age as aliasAge
}


export {
    name as default,        // default 的时候 import 的时候必须重命名
    age as aliasAge
}

import { default as xxx } from './module.js'



或者   export var foo = 'es module'

导出函数 
    export function say(){}



// app.js
import { foo } from './module.js'
console.log(foo)

---

export default name
import abc from './module.js'
```

export {name,age}           // 这个不是对象, 是固定的语法

如何导出一个对象
    export default { name:'abc',age:18 }
    export default 变量/值


导出的是引用，而不是复制, 暴露出的引用是只读的


import

    import { name } from './module.js'
        需要写完整的路径, 不能省略 ./ 
        也可以使用绝对路径
        完整的 url 地址

    import {} from './module.js'
    import './module.js'
        执行该模块

    import *  as mod from './module.js'

    import 不能嵌套在 if 中

如何动态导入模块
    import('./module.js').then(function(module){

    })


export {name,age}
export default 'gender'

import {name,age, default as xxx} from './module.js'
import abc, { name,age } from './module.js'
    abc 是 default



直接将导入变成导出成员
    export {foo,bar} from './module.js'
    在当前文件就不可以用了




