

## JDK

### DK版本说明

1. Open JDK
　　这个不多说，免费的开源实现，以 GPL License 发布，很多 Linux 发行版中都会包含这个 Open JDK 。参与开发的大佬们有 Oracle、RedHat (已被 IBM 收购)、Azul System、IBM、Apple、SAP。

1. Oracle JDK
　　就是我们常说的 Java JDK，也是最常用的一个，是 Oracle 公司(收购了开发 Java 的 Sun 公司)对 Java SE 的实现。如果更详细分的话，可以分为 Oracle JDK 和 Oracle JRE。比如你想玩 Minecraft 这样需要 Java 的游戏，那只需要从 java.com 下载一个 JRE 就够了。如果你想基于 Java 做开发，那就需要从 Oracle Technology Network(OTN)网站上下载 JDK 了。
　　假设 JDK 8u192 是 2018 年的最后一个 Update，你下载并且安装了，那可以继续免费使用下去，没有任何问题。但是从 2019 年 1 月开始，如果你还想获取 JDK 的 Update，对不起，你需要付费订阅。这个订阅服务的价格是这样的：对于 PC，每用户每月是 2.5 美元，对于服务器/云部署，每个 processor 每月是 25 美元，当然，数量多的话可以打折。

1. 其他公司提供的 JDK
　　有实力的大公司，都有可能开发自己的 JDK ，比如 IBM ，肯定要为自家的操作系统 AIX，还有 z/OS 开发 SDK。HP、SAP 也有自己的 JDK，可以为自己的硬件和软件做定制。
　　Oracle Java SE Advanced、Java SE Advanced Desktop、Java SE Suite 这名字很长，也有点费解，简单来说，这是个收费的服务， 是 Oracle 为企业级用户提供的高级工具和功能，可以监控、部署、管理企业级的 Java 程序，与此同时，你还可以下载那些老版本的 JDK 及其 Update。换句话说，如果你购买了这个服务，自然就不用担心什么 JDK Update 收费的问题。但是问题在于，到底有多少公司再使用这个服务? 如果你的公司在使用，欢迎告知。所以我猜测 Oracle 耍了一点小手段， 以后不要这个收费的服务了，把这些高级的功能加上 JDK Update 打包，统一成一个新的服务，就是之前说的订阅服务。

注意，我这里说的都是公司，都是商业用途，如果只是个人学习 Java 的话，没什么影响！



### Oracle JDK安装部署

1. 基于tar包的方式安装，需要对软件配置我们jdk自定义安装对路径, 如果基于 rpm 方式安装一般情况下并不需要！

1. 卸载平台中已经存在的JDK版本

1. 将下载的jdk版本进行解压安装并配置环境变量（如果你下载的是rpm包的oracle jdk的话就无需配置环境变量啦！）


## gerrit
