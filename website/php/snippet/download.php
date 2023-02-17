<?php
if(!function_exists('finfo_open')){
    header('Content-type:text/html;chrset=utf8');
    exit('请先开启 fileinfo 扩展');
}
$file='./upload/a.txt';

$fileinfo = finfo_open(FILEINFO_MIME_TYPE);
$mimetype = finfo_file($fileinfo,$file);
finfo_close($fileinfo);

# 指定文件meme类型
header('Content-type:'.$mimetype);
#
# 指定文件描述
header('Content-Disposition:attachement; filename='.basename($file));

# 指定文件大小
header('Content-Length:'.filesize($file));

# 读取文件输出到缓冲
readfile($file);
?>
