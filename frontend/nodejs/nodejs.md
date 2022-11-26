## nodejs

高并发



### 全局对象

console.log("")     //输出
setTimeout(function(){console.log('hello')},3000)       //定时器
setInterval(function(){console.log('hello')},3000)      //循环计时器

var time = 0
var timer = setInterval(function(){
        console.log(time + 'hello')
        time+=1
        if(time > 5){
            console.log("Game Over");
            clearInterval();
        }
    },1000)   //循环计时器


```
conosle.log(__dirname)      //当前脚本目录
conosle.log(__filename)     //当前文件绝对路径
```



## 函数

普通函数
    function say(){
        console.log('hi');
    }

函数表达式
    var a = function say(){
        console.log('hi');
    }

    a(); 


回调函数
    function callFun(fun,name){
        fun(name);
    }

    function say(what){
        console.log("Hello "+what);
    }

    callFun(say,'star');


数组.length


## 模块

前端的模块化
    <script src='./a.js' type='module'></script>
    <script src='./b.js' type='module'></script>        // 不能访问 a.js 中的变量了



    index.js                // 在一个脚本中加载另一个脚本
        import './js/a.js'

    js/a.js
        console.log('a.js')

    index.html
        <script scr='./index.js'></script>


    案例


    ```
    index.html
    <script src='./index.js' type='module'>

    index.js
        import('./a.js')

    a.js
        console.log('fuck')
    ```




    ```
    index.html
        <script src="./index.js" type="module"></script>            // 必须有 type = 'module'

    index.js
        import fromA from '/a.js'       // 引入 export default  的可以随意命名

    a.js
        var a = 1
        export default {a:a}            // 有default 只能写一个 export 
    ```



    ```
    index.html
        <script src="./index.js" type="module"></script>            // 必须有 type = 'module'

    index.js
        import {a, b} from '/a.js'               // a.js 暴露出什么，就必须 import 什么，不能改名字, 会导致冲突, 解构
        import {a as aa, b} from '/a.js'         // 重命名

    a.js
        export var a = 1;       //可以暴露出去多个
        export var b = 2;       //可以暴露出去多个
    ```

    解构
        const { name:a, gender:b, age: c } = student

        a -> 'zhangsan'
        b -> 'boy'
        c -> '18'


    ```
    const age = 20

    const student = {
        name:'zhangsan',
        age,                    // es6 简写的语法, age = age 如果属性名和属性值是同样的字符串，可以简写
        gender:'boy'
    }


    const {name, age, gender} = student         // 简写 const { name: name, ... }
    ```


    对象方法的简写

    ```
    const student = {
        name:'zhangsan',
        say: function(){}           // say(){}
    }
    ```


    ```
    const student = {
        name: 'zhangsan',
        age:18,
        gender: 'boy'
    }
    const s0 = student              // 引用
    const s1 = {...student}         // 深拷贝

    const a = [1,2,3]
    const b = [...a]
    const c = ...a              // 这样是错误的


    const person = {
        ...student,
        city: 'bj'
    }
    ```


---

后端模块化

commonjs 等同于 ecmascript
    是一种规范，nodejs 就是这个规范的实现

    javascript 是 ecmascript 的实现


nodejs 中 js 文件默认就是一个模块

    module.exports.num = num            // 暴露的还是一个对象, num 是一个属性
    module.exports.foo = foo()          // 暴露的函数的返回值
    const num1 = require('./a.js')      // num1['num']


    require()
        在 b 中执行 a.js
    


        module.exports = {
            a:1,
            b:2,
            c:3
        }

        const { a:a, b:b c:foo }  = require('./a.js')   // 属性名一定要一致, 假设这个脚本中 c 已经用了，用 foo 接受 c



    require 只会加载一次, 第一次就加载到缓存，第二次加载直接从缓存拿
        可以省略 js 后缀
        我们自己的模块必须要有路径
        没有路径的是系统的模块



module.exports = 对象

```
file mod

function say(arr){
    return arr.length;
}
function eat(){
    return 'i am eating'
}

module.exports.say = say;       //将对象暴露出去
module.exports.eat= eat;        //将对象暴露出去

或者这样
module.exports = {
    say: say,
    eat: eat,
    name: name
}


module.exports = {
    say,
    eat,
    name
}


file main

var stuff = require('./mod')    //用于接收暴露的对象
`var say = require('./mod').say`
console.log(stuff.say(['a','b']))
console.log(stuff.eat())
```


false
undefined
null
NaN
''  ""  ``
0


## fs 模块

https://nodejs.org/dist/latest-v18.x/docs/api/fs.html


