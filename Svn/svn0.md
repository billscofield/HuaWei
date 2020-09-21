
https://www.bilibili.com/video/BV13s411h7QM?p=11

SCM: 软件配置管理，就是对软件源代码进行控制与管理

第一次下载叫做 checkout, 以后叫做 update

上传提交 commit

### 创建

svnadmin create 项目名称  路径
    svnadmin create webapp /webapp/shop/

### 运行

svnserver -d(后台运行) -r(目录) /webapp/shop


### 拉取

svn://ip            当只有一个项目时，只需要写 ip, 不用写后边的, 不用写端口号???


### 服务器配置

默认不允许匿名用户登录
    /webapp/shop/svnserver.conf

        anon-access = read
        anon-access = write

### 冲突

index.php           整合后的index.php 文件
index.php.mine      删除
index.php.r6        删除
index.php.r7        删除

重新 commit



## 配置多仓库

svnserver 只能监管一个项目，不能监管多个项目

所以在项目外边套一个目录, 在这个上层目录进行监管

svnserve -d -r 项目的上层目录
    svnserve -d -r /webapp


访问
    svn://ip/项目n


### 权限

要先开启权限功能, 默认没有开启

svnserver.conf 文件
    ```
    不能开启匿名用户
    #anon-access = write
    #auth-access = write
    password-db = passwd
    authz-db = authz
    ```

conf 文件夹
    
    authz 文件, 授权文件, 哪些用户有哪些权限
    ```
    [groups]
    admin = admin,admin1,lisi
    itcast = itcast
    
    [shop:/]            //项目文件:/
    @admin = rw
    itcast = r
    * = r

    ```

    passwd 文件, 用户名和密码
    ```
    [users]
    admin = adminpassword
    ```

自启动

    /etc/rc.d/rc.local


    windows :
        sc create SVNService binpath= 'D:\subversion\bin\svnserver.exe --service -r D:/svnroot/' start= auto

        sc delete SVNService

        net stop SVNService

        net start SVNService





钩子程序
    /hooks/ 中包含各种版本库钩子模板    

    可以用批处理或shell编写

    post-commit.tmpl:事务完成后所触发的钩子程序

        设置服务器svn程序路径
            SET SVN="D:\svn\bin\svn.exe"

        指定 Web 服务器工作目录
            SET DIR="D:\server\apache\htdocs\shop"

        通过 update 命令实时更新
            SVN update %DIR%
        
        更改文件扩展名为 bat
