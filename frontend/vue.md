
## 

DOM: javascript, jQuery, 模板引擎    主要是操作DOM

MVVM: angular, vue, react
    减少不必要的DOM操作
    数据双向绑定(VUE中，一个核心概念就是不让用户去操作DOM元素)

MVC 是后端的分层开发概念
    Model:只负责操作数据库
    View视图层: 负责展示，如果需要处理业务逻辑，需要通过网络请求去请求后端处理并响应
    Controller:业务层，控制层，具体业务逻辑, 只处理业务，不处理数据库(调用Model)
    路由:只负责分发路由, 页面跳转

MVVM 是前端的分层开发概念
    是view层分层开发思想，把每个页面分为M,V,VM三层
    M:model 作用是保存每个页面的数据，将数据和页面分离
    V:页面
    VM:调度者，分割了M和V， 每当view层想获取数据时，需要通过VM从model获取



## 

1. JavaScript 框架
1. 简化Dom操作
1. 响应式数据驱动


## node npm 的安装

Vue项目通常通过webpack工具来构建，而webpack命令的执行是依赖node.js的环境的，所以首先要安装node.js

下载官网源代码(注意有两种，一种是编译好的，一种是未编译好的, 本例用的是编译好的)

mkdir /usr/local/nodejs/

tar -xf 源代码 -C /usr/local/nodejs/

进入nodejs 查看版本

cd /usr/local/nodejs/node版本目录/bin/
./node -v

查看npm版本
./npm -v
npm prefix -g 会输出全局安装路径

vi ~/.bashrc
export PATH=$PATH:/usr/local/nodejs/node-v13.12.0-linux-x64/bin


### 更换淘宝npm源

npm install -g cnpm --registry=https://registry.npm.taobao.org


alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"



推荐直接安装cnpm插件，无需修改配置。
    npm install -g cnpm

## 安装并使用 vue-cli

cnpm install -g vue-cli

cd到对应的目录下初始化vue项目
　　命令：vue init webpack my-project

    create a new project with an official template
    vue init webpack my-project-name
    会自动创建一个 my-project-name 的文件夹

然后会提示一系列选项


运行npm项目
cd 项目路径
    改config/index.js host: '0.0.0.0'
    npm run dev

编译打包 cnpm run build
　　会编译打包到项目dist文件夹下，然后我们就可以部署到服务器上



Weex 构建 ios,android 原生应用
uniapp 小程序


## 介绍

package.json
    
src/
    项目目录, 我们写代码的地方

    app.vue     模板入口文件
    router/     路由



## {{}}  v-text  v-html  v-clock

<div id="app">
    <div>{{msg}}</div>
        当直接用占位符时，会有一闪的效果(网速较慢时)
        解决方案:
            <style>
                [v-clock]:
                    {display:none}
            </style>

        
        <div v-clock='msg'></div> 没有
    
    <div v-text='msg2'>你好</div>   覆盖标签中的内容


    <div v-html='msg3'></div>   会将data作为html语句进行渲染
</div>


<script>
   var vue = new Vue({
    el:'#app',  //绑定的元素
    data:{  //data是mvvm中的m, 专门存放每个页面的数据
        msg: 'hello vue',
        msg2: 'hahha',
        msg3: '<h1>hello'
    }
    
})
</script>




## v-bind 用于绑定属性的指令, 简写为 :属性

可以出现在任何地方
直接写属性时，是文本
加上v-bind 时，传入的是 vue 实例中的 data

<div id='app'>
    <button v-bind:title='msg'>这是一个按钮</button>
    <button :title='msg'>这是一个按钮</button>
</div>


## v-on

事件绑定，可以简写成 @属性

<div id='app'>
    <button v-on:click="show()">这是一个按钮</button>
    <button @click="show()">这是一个按钮</button>
</div>


<script>
var vue = new Vue({
    el:'app',
    data:{
        msg:'我是按钮'
    },
    methods:{           //用于定义所有可以调用的方法
        show(){
            alert("hello")
        }
    }
})

</script>



## v-model 双向绑定

浏览器安装vue.js插件, F12 查看

可以实现表单元素和model中的数据实现双向绑定，其中一方被修改时，另一方会同步修改

v-model 只能用于表单元素中


<div id='app'>
    <h1>{{msg}}</h1>
    <input type='text' v-model='msg'>
</div>


<script>
var vue = new Vue({
    el:'app',
    data:{
        msg:'hello'
    },
    methods:{
        show (){alert('hello') }   
        change_msg(){ this.msg='我被改变了' }
    }
})

</script>



<input type='text' :value='msg'>
<button @click='change_msg'>点我</button>
v-bind 只能用于单向绑定，当 model 中的数据被修改时, v-bind 绑定的位置会实时修改，而v-bind绑定的元素被修改时，model中的数据并不会被修改
说明了单向绑定


### 简单计算器

<div id='app'>
    <input type="text" v-model="num1">

    <select v-model='opt'>
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>

    <input type="text" v-model="num2">

    <button @click='jisuan'>=</button>

    <input type="text" v-model='result'>
</div>

<script>
var vue = new Vue(){
        el='#app',
            data:{
            num1:'0',
            num2:'0',
            result:'0',
            opt:'+'
        
            },
methods:{
            jisuan(this.opt){
                case '+':
                    this.result = parseInt(this.num1) + parseInt(this.num2)
                break;
                case '-':
                    this.result = parseInt(this.num1) - parseInt(this.num2)
                break;
                case '*':
                    this.result = parseInt(this.num1) * parseInt(this.num2)
                break;
                case '/':
                    this.result = parseInt(this.num1) / parseInt(this.num2)
                break;
            
            }
        
        }
    
}

</script>



## 样式

<div id="app">
    <div style='color:red'>第1个样式</div>                      //不建议使用, 打破mvvm思想，耦合性变高
    <div class='red'>第1个样式</div>                            //推荐
    <div :class="['red','size']">第1个样式</div>                //v-bind 绑定一个class数组
    <div :class="flag?'size':'red'">第1个样式</div>             //三元表达式
    <div :class="{'red':true}">第1个样式</div>                  //使用对象，提高代码可读性
    <div :class="{'red':true;'size':true}">第1个样式</div>      //推荐， 使用对象，提高代码可读性, 可以通过vue动态改变
    <div :class="classJuHe">第1个样式</div>                     //绑定data中的数据
    <div>第1个样式</div>
</div>


<script>
var vue = new Vue({
        el:'#app',
        data:{
            flag:true,
            classJuHe:{'red':true;'size':true}
        
        },
methods:{
changeStyle(){
                this.classJuHe.red=flase
            
}
        
}
    
        })
</script>

