## 什么是 sass

Syntactically Awesome Stylesheets 语法上很棒的样式表

官网
    https://sass-lang.com

中文
    https://www.sass.hk

Sass 是一种动态样式语言，由 ruby 开发，Sass 语法属于缩排语法

## Sass 与 Scss 的区别

sass 从第三代开始，放弃了缩进式风格，并且完全向下兼容普通的 css 代码，这一代的 sass 也被称为 scss

## sass/scss 与 less, stylus 的区别

less 需要 less.js
stylus 需要安装 node



## install 

Sass基于Ruby语言开发而成，因此安装Sass前需要安装 Ruby。（注:mac下自带Ruby无需在安装Ruby!）

Ruby自带一个叫做RubyGems的系统，用来安装基于Ruby的软件。安装gems

1. mac

    gem install sass

    sass -v

2. win

    安装 ruby
    gem install sass

3. linux

    apt install ruby-dev
    gem install sass

更新 sass

    gem update sass

帮助
    sass -h


编译

    方法一，手动
        sass sass/style.scss:css/style.css

    方法二
        sass --watch sass:css                   // 监视 sass 中的 sass 文件，输出到 css 文件夹
        
        sass --watch sass:css --style compact

### css 输出格式

nested      :嵌套,default
compact     :紧凑
compressed  :压缩
expanded    :扩展

    ```
    ul{
        font-size:16px;
        li{
            list-style: none;
        }
    }

    输出如下:
    ul {
        font-size: 16px; }
        ul li {
            list-style: none; }
    ```

## 语法

1. 最开始的缩进式: .sass

2. Sass cass: .scss
    
    注释
        1. /* */
        2. //

    @import "base";     // ；



### 变量

$primary-color: #f40;   // ;

$primary-border: 1px solid $primary-color;

引用
    background-color: $primary-color;

    h1.page-header{
        border: 1px solid $primary-color;
    }

```
.nav {
    height: 100px;
    ul {
        margin: 0;
        li{
            float:left;
            list-style:none;
            padding: 5px;
        }
    }
}


a{
    display:block;
    color:#000;
    padding:5px;
    &:hover{        // & 引用父选择器 a
        background-color: #f40;
        color: #fff;
    }
}



```
