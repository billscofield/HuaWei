# dokuwiki

## 安装

1. docker 镜像

    使用已经打包好的镜像 dockerhub.qingcloud.com/liujiao/nginxphp749:0.02

        ` docker pull dockerhub.qingcloud.com/liujiao/nginxphp749:0.02
        
        ` docker run -itd --name dokuwiki -p80:80 dockerhub.qingcloud.com/liujiao/nginxphp749:0.02


2. dokuwiki

[dokuwiki 下载](https://download.dokuwiki.org/)

    只保留中文即可


## Problems

The datadir ('pages') at ./data/pages is not found, isn't accessible or
writable. You should check your config and permission settings. Or maybe you
want to run the installer?

[link](https://forum.dokuwiki.org/d/9893-the-datadir-pages-at-data-pages-is-not-found/4)
```
chmod 777 -R data
chmod 777 -R lib
chmod 777 -R conf
```
