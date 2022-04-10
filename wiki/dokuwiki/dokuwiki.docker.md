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

用户好像是要改成 nobody


添加了3级标题后会有目录

## logo

/var/www/html/dokuwiki/lib/tpl/dokuwiki/images/logo.png

64x64 像素

tpl :template


## 插件

1. indexmenu

    disable the 'defer_js'-setting
    /var/www/html/dokuwiki/conf/dokuwiki.php
        $conf['defer_js'] = 0;                   // Defer javascript to be executed after the page's HTML has been parsed. Setting will be removed in the next release.



## namespace

You don't need to create namespaces separately; simply create pages with colons
in the pagename. The token after the last colon will be the name of the page
itself, while all other tokens are namespaces. All namespaces used in your
pagename that don't exist already will be created by DokuWiki automatically.


## [ACLs](https://www.dokuwiki.org/acl)


two groups that are somewhat special:

@ALL Everyone, even users not logged in, is a member of the ALL group. You can
use this group to restrict access for all users (as a default setting) and then
relax the permissions for some selected users.

@user All self-registered users are by default automatically a member of the
group 'user'. Use this to give permissions to 'logged-in' users. The name of
this group is configured through the defaultgroup option. Unlike the virtual
“ALL” group, the “user” group is a real group to which all users are added
automatically when using the plain auth backend. If you use a different backend
you need to use the groups provided by this backend.  Groups are represented
internally and in the ACL manager by a prepended @ character to the group name.


Access restrictions are saved in a file called conf/acl.auth.php, which should
be writable by the webserver if you want to use the ACL admin interface
described above. It is not recommended to edit this file manually. Use the
admin interface instead.




## [security](https://www.dokuwiki.org/security#web_access_security)

### apache

The distribution tarball contains a set of .htaccess files which usually tell
the Apache web server to deny access to certain directories.

The following directories should not be accessible from the web:

    1. data
    2. conf
    3. bin
    4. inc (isn't dangerous when accessible, though)
    5. vendor (leaks info about your environment)

To check if you need to adjust the access permissions try to access 

http://yourserver.com/data/pages/wiki/dokuwiki.txt.

You should not get access to that file this way. The Admin Interface will also
check this for you and display a warning, if something is wrong.

Please note that this has nothing to do with file permissions. Web access is a
configuration specific to your webserver.