1. fs.readFile()           异步

    ```01.js

    const fs = require('fs')

    fs.readFile('./01.txt','utf-8',function(err, data){
        console.log('err',err)              // 没有返回 null
        console.log('data',data)
    })

    ```

2. fs.readFileSync()

    const data = fs.readFileSync('./01.txt','utf-8')


    try{
        const data = fs.readFileSync('./01.txt','utf-8')
    } catch(error){
        console.log(error)
    }


3. fs.writeFile

    从头开始覆盖
    如果文件不存在则创建

    ```
    fs.writeFile('./01.txt','写入的内容',function(error){
            if(error){
                console.log("failed")
            }
    })
    ```

4. fs.appendFile()

    ```
    fs.appendFile('./01.js','追加的内容',function(error){
        
    })

    fs.appendFile('./01.js','追加的内容',error =>{          只有一个参数，小括号可以省略
        if(error){

        }else{

        }
    })
    ```

5. fs.copyFile()

    ```
    fs.copyFile('源文件','目标文件', error => {
        if(!error){

        }else{

        }
    })
    ```

6. fs.copyFileSync

7. fs.unlink()  删除文件

    ```
    fs.unlink('文件',error =>{

    })
    ```

8. fs.rename('源文件','路径/文件',error => {})
    
    同 mv 命令


文件夹

创建文件夹
    
    fs.mkdir('路径名', error => {})

    fs.mkdirSync

删除文件夹

    fs.rmdir('路径', error =>{})

        linux 中的 rmdir

    fs.stat(path[, options], callback)


读取文件夹内容

    fs.readdir

    ```
    fs.readdir('路径', (error, data)=>{
        data是数组, 只是一层
    })
    ```

判断文件/文件夹是否存在

    fs.existsSync(path)

    fs.access('路径', error =>{
        if(!error){
            文件/文件夹存在
        }
    })


    fs.stat 是文件还是文件夹

    fs.stat('路径', (error, statsObj)=>{
        if(error){
            失败
        }else{
            statsObj.isFile()
            statsObj.isDirectory()
        }
    })


## path 模块

const path = require('path')

node 提供的 __dirname 当前脚本的绝对路径

path.basename(path[, suffix])
    suffix <string> An optional suffix to remove
    文件名
    path.basename('/foo/bar/baz/asdf/quux.html');

path.dirname(path)


path.extname(path)

    The path.extname() method returns the extension of the path, from the last
    occurrence of the . (period) character to end of string in the last portion
    of the path.

    If there is no . in the last portion of the path,
    or if there are no . characters other than the first character of the basename of path (see path.basename()) ,
    an empty string is returned.

    ```
    path.extname('index.html');
    // Returns: '.html'

    path.extname('index.coffee.md');
    // Returns: '.md'

    path.extname('index.');
    // Returns: '.'

    path.extname('index');
    // Returns: ''

    path.extname('.index');
    // Returns: ''

    path.extname('.index.md');
    // Returns: '.md'
    ```

path.join([...paths])

    ```
    path.join('/foo', 'bar', 'baz/asdf', 'quux', '..');         // .. 返回上层路径
    // Returns: '/foo/bar/baz/asdf'
    ```

path.resolve([...paths])
    The given sequence of paths is processed from right to left,
    直至找到绝对路径就停止
        path.resolve('/foo', '/bar', 'baz') would return /bar/baz
    如果没有找到绝对路径，就用当前路径
        path.resolve('wwwroot', 'static_files/png/', '../gif/image.gif');
        // If the current working directory is /home/myself/node,
        // this returns '/home/myself/node/wwwroot/static_files/gif/image.gif'

path.parse(path)
    The returned object will have the following properties:

    dir <string>
    root <string>
    base <string>
    name <string>
    ext <string>

    For example, on POSIX:

    path.parse('/home/user/dir/file.txt');
    // Returns:
    // { root: '/',
    //   dir: '/home/user/dir',
    //   base: 'file.txt',
    //   ext: '.txt',
    //   name: 'file' }

    ┌─────────────────────┬────────────┐
    │          dir        │    base    │
    ├──────┬              ├──────┬─────┤
    │ root │              │ name │ ext │
    "  /    home/user/dir / file  .txt "
    └──────┴──────────────┴──────┴─────┘
    (All spaces in the "" line should be ignored. They are purely for formatting.)



    On Windows:

    path.parse('C:\\path\\dir\\file.txt');
    // Returns:
    // { root: 'C:\\',
    //   dir: 'C:\\path\\dir',
    //   base: 'file.txt',
    //   ext: '.txt',
    //   name: 'file' }
    ┌─────────────────────┬────────────┐
    │          dir        │    base    │
    ├──────┬              ├──────┬─────┤
    │ root │              │ name │ ext │
    " C:\      path\dir   \ file  .txt "
    └──────┴──────────────┴──────┴─────┘




