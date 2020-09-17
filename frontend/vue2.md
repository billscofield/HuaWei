G:\v.视频教程\19.frontEnd\vue\4个小时带你快速入门vue

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
    <img v-bind:class="{active:isActive}">      //对象的形式，active 是否生效取决于它的值
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


事件修饰符

    @keyup='func'

    @keyup.enter='func'

    https://cn.vuejs.org/v2/api/#v-on


#### v-model: 获取和设置**表单元素**的值（双向数据绑定）

```
<div id="app">
    <input type='text' v-model='message'>
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




```



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

