<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加数据页</title>
</head>
<body>
    <h1 align="center">添加数据页</h1>

    <form action="" method="post" name="form_insert">
    <p align="center">姓名<input type="text" name="name"></p>
    <p align="center">性别<input type="text" name="gender"></p>
    <p align="center">年龄<input type="text" name="age"></p>
    <p align="center"><input type="submit" name="insert" value="添加"></p>
    </form>
<?php
    $link = mysqli_connect('172.17.0.9','bill','bill','school','3306');

    if(!$link){
        exit('数据库链接失败');
    }else{
        echo 'db connect success';
    }

    if(!empty($_POST['insert'])){
        $name = $_POST['name'];
        $gender = $_POST['gender'];
        $age = $_POST['age'];
        mysqli_query($link,"insert into student values(null,'$name','$gender',$age)");      // string 要添加引号
        header('location:./index.php');
    }


?>
</body>
</html>
