<?


// 遍历所有数组，遍历所有文件夹

function list_array_value($arr){
    foreach($arr as $key=>$val){
        if(!is_array($val)){
            echo $key.' : '.$val.'<br>';
        }else{
            list_array_value($val);
        }
    }
}
