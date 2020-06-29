
### 配置 apt-mirror

vi /etc/apt/mirror.list

```
# 设置数据根目录
# 默认是/var/spool/apt-mirror，该目录在软件安装时就会自动生成，里面有 mirror, skel, var 三个子目录，
# 在var里有clean.sh, postmirror.sh，如果在配置文件里修改了base_path，必须手动建立该文件夹，其中的三个子目录软件会自动生成, 实际只是没有自动创建 postmirrors.sh 文件
set base_path    /var/spool/apt-mirror


# set mirror_path  $base_path/mirror
# set skel_path    $base_path/skel
# set var_path     $base_path/var
# set cleanscript $var_path/clean.sh


# 如果系统是64位，默认只下载离线的64位离线包；如果想更改,可以用 deb-amd64 和 deb-i386
# 需要下载的镜像源的架构，也可以在制定镜像地址时通过 deb-i386 或者 deb-amd64 指定
# set defaultarch  <running host architecture>


# 如果更改了 base_path 变量，则可能需要手动创建
# set postmirror_script $var_path/postmirror.sh


# set run_postmirror 0  

# 20个线程同时下载
set nthreads     20

# 是否替换URL中的波浪线，替换成%7E（HTML代码），否则会跳过不进行下载
set _tilde 0

```

"deb-src"   为源码文件
"deb-i386"  为32位软件包
"deb-amd64" 为64位软件包
