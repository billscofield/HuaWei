
# session

[link](https://www.bilibili.com/video/BV1FN411R7ta?spm_id_from=333.880.my_history.page.click)

```

$_SESSION[''] = 'value'

session_id();
session_name();

Cookies  PHPSESSID  



存储在服务器上

user a:2:{s:7:"islogin";b:1;s:4:"name";s:5:"admin";}

user array 2{
    string 7 islogin -> bool 1
    string 4 name -> string 5 admin
}


```

默认过期时间24分钟?

session 是通过 cookie 传的


## php 的设置

无论是apache还是nginx,php.ini都是适合的。而php-fpm.conf适合nginx+fcgi的配置

    session.name = PHPESSID
    session.auto_start = 0          // 会导致类无法使用，类的加载必须在 session 之前
    session.cookie_lifetime = 0     // 关闭浏览器前有效
    session.cookie_path = /         // session 的有效

