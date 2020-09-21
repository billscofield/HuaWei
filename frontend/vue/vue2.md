G:\v.视频教程\19.frontEnd\vue\4个小时带你快速入门vue

响应式: 数据来驱动页面的显示，更改了数据，前端页面自动刷新

mustache  [ˈmʌstæʃ; məˈstɑːʃ] 胡子 语法

一般是两个空格缩进

## 

el: 挂载点
    el: "#app"  建议
    el: ".app"
    el: "div"
    不能挂载到 <body>

data:数据对象

    data: {
        message:"hello world",
        school:{
            name:'abc school',
            mobile:'110'
        },
        campus:['bj','sh','nj']
    }

<div id="app">
    {{ school.name }}
    <ul>
        <li v-for="item in campus">{{ item }}<li>
    </ul>
<div>


## vue 指令

v- 开头的指令

### 内容绑定，事件绑定

#### v-cloak

cloak [kləʊk] 遮盖物, 斗篷

和 CSS 规则如 [v-cloak] { display: none } 一起用时，这个指令可以隐藏未编译的 Mustache 标签直到实例准备完毕。这样就不会出现 {{}} 闪现的问题


<script>

setTimeout(function(){
    let app = new Vue({
        el: '#app',
        data: {
            message: 'morning'
        }
    })
},1000)
</script>


#### v-text: 设置标签的文本值()textContent
    
```
<div id="app">
    <h2 v-text="message"><h2>
    <h2 v-text="message + '被拼接的字符串'"><h2>
<div>

<script>
    let app = new Vue({
        el: "#app",
        data: {
            message:"hello"
        }
    })
</script>
```
缺点是标签内的所有都会替换

{{}}
```
<div id="app">
    <h2>{{message + "被拼接的字符串"><h2>
<div>

<script>
    let app = new Vue({
        el: "#app",
        data: {
            message:"hello"
        }
    })
</script>
```

#### v-html: 设置标签的 innerHTML

容易导致 xss 攻击


### v-pre: 原意,跳过编译过程

跳过这个元素和它的子元素的编译过程。可以用来显示原始 Mustache 标签。跳过大量没有指令的节点会加快编译。

示例：

<span v-pre>{{ this will not be compiled }}</span>


### v-once 

只编译一次, 不再响应后续 model 修改, 可以提高性能




#### v-on: 为元素绑定事件

```
<div id="app">
    <h2>{{ message }}<h2>
    <button v-on:click="say">click</button>     //@click="方法名"
<div>

<script>
    let app = new Vue({
        el: "#app",
        data: {
            message:"hello"
        },
        methods: {
            say:function(){
                this.message="modified by v-on:click";
            }
        }
    })
</script>
```

例子计数器

```
<div id="app">
    <button v-on:click="add">+</button>
    <span>{{ num }}</span>
    <button v-on:click="sub">+</button>
</div>

<script>
    let app = new Vue({
        el: "app",
        data: {
            num : 1;    
        },
        methods: {
            add:function(){
                if(this.num < 10){
                    this.num++;
                }else{
                    alert("too large");
                }
            },
            sub:function(){
                if(this.num > 0){
                    this.num--;
                }else{
                    alert("too small");
                }
            }

        }
    )}
</script>

```

事件:
    v-on:click
    v-on:dbclick
    v-on:mousemove  鼠标移动 
        event.offsetX
        event.offsetY


### 显示切换，属性绑定

#### v-show: 根据表达式的真假，切换元素的显示与隐藏, 广告，遮罩层

原理: display:none

```
<div id="app">
    <img src=".." v-show='true'>        //bool
    <img src=".." v-show='is_show'>     //data数据
    <img src=".." v-show='age>=18'>     //表达式
</div>


<script>
    let app = new Vue({
        el: "#app",
        data: {
            is_show:'true',
            age:10
        }
    })
</script>
```

#### v-if: 根据表达式的真假，切换元素的显示和隐藏(操纵dom)

```
<div id="app">
    <input value="改变开关" v-on:click="alter_isShow>
    <img src=".." v-if="isShow">
    <img src=".." v-show="isShow">
</div>


<script>
    let app = new Vue({
        el: "#app",
        data: {
            isShow: false;
        },
        methods:{
            alter_isShow: function(){
                this.isShow = !isShow;
        }
    })
</script>
```

#### v-bind: 设置元素的属性

简写为 ":"
    v-bind:src=...
    :src=...

src,title,class 等

v-bind:属性名=表达式

```
<div id="app">
    <img v-bind:src='imageSrc'>
</div>

<script>
    let app = new Vue({
        el: "#app",
        data: {
            imageSrc='',
            isActive=false
        }
    })
</script>


---

<div id="app">
    <img v-bind:class="isActive:active:''">
    <img v-bind:class="{active:isActive}">              //对象的形式，active 是否生效取决于它的值
    <img v-bind:class="{类名1:值1,类名2:值2,...}">      //对象的形式，active 是否生效取决于它的值
</div>
```


### 列表循环，表单元素绑定

#### v-for

数组
    v-for="item in arr"
    v-for="(item,index) in arr"
    {{ index }}{{ item }}

对象
    v-for="(item,index) in objArr"
    {{ item.key }}
    food:[
        {name:"米饭"},
        {name:"面条"}
    ]


#### v-on

