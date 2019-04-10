去下载apache 发现有：

apache_2.2.14-win32-x86-no_ssl.msi
httpd-2.2.25-win32-x86-no_ssl.msi
httpd-2.2.25-win32-x86-openssl-0.9.8y.msi

apache xx.msi 和 htttpd xx.msi 格式的。

不知道用哪个了在网上找了半天，看到有这么说的：

早期的apache小组，现在已经成为一个拥有巨大力量的apache基金会。 

他们把起家的apache更名为httpd，也更符合其http?server的特性。而apache现在成为?apache基金会下几十种开源项目的标识。



apache和httpd是一个，到apache2后就叫httpd了。


另外，apache安装后也是有个httpd脚本来控制启动、关闭的。 

早期的apache是依靠那三个配置文件,论坛上现在有的介绍Apache的贴子都说有三个文件，
    1. httpd.conf 
    1. access.conf 
    1. srm.conf
    后来就都放到一个文件中了。



谁知道对不对呢，请看这个下载网址：
https://archive.apache.org/dist/httpd/binaries/win32/

发现2以上的版本也都有。。。

先就这么滴吧，不追究了。

另外，no_ss 表示无安全证书认证的也就是常用的http：而openssl表示带安全证书的也就是https的（比前者多了一个安全模块），不过大家常用的都是no_ss。


ServerRoot "/etc/apache2"   ServerRoot应该指向Apache的根目录


## 之前版本的一些配置，2.4.38中没有

### ServerTokens
ServerTokens Prod   显示“Server: Apache”, 而不包含任何的版本信息
ServerTokens Major  显示 “Server: Apache/2″
ServerTokens Minor  显示“Server: Apache/2.2″
ServerTokens Min    显示“Server: Apache/2.2.17″
ServerTokens OS     显示 “Server: Apache/2.2.17 (Unix)”
ServerTokens Full 显示 “Server: Apache/2.2.17 (Unix) PHP/5.3.5″ (如果你这指定任何的值，这个是默认的返回信息)

