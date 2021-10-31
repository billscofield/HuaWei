
1. docker build PATH 问题

/root/test/docker/Dockerfile

/
docker build -f Dockerfile -t bill/test /root/test/docker/

报错
    unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /Dockerfile: no such file or directory
    好像man中说的PATH 不管用，但是在dockerfile目录中用dot却又管用, wtf


---

1. 
