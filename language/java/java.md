### Java 版本

1. JavaSE: Java标准版

1. JavaEE: Java企业版

1. JAVAME: Java微型版


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
