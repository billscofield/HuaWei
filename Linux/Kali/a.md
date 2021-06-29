## whois 查询

ICP备案: Internet Content Provider 网络内容提供商

## ICP备案查询

公信网

## 收集 web 站点信息

1. CMS 指纹识别

    CMS(内容管理系统), 又称整站系统或文章系统。用于我那个站内容管理。用户只需要
    下载对应的CMS软件包，部署搭建，就可以直接利用CMS，简单方便。

    但是各种CMS都具有其独特的结构命名规则和特定的文件内容，因此可以利用这些内容
    来获取CMS站点的具体软件CMS和版本

    dedecms(织梦)

    在线工具CMS识别工具
        
        bugscaner.com
        
        云悉

    本地工具 whatweb
        
        大禹(github, java)


    针对CMS漏洞查询
        
        bus.shuimugan.com

    敏感目录结构和文件探测
        御剑(win)
        wwwscan
        dirb
        dirbuster(图形的)

    具体的cms workpress 测试
        wordpress
            whatweb
            wpscan(需要科学上网)

## 端口信息收集

netstat -anbo   (windows)

nmap -A -v -T4 <target>

masscan -p<端口> <target>

在线网站探测
    站长之家


攻击方法


防御措施
    1. 关闭不必要的端口
    1. 设置防火墙
    1. 加强安全意识，更换密码
    1. 经常更新软件，打补丁
