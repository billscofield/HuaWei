# cookie

key value domain expires/max-age
    expires/max-age
        session 表示是内存型 cookie
        有时间的表示是持久 cookie

会话 cookie
    保存在内存

持久 cookie


## cookie 的查看

1. 单个网站的 cookie

    F12 / Application / Cookies

2. 浏览器的所有 cookies

    设置 / 搜索 Cookie / sell all cookies and site data

## 传输过程

client 请求， server setcookie('key',value,time()+3600) 通过响应头传给 client

以后 client 都会带上刚刚接收到的 cookie 信息, 实现鉴权

在 setcookie() 的那个页面是读不到 cookie 内容的


## 设置 cookie

1. php

    setcookie('name',value,time,'/');

2. js

    document.cookie='键=值';            // 项目路径下
    document.cookie='键=值; path=/';    // 网站根目录下

    读取
        var cookie = document.cookie;
