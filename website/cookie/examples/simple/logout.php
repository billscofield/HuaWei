<?php

setcookie('islogin',null,time()-1,'/');
setcookie('username',null,time()-1,'/');

echo '<script>alert("退出成功");location="login.html"</script>';
