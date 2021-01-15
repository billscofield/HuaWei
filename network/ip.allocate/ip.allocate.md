https://blog.kiman.me/apnic-china-ip/

## 关于APNIC

全球IP地址块被IANA(Internet Assigned Numbers Authority)分配给全球三大地区性IP地址分配机构，它们分别是：

ARIN (American Registry for Internet Numbers)

    负责北美、南美、加勒比以及非洲撒哈啦部分的IP地址分配。同时还要给全球NSP(Network Service Providers)分配地址。

RIPE (Reseaux IP Europeens)

    负责欧洲、中东、北非、西亚部分地区(前苏联)
APNIC (Asia Pacific Network Information Center)

    负责亚洲、太平洋地区

## APNIC IP地址分配信息总表的获取

APNIC提供了每日更新的亚太地区IPv4，IPv6，AS号分配的信息表：http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest

该文件的格式与具体内容参见：ftp://ftp.apnic.net/pub/apnic/stats/apnic/README.TXT

通过该文件我们能够得到APNIC辖下IPv4地址空间的分配情况。

## 脚本获取IP地址

```
#!/bin/sh
wget -c http://ftp.apnic.net/stats/apnic/delegated-apnic-latest
cat delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > ip.txt
```




## 附录


http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest 部分内容

```
######################################################################
#
#   CONDITIONS OF USE
# ____________________________________________________________________
# 
# 
# The files are freely available for download and use on the condition 
# that APNIC will not be held responsible for any loss or damage 
# arising from the use of the information contained in these reports.
# 
# APNIC endeavours to the best of its ability to ensure the accuracy 
# of these reports; however, APNIC makes no guarantee in this regard.
# 
# In particular, it should be noted that these reports seek to 
# indicate where resources were first allocated or assigned. It is not
# intended that these reports be considered as an authoritative 
# statement of the location in which any specific resource may 
# currently be in use.
# 
# For more information see: 
#
#       http://www.apnic.net/db/rir-stats-format.html
# or
#   ftp://ftp.apnic.net/pub/apnic/stats/apnic/README.TXT
#
######################################################################
#
2|apnic|20210114|67811|19830613|20210113|+1000
apnic|*|asn|*|10528|summary
apnic|*|ipv4|*|45910|summary
apnic|*|ipv6|*|11373|summary
apnic|JP|asn|173|1|20020801|allocated
apnic|NZ|asn|681|1|20020801|allocated
apnic|AU|asn|1221|1|20000131|allocated
apnic|JP|asn|1233|1|20020801|allocated
```


格式说明文件见统计目录下的 README.txt


