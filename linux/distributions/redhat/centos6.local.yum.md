## 更新本地yum源为搜狐

1. 备份自带的源文件

    mv /etc/yum.repos.d/CentOS-Base.repo  /etc/yum.repos.d/CentOS-Base.repo-backup

2. 编辑文件：vi /etc/yum.repos.d/CentOS-Base.repo   (华大学也是可以的：https://mirrors4.tuna.tsinghua.edu.cn/centos-vault/)

    ```
    [base]
    name=CentOS-6
    failovermethod=priority
    # 这个是官方的源 但是速度特别的慢，大概20kb吧，直接注释掉
    #baseurl=https://vault.centos.org/6.9/os/x86_64/
    # 搜狐源  网速200k左右，比较给力饿了
    baseurl=http://mirrors.sohu.com/centos/6.10/os/x86_64/
    gpgcheck=0
    ```

3. 清理软件源

    yum clean all

4. 建立源数据缓存

    yum makecache

## Local yum for centos6

ls -1 /etc/yum.repos.d

    1. CentOS-Base.repo
    2. CentOS-Debuginfo.repo
    3. CentOS-fasttrack.repo
    4. CentOS-Media.repo
    5. CentOS-Vault.repo
