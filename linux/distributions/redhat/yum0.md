## yum配置：

yum的配置文件分为两部分：main和repositoy

1. man部分定义了全局配置选项，整个yum配置文件应该只有一个main，位于 /etc/yum.conf 中；

1. repository 部分定义了每个源/服务器的具体配置，可以有一到多个。位于 /etc/yum.repo.d 目录下的各个文件中


## /etc/yum.conf

[main]

cachedir=/var/cache/yum/$basearch/$releasever
//yum 缓存的目录,yum在此存储下载的rpm包和数据库，默认设置为/var/cache/yum

keepcache=0
//安装完成后是否保留软件包，0为不保留（默认为0），1为保留

debuglevel=2
//Debug 信息输出登机，范围为0-10，缺省为2

logfile=/var/log/yum.log
//yum 日志文件位置。用户可以到/var/log/yum.log 文件中去查询过去所做的更新

exactarch=1
//有1和0两个选项，设置为1，则yum只会安装和系统架构匹配的软件包，例如，yum不会将i686的软件包安装在适合i386的系统中。默认为1。

obsoletes=1
//这是一个update的参数，具体请阅读yum(8),简单的说就是相当于upgrade，允许更新陈旧的PRM包。

gpgcheck=1
//gpgcheck是gpg验证是否开启的选项，1是开启，0是不开启，一般情况可以关掉.

plugins=0
//是否启用插件，默认1为允许，0表示不允许。我们一般会用yum-fastestmirror这个插件。

installonly_limit=5
//允许保留多少个内核，默认为5

bugtracker_url=http://bugs.centos.org/set_project.php?project_id=16&ref=http://bugs.centos.org/bug_report_page.php?category=yum

distroverpkg=centos-release
//指定一个软件包，yum会根据这个包判断你的发型版本，默认是centos-release，也可以是安装的任何针对自己发行版的rpm包。


除了上面之外，还有一些可以添加的选项，如：  


    `exclude=selinux*
//排除某些软件在升级名单之外，可以用通配符，列表中各个项目要用空格隔开，这个对于安装了诸如美化包，中文补丁的朋友特别有用。

gpgcheck=1
//有1和0两个选择，分别代表是否进行gpg（GNU Private Guard）校验，以确定rpm包的来源是有效的和安全的。这个选项如果设置在[main]部分，则对每个repository都有效。默认值为0。
