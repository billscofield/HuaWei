
## 初识Nginx
优点
    1. 高并发，高性能
    1. 可扩展性好
    1. 高可靠性
    1. 热部署
        1. 不停止服务的情况下进行升级
    1. BSD许可证

组成
    1. Nginx 二进制可执行文件
        1. 由各模块源码编译出的一个文件
        1. 相当于一辆汽车
    1. Nginx.conf 配置文件
        1. 控制 Nginx 的行为
        1. 相当于驾驶员,各种功能由驾驶员决定开启与否
    1. access.log 访问日志
        1. 记录每一条 http 请求信息
        1. 相当于 GPS 轨迹
    1. error.log 错误日志
        1. 定位问题
        1. 相当于黑匣子

版本发布情况(mainline)
    feature功能
    bugfix bug修复
    change 重构

    1.偶数 mainline version
    1.奇数 stable version
    
版本选择
    开源版：nginx.org
    商业版：nginx.com(Nginx plus)
    阿里巴巴的Tengine
        没有办法和Nginx的官方版本同步升级
    OpenResty
        开源版 openresty.org
        商业版 openresty.com

安装
    1. apt
    1. 编译安装(推荐)
        下载
        目录介绍
            auto目录
                cc 编译
                lib
                os
            conf 示例文件
            contrib/vim/  vim语法着色文件支持
                cp -r contrib/vim/* ~/.vim/
            html
                50x.html 500错误文件
                index.html 默认启动文件
            man manual
            src 源代码

        configure
            看看configure 支持那些参数
            ./configure --help
                1. 目录类大块
                1. 使用哪些模块，不使用哪些模块
                    --with-xxx
                        意味着不会默认编译进安装
                    --without-xxx
                        意味着会默认编译进安装
                    我安装的时候提示没有pcre模块: ./configure --prefix=/usr/local/nginx --with-pcre=pcre
                1. 中间文件会放在 objs 文件夹中
                    ngx_modules.c 决定哪些模块会编译进nginx

    1. 配置文件
        时间
            1. ms,milliseconds
            1. s,seconds
            1. m,minutes
            1. h,hours
            1. d,days
            1. w,weeks
            1. M,months,30days
            1. y,years,365days
        空间
            1.      bytes
            1. k/K  kilobytes
            1. m/M  megabytes
            1. g/G  gigabytes

卸载
    首先停止服务
    卸载 系统默认安装的,--purge包括配置文件
    apt-get --purge remove nginx

    apt autoremove  自动移除全部不使用的软件包

    dpkg --get-selections | grep nginx  列出与 nginx 相关的软件，并删除显示的软件
    apt --purge remove nginx-common

    再次执行 dpkg --get-selections | grep nginx
    which nginx  不再显示nginx




    1. 使用
        -h,-?           :this help
        -c filename     :set configuration file 使用指定的配置文件
        -g directives   :set global directives out of configuration file 指定配置指令
        -p prefix       :set prefix path(default:/usr/share/nginx/  系统自带的) 指定运行目录
                                        (default:/usr/local/nginx/  本人编译安装的)
        -t              :test configuration and exit    测试配置文件是否有语法错误
        -T              :test configuration, dump it and exit
        -v              :show version and exit
        -V              :show version and configure options then exit ./configure 的信息
        -s signal       :send singal to a master process: stop, quit, reopen, reload
            stop    :立刻停止服务
            quit    :优雅的停止服务
            reload  :重载配置文件(quit方式)
            reopen  :重新开始记录日志文件,换一个新的日志文件

    1. 热部署
        生成新的 ./configure make 后的 nginx/objs/nginx 
        cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.old
        mv new_nginx /usr/local/nginx/sbin/nginx -f

        nginx -USR2 正在运行的 Nginx master 进程号
            使用新的 Nginx 启动一个进程,老的平滑过渡到新的
            ps -aux | grep nginx   发现老的已经不在坚挺80端口
    
        nginx -WINCH 老的Nginx master 进程号
            让老的 Nginx 优雅的关闭所有进程
            work process 会全部关闭，但是老的master不会自动关闭，允许我们做版本回退
            
    1. 日志切割
            nginx reopen

## Nginx 架构基础


## 详解 HTTP 模块



## 反向代理与负载均衡
