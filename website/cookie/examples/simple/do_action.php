<?php

if(isset($_POST['password']) && $_POST['password'] == '123'){
    // login succesfully
    setcookie('islogin',true,time()+3600,'/');
    setcookie('username',$_POST['username'],'/');
    echo '<script>alert("登录成功");location="./a.php"</script>';
}else{
    // login failed
    echo 'login failed';
}
