## 安装svn Server

仓库 / 项目

subversion的每次commit都会导致整个仓库版本号增加一个，会使得多个项目的版本号出现断层。而且如果多个项目参与人不同，就必须使用apache2进行细粒度的权限控制，不是太方便。一个仓库一个项目，显得更优雅一些。

    他这个也是一个仓库下多个项目，authz && passwd 放到仓库目录
    https://blog.csdn.net/webnoties/article/details/17219589
    https://www.cnblogs.com/howhy/p/6867130.html

一个服务器可以subserve 多个项目吗?

多项目管理配置方案

sudo apt install subversion

mkdir -p /data/svn/project_one
mkdir -p /data/svn/project_two
svnadmin create /data/svn/project_one


cd /data/svn/project_one/conf
mv authz passwd ../../
rm /data/svn/project_two/conf/passwd authz
    passwd //账号密码
        user1 = pass1
        user2 = pass2
    authz  //组、权限

        [groups]
        svnadmin = user1,user2  //不可以有缩进
        
        [/]  或者是 [SVN:/]
        svnadmin = rw
        * = 

        [project_one:/]     //应该是[/project_one:/]的缩写
        dev = rw
        * =             //**这一个最好写上，因为权限具有继承性，这句话的作用就是切除继承性**


        ```
        * 是指所有人，= 后面表示权限
            1. 空，表示没有任何权限
            1. r , 表示只读权限
            1. rw ， 表示读写权限
        ```
            
        配置文件不允许存在前置空格
        对某个子目录具备读权限，就必须对其父目录具备读权限
        如果让某人访问某目录，必须显式指明

    vi svnserve
        anon-access = none
        auth-access = write
        password-db = ../../passwd
        authz = ../../authz
        realm =         //svn下有多个项目时，所有项目的realm都要一样 （王国，领域）
            权限域名，写你的工程名
            应该保证所有的版本库使用相同的realm值，这样，对版本库的密码缓存可以在多个版本库之间共享，更多细节见"客户端凭证缓存"
    

## 启动svn Server
svnserve -d -r /data/svn
    -d --daemon
    -r --root   : root of directory to serve
    --listen-port ARG : default 3690
    --log-file ARG : svnserve log file
    版本库的目录地址（版本库的上一级地址）

ps -aux | grep svnserve 或者 netstat -apn | grep 3690
kill -9 

或者 killall svnserve


浏览器打开版本库
    svn://192.168.10.147/project_one
    svn://192.168.10.147:3690/project_one

默认端口号: 3690

## 防火墙配置
/sbin/iptables -I INPUT -p tcp --dport 3690 -j ACCEPT
/etc/init.d/iptables save
service iptables restart


### windows 搭建服务器开机启动
sc create 服务名称 binpath = "svnserve.exe -service -r D:/svn/webapp" start = auto
    start = auto 自启动

services.msc

1. svnserviceSTART.bat  //启动服务
    net start SVNService
1. svnserviceSTOP.bat   //停止服务
    net stop SVNService
1. svnserviceDELETE     //删除服务
    sc delete SVNService

### linux 开机自动运行
1. 自启动脚本
    /root/svn.sh
        /usr/bin/svnserve -d -r /data/svn
    chmod 777 svn.sh

2. 开机调用脚本
    vi /etc/rc.local
        /root/svn.sh

## 利用钩子实时同步到服务器
    这个是提交到svn服务器后自动传到发布站点网站
    钩子就是与一些版本库事件触发的程序,例如新修订版本的创建，或是未版本化属性的修改
    默认情况下，钩子的子目录（版本库仓库/hooks）中包含了各种版本库钩子模板
        post-commit.tmpl 事务完成后所触发的钩子程序
        可以采用批处理指令或shell指令进行编写
    类似触发
    
    复制post-commit.tmpl -> post-commit.bat
        指定svn服务器路径 
            SET SVN="D:\svn\bin\svn.exe"
        指定web服务器工作路径
            SET DIR="D:\service\apache\htdocs\shop"
        通过update指令实时更新到DIR目录
            SVN update %DIR%


## SVN扩展程序

在线开发平台

百度应用引擎(BAE) 百度推出的网络应用开发平台，基于BAE架构，使开发者不需要维护任何服务器，只需要简单的上传应用程序，就可以为用户提供服务

开发者可以基于BAE平台进行PHP、Java、Python、Nodejs应用的开发、编译、发布、调试

BAE地址: http://bce.baidu.com
    全部产品 bae
    添加部署


## 客户端

### tortoiseSVN 清除密码
settings / Saved Data / Authentication data / clear


新文件，右键 add
新文件，右键 commit
右键 update //与服务器同步,上传和下载

空白处 / 右键 / show log /


第一次使用时使用 checkout， 

之后每天都是 update 从服务器拉取
add(好像不像git，不用add,直接commit即可)
修改
commit  上传到服务器



### 图标集
TortoiseSVN / settings / Icons

1. 常规
    客户端文件与服务器端文件一致时。
1. 冲突
    客户端提交的文件与服务器端数据有冲突时
1. 删除
    当服务器端数据已经删除时，客户端没有被删除的文件
1. 增加
    文件已经添加到提交队列(add吧)    
1. 无版本控制
    还未添加到版本控制
1. 修改
    当客户端文件有修改，但未提交时
1. 只读
    文件属性为只读
1. 锁定
    当服务器端数据已锁定，客户端的显示状态
1. 忽略
    文件，右键，TortoiseSV , 添加到忽略列表
        单文件
        递归(recursive)    
        某一类型文件
    如何反悔呢？


### 版本回退

空白处右键 / TortoiseSVN / 更新至版本update to revision / 最新版本Head revision  显示日志show log, 单击要恢复到的版本]而不是)
    最新版本    根据日志回退
    版本        根据版本号回退



## 版本冲突

后提交的人提交会提交不上去，提示有冲突

解决方法
    1. 合理分配项目开发时间
        如A上午开发，B下午开发
    1. 合理分配项目开发模块
    1. 解决SVN冲突
        1. 更新服务器端数据到本地, 提示失败，点击确定后，会弹出需要更新的对话框
            显示整合后的冲突文件
            index.php.mine
            index.rn 别人提交的index文件
            index.r(n+1) 我修改的index文件
    
        1. 删除index(整合后的文件)以外的上面的3个文件,对index.php冲突文件进行整合
        1. 重新 commit 即可


## svn客户端日志无法显示的解决
    svnserve.conf
        anon-access = none
        [/]
            * = 
就可以了







