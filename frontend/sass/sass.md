## install

Sass基于Ruby语言开发而成，因此安装Sass前需要 安装Ruby。（注:mac下自带Ruby无需在安装Ruby!）

Ruby自带一个叫做RubyGems的系统，用来安装基于Ruby的软件。安装gems

mac
    gem install sass

    sass -v

win
    安装 ruby
    gem install sass

linux
    apt install ruby-dev
    ruby install sass

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

css 输出格式
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
