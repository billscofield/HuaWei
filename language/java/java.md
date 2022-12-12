## 开发环境

1. 编辑器
    
    vscode

    插件:
        Extension Pack for Java
        
        可以看到是安装了6个其他的插件
        
        1. Language Support for Java(TM) by Red Hat
        2. Debugger for Java
        3. Java Test Runner
        4. Maven for Java
        5. Project Manager for Java
        6. Visual Studio IntelliCode


[链接](https://www.zhihu.com/question/278838022/answer/1709832515)

## Java 版本

1. JavaSE: Java标准版

2. JavaEE: Java企业版

3. JAVAME: Java微型版

    7, 8 ,11 是长期支持版本

javase 历史版本， java archive


## tomcat

tomcat.apache.org

主流版本 8， 9， 10

这个都可以

检查 tomcat
    /opt/java/tomcat/bin/version.sh

启动、关闭 tomcat (tomcat会自动调用 jdk)
    /opt/java/tomcat/bin/startup.sh
    /opt/java/tomcat/bin/shutdown.sh

查看是否启动成功
    ss -tlnpu | grep java           // 而不是 tomcat

    8080 端口
    8005 端口

    ps -ef | grep java

    浏览器访问

### 目录结构

bin                 管理 tomcat 的脚本
conf                配置文件目录
logs                所有日志目录
webapps/ROOT        网站根目录
work                tomcat 运行代码的编译临时目录

1. bin
    startup.sh
    shutdown.sh
    catalina.sh     tomcat 的核心脚本，startup.sh/shutdown.sh 都是调用的这个

2. conf
    server.xml
    web.xml
    logging.properties
    tomcat-users.xml            tomcat 管理端配置文件（线上环境中关闭）

3. logs
    catalina.out                    tomcat 的主日志，开启，关闭，状态, 该文件会持续增大, 手动或者 logrotate 切割
        主要查找  error failed exception(异常)
    catalina.日期.log               与上面类似，切割日志，Tomcat 每天对 catalina.out 进行切割
    localhost_access_log.日期.txt   tomcat 访问日志

    host-manager.日期.log
    localhost.日期.log
    manager.日期.log

4. webapps

### tomcat 基本使用

1. tomcat 部署 app
    1. 方式 1: war 包(压缩包)放到站点目录下，tomcat 会自动解压
        开启 tomcat 然后再放进去, 比如 abc.war 会解压为 abc
        放入: 10.0.0.1:8080/abc/xxx.jsp

    2. 方式 2：jar 包 java -jar xxx.jar
        相当于集成了 tomcat


2. systemctl 

    /usr/lib/systemd/system/tomcat.service

    [Unit]                                  // 注释说明，服务的依赖
    Description=Tomcat Server
    After=network.target                    // 在这些服务运行之后才能被执行, 依赖
    Wants=network.target                    // 依赖

    [Service]
    Type=notify                             // 服务类型
    EnvironmentFile=/etc/sysconfig/tomcat   // 指定环境变量文件, 把那几个 export 写在这个文件, 去掉 export
    ExecStart=/opt/java/jdk/bin/startup.sh
    ExecStop=/opt/java/jdk/bin/shutdown.sh
    ExecReload=/opt/java/jdk/bin/shutdown.sh && sleep 2 && /opt/java/jdk/bin/startup.sh
    KillMode=process


    [Install]                               // 指定运行级别
    WantedBy=multi-user.target

### tomcat 的三个按钮

By default the Manager is only accessible from a browser running on the same
machine as Tomcat. If you wish to modify this restriction, you'll need to edit
the Manager's **context.xml** file.



conf/tomcat-users.xml
```
<role rolename="manager-gui"/>
<role rolename="admin-gui"/>
<user username="tomcat" password="tomcat" roles="manager-gui,admin-ui"/>
```

curl -utomcat:tomcat http://127.0.0.1:8080/manager/status

修改 ./webapps/manager/META-INF/context.xml 中的 127 为 \d+


## 网站架构演变

尽量把用户的请求向前推(访问缓存)

                                                                                         +-----> 数据库缓存redis ---> DB数据库
                                                                                         |
                                                                    动态资源             |
                                    +-----------------------+   +--> LNP/T WEB  ---------+-----> 存储 ---> backup
                                    |           LB master   |   |
                                    |                       |   |
user ---> 浏览器缓存 ---> CDN --->  | Cache                 |---+-->  LNP/T WEB
                                    |                       |   |
                                    |           LB slave    |   |
                                    +-----------------------+   +--> LNP/T WEB
                                                                    静态资源

---
                                                                                                                      +-----> 数据库缓存redis ---> DB数据库主从
                                                                                                                      |
                                                                    前端                            后端              |
                                    +-----------------------+   +--> LNP/T WEB  --> API接口--->     LNP/T WEB---------+-----> 分布式存储ceph/GFS ---> backup
                                    |           LB master   |   |
                                    |                       |   |
user ---> 浏览器缓存 ---> CDN --->  | Cache                 |---+-->  LNP/T WEB
                                    |                       |   |
                                    |           LB slave    |   |
                                    +-----------------------+   +--> LNP/T WEB
                                                                    静态资源
                                   /|\
                                    | 
                            64K问题 2^16 个端口





### JDK

sun 公司破产的时候把 jdk 的大部分代码开源了，就是 openjdk
任何人都可以拿来用

openjdk 和 jdk 的核心代码几乎一模一样


### 卸载 openjdk


如果系统没有openjdk环境则可以跳过这一步。

dpkg -s | less
/jdk

1. 卸载openjdk

    sudo apt-get remove openjdk-8-jdk

1. 卸载jre

    sudo apt-get remove openjdk-8-jre-headless


### JDK 的下载、安装和验证

JDK: Java Development Kit

https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

tar -zxvf /usr/local/jdk-8u181-linux-x64.tar.gz

vi /etc/zsh/zprofile
    ```
    export JAVA_HOME=/usr/local/jdk-8u181-linux-x64
    export PATH=$PATH:$JAVA_HOME/bin
    export CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib
    export JRE_HOME=$JAVA_HOME/jre
    export TOMCAT_HOME=/opt/java/tomcat

    ```

source /etc/zsh/zprofile

java -version               // one dash


jvm 是包含在 jdk 中的

JDK 包含 JRE + java 开发工具(java,javac,javadoc,javap等)

JRE Java Runtime Environment

    JRE = JVM + Java的核心类库

    如果要运行一个 java 程序,只需安装 jre 即可

---





## 

vscode 运行时的 bug:

F1 ->Clean the java language server workspace


## java 框架

1. SpringBoot

2. SpringCloud

3. Dubbo



## nginx + tomcat

静态资源由 Nginx 处理，动态资源由 Tomcat 处理

tomcat: java 程序代码容器
    可以运行 Java 代码的环境
    类似的还有
    Resin
    Jboss
    Weblogic(一般配合 Oracle)


## jvm jre jdk

Java 1次编译，处处运行

Java 虚拟机: jvm

jre: java runtime environment, 安装了这个就有了 jvm 和相关库文件

jdk: Java Development Kit 包含了 jre 和一些额外的工具



## 特点

main 方法
    public static void main(String[] args)

区分大小写

一个源文件中最多只能有一个 public 类, 其他类的个数不限.
也可以将 main 方法用在非public类中,然后指定运行非 public 类, 这样入口方法就是非 public 的main方法

```hello.java
public class Hello {
    public static void main(String[] args){
            System.out.println("hello world");
                
    }
}

class Dog{
    public static void main(String[] args){
            System.out.println("hello dog");
                
    }
    
}

javac hello.java
java Hello
java Dog
```

如果源文件包含一个 public 类,则文件名必须按该类名命名

每一个类都会对应一个 class 文件


\r 仅仅是 carrage return

```
System.out.println("hello\rworld\n");

```

## 注释

```
1. 多行注释

/*
*/


2. 单行注释

//

3. 文档注释

```
