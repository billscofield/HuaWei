if(isset($_POST['btn_submit'])){
    if(is_uploaded_file($_FILES['ifile']['tmp_name'])){
        $finfo = pathinfo($_FILES['ifile']['name']);
        $time = date('YmdHis');
        $newname = $finfo['basename'].$time.'.'.$finfo['extension'];
        var_dump($finfo);
        echo '<br>';
        echo $time;
        move_uploaded_file($_FILES['ifile']['tmp_name'],'upload/'.$newname);
    }else{
        echo "sorry";
    }
}

<form action="test.php" method='POST' enctype="multipart/form-data">
    <input type="file" name="ifile" id="ifile">
    <input type="submit" name='btn_submit' value="上传">
</form>
