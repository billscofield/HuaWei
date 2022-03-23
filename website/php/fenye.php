<form action='' method='get'>
    <input type="text" name="nowPage" placeholder="请输入要显示第几页">
    <input type="text" name="nrow" placeholder="请输入每页显示多少item">
    <input type="button" name='previous' value="上一页">
    <input type="button" name='next'     value="下一页">
    <input type="submit">
</form>

<?php

$nowPage = $_GET['nowPage'] ?? 1;
$nrow = $_GET['nrow'] ?? 10;

$nextPage = $nowPage + 1;
$prePage = $nowPage -1;

if((int)$nrow == 0){
    $nrow = 10;
}



# $nrow : 每页显示几行
# $nthPage : 第几页
function showtable($arr,$nrow,$nthPage){
    echo '<table align="center" border="1" width="800">';
    echo '<tr>';
    echo '<td>编号</td>';
    echo '<td>姓名</td>';
    echo '<td>性别</td>';
    echo '<td>年龄</td>';
    echo '</tr>';

    if(empty($nrow) || $nrow < 1){
        $nrow = 10;
    }

    if(empty($nthPage) || $nrow < 1){
        $nthPage = 1;
    }

    $pages = ceil(count($arr) / $nrow);
    $tempArray = array_slice($arr, ($nthPage - 1) * $nrow, $nrow, true);


    echo 'now:'.$nthPage.'<br/>';
    echo 'tot:'.$pages.'<br/>';
    echo '<a href="?nowPage=1&nrow='.$_GET['nrow'].'">首页</a>';
    echo '<span>|</span>';
    if($nthPage < 2){
        echo '<a href="?nowPage=1&nrow='.$_GET['nrow'].'">上一页</a>';
        echo '<span>|</span>';
    }else{
        echo '<a href="?nowPage='.($_GET['nowPage'] -1).'&nrow='.$_GET['nrow'].'">上一页</a>';
        echo '<span>|</span>';
    }
    
    if($nthPage < $pages){
        echo '<a href="?nowPage='.($_GET['nowPage'] +1).'&nrow='.$_GET['nrow'].'">下一页</a>';
        echo '<span>|</span>';
    }
    else{
        echo '<a href="?nowPage='.$pages.'&nrow='.$_GET['nrow'].'">下一页</a>';
        echo '<span>|</span>';
    }


    echo '<a href="?nowPage='.$pages.'&nrow='.$_GET['nrow'].'">尾页</a>';

    #function gender($int){
    #    return $int == 0? "女" : "男";
    #}
    $gender=['女','男'];

    foreach($tempArray as $key=>$val){
        echo '<tr>';
        echo '<td>'.$val[0].'</td>';
        echo '<td>'.$val[1].'</td>';
        echo '<td>'.$gender[$val[2]].'</td>';
        echo '<td>'.$val[3].'</td>';
        echo '</tr>';
    }
    echo '</table>';
}



$arr = [
    $one = [0,'zhangsan',1,30],
    $two = [1,'lisi',1,29],
    $three = [2,'juice',0,28],
    $four = [3,'mike',1,30],
    $five = [4,'alice',0,28],
    $six = [5,'danny',1,31],
    $seven = [6,'liming',0,27],
];


showtable($arr,$nrow,$nowPage);
