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

1. JavaEE: Java企业版

1. JAVAME: Java微型版

7, 8 ,11 是长期支持版本

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
    export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
    export JRE_HOME=$JAVA_HOME/jre

    ```

source /etc/zsh/zprofile

java -version


jvm 是包含在 jdk 中的

JDK 包含 JRE + java 开发工具(java,javac,javadoc,javap等)

JRE Java Runtime Environment

    JRE = JVM + Java的核心类库

    如果要运行一个 java 程序,只需安装 jre 即可



## 

vscode 运行时的 bug:

F1 ->Clean the java language server workspace
