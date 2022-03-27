<?php

echo '<pre>';
print_r($_COOKIE);
echo '</pre>';

if($_COOKIE['islogin'] !=null && $_COOKIE['islogin'] == true ){
    echo "welcome back Dear ".$_COOKIE['username'];

    echo '<br/>';
    echo '这是A页面';
    echo '<br/>';
    echo '<a href="./b.php">Go to Page B</a><br/>';
    echo '<a href="./logout.php">logout</a><br/>';
}else{
    echo "invalid login";
    echo '<meta http-equiv="refresh" content="./login.html">';
}
