<?php

session_start();

if(isset($_POST['password']) && $_POST['password'] == '123'){
    // login succesfully
    $_SESSION['user']['islogin'] = true;
    $_SESSION['user']['username'] = $_POST['username'];
    echo '<script>alert("登录成功");location="./a.php"</script>';
}else{
    // login failed
    echo 'login failed';
}