异步的发展史

    回调函数
    Promise     es6
    generator   es6
    async/await es7 异步的终极解决方案


## http

    ```
    #!/usr/bin/env node

    const http = require('http')

    const app = http.createServer(function(req, res){
        res.write('hello')
        res.end()
    })

    app.listen(Number(3000))

    ```





## promise

承诺

const p = new Promise((resolve, reject)=>{            // 两个函数
    resolve()
})


p.then(function(){

}, function(){

})



## async/await

异步函数

async function foo(){
    
}

返回一个 Promise 对象，



await 用于等待一个 Promise 对象, 即等待一个异步处理的结果

```
async function foo(){
    const p1 = await p;
    console.log(p1)
}
```




## npm

npm -v


安装
    1. 项目内安装
        npm install jquery --save
        npm i jquery --save

        新版本加不加 --save 都会记录信息到 pacjage.json 中
        如果只是临时安装 Express，不想将它添加到依赖列表中，可执行如下命令：
            npm install express --no-save

        node_modules        存放的路径

        package.json
        ```
        {
            "dependencies": {
                "express": "^4.18.2",
                "jquery": "^3.6.1"
            }
        }
        ```
            如果没有使用 npm init, npm i 时也会生成该文件

        package-lock.json


    2. 全局安装
        -g

        npm config get registry
        npm config set registry https://registry.npm.taobao.org
        还原默认源：npm config set registry https://registry.npmjs.org
        npm --registry https://registry.npm.taobao.org install XXX（模块名）

        /root/.npmrc
            home=https://npm.taobao.org
            registry=https://registry.npm.taobao.org/


    3. 卸载包

        npm uninstall 包



项目初始化
    npm init
    生成 package.json

    npm init -y         // 全部默认

    下载项目所需的所有包
        npm i           // 根据 package.json 下载安装所有的 dependencies


## express

npm i express --save


Express 应用程序生成器
通过应用生成器工具 express-generator 可以快速创建一个应用的骨架。

你可以通过 npx （包含在 Node.js 8.2.0 及更高版本中）命令来运行 Express 应用程序生成器。

    npx express-generator

通过 npm 将 Express 应用程序生成器安装到全局环境中并使用：

    npm install -g express-generator

    express 文件夹
    npm i

    npm start

    bin/www(js文件) -> 默认 3000 端口


目录
    bin/
        www

    node_modules/
    
    package.json

    package-lock.json

    public/
        images/
        javascripts/
        stylesheets/

    routes/
        index.js
        users.js

    views/              模板引擎
        error.jade
        index.jade
        layout.jade

    app.js              // 服务器详细配置，app入口文件



    当public中有 index.html 时就不会显示 index.jade 中的内容了

    package.json
        "scripts": {
            "start": "node ./bin/www"
        }
        

        "dependencies": {
            "cookie-parser": "~1.4.4",      ~ 向后(未来)兼容
        }

    app.js
        var logger = require('morgan');     // 日志

        // 用于配置 ajax 请求的一级路径
        app.use('/', indexRouter);
        app.use('/users', usersRouter);




    更改启动
        app.js
            module.exports = app;               注释掉
            app.listen(3000, ()=>"启动成功")    添加
        node app.js                             启动


        npm i nodemon -g
            nodemon app.js







## 事件

var events = require('events');         //事件库

var myEmitter = new events.EventEmitter();

myEmitter.on('someEvent',function(message){     //绑定了事件，事件名称叫 someEvent
    console.log(message);
})  


myEmitter.emit('someEvent','the event was emitted')






req.body
req.query





## post

1. application/x-www-form-urlencoded

    urlencoded 格式，又叫 form 格式、x-www-form-urlencoded 格式
    它是一种表单格式

    post的默认数据传输格式就是 x-www-form-urlencoded

    application/x-www-form-urlencoded:这是默认的编码格式,它是以传输键值对的形式传参
    的, 例如:

        name=张三&age=18


    app.use(express.urlencoded({extended:false})); 

        如果设置为false，那么对URL-encoded的数据的解析采用querystring库；
        如果设置为true，那么采用qs库，允许将富对象和数组编码为url编码格式，允许使用url编码的json体验。

        当extended为false的时候，键值对中的值就为'String'或'Array'形式，
        当extended为true的时候，则可为任何数据类型。




2. multipart/form-data




3. application/json

    application/json:他传输的是json格式的数据例如:

        {“name”:“张三”,“age”:“18”}



    x-www-form-urlencoded格式代码不需要写contentType,而json格式代码需要加上contentType: ‘application/json;charset=UTF-8’




## commonjs 规范

1. 模块引用


2. 模块定义


3. 模块标识