```
<div id="app">
    <h1 v-on:click="showTitle('你好')">{{title}}</h1>
</div>

<script>
    let app = new Vue({
        el:"#app",
        data:{
            title:"";
        },
        methods:{
            showTitle:function(title){
                this.title=title;
            }
        }
    })
</script>

```


获取按键 ascii

<input type="text" @keyup='outKeycode'>
methods:{
    outKeycode: function(event){
        console.log(event.keyCode);
    }
}

自定义按键修饰符

<input type="text" @keyup.aaa='outKeycode'>
<input type="text" @keyup.keyCodes.65='outKeycode'>     //如果不用下边的全局alias声明的话


<script>
    Vue.config.keyCodes.aaa=65      //自定义别名aaa 为 按键a
</script>


事件修饰符

    @keyup='func'

    @keyup.enter='func'

    https://cn.vuejs.org/v2/api/#v-on


    @keyup.delete       退格键
    <input type='text' @keyup.delete='clearContent'>
        data:{
            name:'用户名'
        }
        methods:{
            clearContent:function(){
            this.name=''
            }
        }


    stop
        v-on:click.stop='stopMoving'
    prevent
    capture
    self
    once

    使用修饰符时，顺序很重要



键盘事件和键值修饰符
    <input type='text' v-on:keyup='logName'>
    v-on:keydown
    v-on:keypress
    v-on:keyup.enter            //并触发 回车键 后才触发
    v-on:keyup.alt.enter        //链式赋值， alt + enter




#### v-model: 获取和设置**表单元素**的值（双向数据绑定）

```
<div id="app">
    <input type='text' v-model='message'>
    <input type='text' v-once v-model='message'>    //v-once 失效
</div>


<script>
    let app = new Vue({
        el: "#app",
        data: {
            message:"initial message"
        }
    })

</script>
```

底层原理 
    input 事件

    <input type="text" :value='msg' @input='handle'>

    handle: function(event){
        this.msg = event.target.value
    }

    或者将函数直接卸载标签内
    <input type="text" :value='msg' @input='msg=$event.target.value'>

#### 样式绑定

<div v-bind:class='{active:isActive}'></div>


data:{
    isActive:true,
},
methods:{
change:function(){
    this.isActive = !this.isActive
   }
}



#### 综合案例

1. 小黑记事本

```
<div id="app">
    <input type='text' v-model='newMessage' v-on:keyup.enter='storeMessage'>
    <ul>
        <li v-for="item in messages"></li>
    </ul>

    {{ messages.length }}
</div>


<script>
    let app = new Vue({
        el: "#app",
        data: {
            messages:[],
            newMessage:''
        },
        methods:{
            storeMessage:function(){
                this.messages.push(this.newMessage);   //添加自己到数组
            },
            remove:function(index){                    //删除, 数组.splice(index,length)
                this.messages.splice(index,1);
            }
        }
    })

</script>


2. 计算器
<div id="app">
    <input type="text" v-model='numa'>
    <br>
    <input type="text" v-model='numa'>
    <br>
    <button @click='add'></button>
</div>

<script>
let app = new Vue({
    el: '#app',
    data: {
        numa: '',
        numa: '',
        result: '',
    },
    methods: {
        add: function(){
            this.result=parseInt(this.numa)+parseInt(this.numb);
            this.result=Number(this.numa)+Number(this.numb);
        }
    }
})
</script>


```
### 带有事件对象的函数

<button @click='handle(1,2,$event)'></button>
<button @click='handle'></button>                   //默认传递事件对象为第一个参数

handle: function(a,b,event){
    console.log(event.target.innerHTML)
}

handle2: function(event){
    console.log(event.target.innerHTML)
         }

如果事件直接绑定函数名称，那么默认会传递事件对象作为事件函数的第一个参数


事件修饰符

    .stop 阻止冒泡

    .prevent 阻止默认行为
        <a href="z.cn" @click.prevent=''></a>

### 计算属性 computed:{}









## MVVM 设计思想

M  :model
VM :View-Model
V  :view

            +-------------------+
+----+ -----|  DOM Listeners----|----->  +-----+
|view|      |                   |        |Model|
+----+ <----|---Data Bindings---|------  +-----+
            +-------------------+
DOM             Vue                      Data


<script>

const obj = {
    num:0
}

let app = new Vue({
    el: '#app',
    data: obj,
    methods :{
    add : function(){
        this.num++          // Vue 做了代理，this, 所以还能用 this
    }
    }
})
</script>


创建 Vue 实例传入的 options
    选项，声明周期(官网上的这个 item下)

    el
        document.elementQuerry
    data   Object | function(组件的时候只能用函数)
        
    methods
    
    生命周期
        
        源码中执行到一定阶段会执行调用特定的你的代码

        beforeCreate

        created

        beforeMount

        mounted
            beforeUpdate
            updated

        beforeDestroy

        destroyed


## 网络应用 axios

axios: 功能强大的网络请求库

<script src='https://unpkg.com/axios/dist/axios.min.js'></script>

### get 请求

axios.get(地址).then(function(response){},function(err){})
axios.get(地址?查询字符串).then(function(response){},function(err){})
    axios.get(地址?key=value&key2=value2).then(function(response){},function(err){})

### post 请求

axios.post(地址,参数对象).then(function(){},function(err){})
    axios.post(地址,{key:value,key2:value2}).then(function(){},function(err){})




