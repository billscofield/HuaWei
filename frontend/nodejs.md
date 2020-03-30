## 全局对象

console.log("")     //输出
setTimeout(function(){console.log('hello')},3000)   //定时器
setInterval(function(){console.log('hello')},3000)   //循环计时器



var time = 0
var timer = setInterval(function(){
        console.log(time + 'hello')
        time+=1
        if(time > 5){
            console.log("Game Over");
            clearInterval();
        }

    },1000)   //循环计时器



conosle.log(__dirname)      //当前脚本目录
conosle.log(__filename)     //当前文件绝对路径



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



模块

module.export = 函数名;


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


file main

var stuff = require('./mod')    //用于接收暴露的对象
`var say = require('./mod').say`
console.log(stuff.say(['a','b']))
console.log(stuff.eat())
```


## 事件

var events = require('events');         //事件库

var myEmitter = new events.EventEmitter();

myEmitter.on('someEvent',function(message){     //绑定了事件，事件名称叫 someEvent
    console.log(message);
})  


myEmitter.emit('someEvent','the event was emitted')
