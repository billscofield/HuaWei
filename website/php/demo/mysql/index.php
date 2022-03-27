<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>php mysql</title>
    <style>

    </style>
</head>
<body>
    <h1 align='center'>学生信息</h1>

    <form action="" method='post'>
        <p align='center'> <input type="button" value='增加数据' name='adddata' onclick="location.href='insert.php'"> </p>
        <p align='center'> <input type="text" name='searchitem'> 
        <input type="submit" value='搜索' name='searchbutton'>
        </p>

        <table width='900' border='1' align='center' cellspacing='0'>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>操作</th>
            </tr>
<?php

$link = mysqli_connect('172.17.0.9','bill','bill','school','3306');

if(!$link){
    exit('数据库链接失败');
}

if(empty($_POST['searchbutton'])){
    $res = mysqli_query($link,"select * from student order by id");
}else{
    $searchitem = $_POST['searchitem'];
    $res = mysqli_query($link,"select * from student where id like '%$searchitem%' or name like '%$searchitem%' or gender like '%$searchitem%' or age like '%$searchitem%' order by id");
}


while($row = mysqli_fetch_array($res)){

    echo '<tr align="center">';
        echo '<td>'.$row[0].'</td>';
        echo '<td>'.$row[1].'</td>';
        echo '<td>'.$row[2].'</td>';
        echo '<td>'.$row[3].'</td>';
        echo '<td>';
        echo "<input type='submit' name=upitem$row[0] value='修改'>";
        echo "<input type='submit' name=delitem$row[0] value='删除'>";
        echo '</td>';
    echo '</tr>';
    
        // 修改
        if(!empty($_POST["upitem$row[0]"])){
            echo '<tr>';
            echo '<td>'.$_POST["upitem$row[0]"].'</td>';
            echo "<td><input type='text' name='upname' placeholder='update name' value='$row[1]'></td>";
            echo "<td><input type='text' name='upgender' placeholder='update gender' value='$row[2]'></td>";
            echo "<td><input type='text' name='upage' placeholder='update age' value='$row[3]'></td>";
            echo "<td><input type='submit' value='确认修改' name='sureup".$row[0]."'>";
            echo '</tr>';
        }

        if(!empty($_POST["sureup$row[0]"])){
            
            $upname = $_POST['upname'];
            $upgender = $_POST['upgender'];
            $upage = $_POST['upage'];
            
            mysqli_query($link,"update student set name='$upname', gender='$upgender',age='$upage' where id='$row[0]'");
            header('location:#');
            
        }

        // 删除
        if(!empty($_POST["delitem$row[0]"])){
            mysqli_query($link,"delete from student where id=$row[0]");
            header('location:#');
        }
}



?>
        </table>
    </form>
</body>
</html>
