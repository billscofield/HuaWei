<?php
session_start();

if($_SESSION['user']['islogin'] !=null && $_SESSION['user']['islogin'] == true ){
    echo '<h1>This is page B</h1>';
    echo session_id();
}

