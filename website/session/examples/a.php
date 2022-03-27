<?php
session_start();

echo session_id();
echo '<pre>';
#print_r($_COOKIE);
echo '</pre>';

if($_SESSION['user']['islogin'] !=null && $_SESSION['user']['islogin'] == true ){
    echo "welcome back Dear ".$_SESSION['user']['username'];

    echo '<br/>';
    echo '这是A页面';
    echo '<br/>';
    echo '<a href="./b.php">Go to Page B</a><br/>';
    echo '<a href="./logout.php">logout</a><br/>';
}else{
    echo "invalid login";
    echo '<meta http-equiv="refresh" content="./login.html">';
}
