
1. docker build PATH 问题

/root/test/docker/Dockerfile

/
docker build -f Dockerfile -t bill/test /root/test/docker/

报错
    unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /Dockerfile: no such file or directory
    好像man中说的PATH 不管用，但是在dockerfile目录中用dot却又管用, wtf


---

1. 如何查看当前docker已登录用户的用户名和密码

    查看所有docker服务器和登录的用户密码：

 ` cat /root/.docker/config.json

     输出结果中，auth 后面接的那一串就是经过base64编码后的用户名和密码信息，这
     里将其解码：

 ` echo [auth后面的那一串序列] | base64 -d -
