## Vuejs

javascript 框架

vue 和 vuejs 是一样的

angularjs 是第一版本， 第二版本 叫 angular

渐进式的框架, 排他性不是很强烈

    你可以将 Vue 作为你应用的一部分嵌入其中

    声明式渲染 -> 组件系统 -> 客户端路由 -> 集中式状态管理 -> 项目构建

Vue 全家桶
    
    core

    Vue-router

    Vuex

特点

    解耦视图和数据

    可复用的组件

    前端路由技术

    状态管理

    虚拟 DOM


## Vue.js 安装


vue2
    https://v2.cn.vuejs.org/
vue3
    

方式一:

    CDN 引入

    开发环境和生产环境

方式一:

    下载引入

    开发环境: wget https://vuejs.org/js/vue.js
    生产环境: wget https://vuejs.org/js/vue.min.js

方式三:
    
    npm 安装

    npm install vue


Vue.config  全局配置

    productionTip

    ```
    You are running Vue in development mode.
    Make sure to turn on production mode when deploying for production.
    See more tips at https://vuejs.org/guide/deployment.html
    ```

    Vue.config.productionTip = false

    发现不好用，直接在 vue.js 中更改
    应该是加载顺序的问题，Vue加载的时候就输出了，我们确实改了，但是晚了


## Python开启HTTP服务

Python <= 2.3

    python -c "import SimpleHTTPServer as s; s.test();" 8000

Python >= 2.4

    python -m SimpleHTTPServer 8000

Python 3.x

    python -m http.server 8000


## 

{{}} js 的表达式一般都可以放在里边

响应式: 做了一些修改后页面会自动响应

编程范式: 声明式编程
    插入式的模板, Must

特点: 数据和页面完全分离


    el: 要管理哪些元素, 元素的挂载位置, 不要挂在在 html body 元素上

    data: 模型数据

    模板 + 数据 = 前端渲染






