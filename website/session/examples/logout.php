<?php
    session_start();
    echo session_name();     // 获取 session id 的名字
    // 1. 客户端 COOKIE 过期, 让 SESSION ID 失效
    //setcookie('PHPSESSID',null,time()-1,'/');
    setcookie(session_name(),null,time()-1,'/');

    // 2. 清除当前 session 数组中的值
    $_SESSION['user'] = array();

    // 3. 删除服务器的SESSION 文件
    session_destry();
echo '<script>alert("退出成功");location="login.html"</script>';
