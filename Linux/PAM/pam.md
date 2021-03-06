
认证库: 文本文件, MySQL, NIS, LDAP等

SUN 公司于1995年开发的一种与认证相关的通用框架机制

PAM 是关于如何为服务验证用户的 API， 通过提供一些动态链接库和一套统一的API, 将系统提供的服务和该服务的认证方式分开

一种认证框架，本身不做认证


服务的配置文件路径
    /etc/pam.d/     和应用程序同名

    一般没有 /etc/pam.conf 了
    NOTE: Most program use a file under the /etc/pam.d/ directory to setup their
    PAM service modules. This file is used only if that directory does not exist.


模块路径
    /lib/x86_64-linux-gnu/security/*.so


模块的配置文件路径
    /etc/security/





### pam 认证过程

1. 执行 /usr/bin/passwd

1. passwd 开始呼叫 PAM 模块, PAM 模块会搜索 passwd 程序的 PAM 相关设定文件, 这个设定文件一般是在 /etc/pam.d/ 里边的与成语同名的文件, 即 PAM 会搜索 /etc/pam.d/passwd 这个配置文件

1. 根据 /etc/pam.d/passwd, 取用 PAM 所提供的的相关模块来进行验证

1. 将验证结果回传给 passwd 这个程序, 而 passwd 这个程序会根据 PAM 回传的结果决定下一个动作


### 格式

修改 pam 配置文件将马上生效

建议: 编辑 pam 配置文件时，保持至少一个root会话，以防止 root 身份验证错误

#### pam.conf 格式

每行对应一个登记项, 每一行又分为五列

man 5 pam.d (/etc/pam.conf 中的写法)

service    type    control    module-path    module-arguments 

#### pam.d 格式

type control module-path module-arguments

#### 说明

service : 服务名

type : 模块类型

    auth        : 账号认证，密码验证
    account     : 账号非认证类的功能，如有效期,可以从哪里登录等各种与账号相关的属性
    session     : 一些附加操作
    password    : 用户修改密码时密码复杂度检查机制等功能
    -开头的     : 因缺失而不能加载的模块，不记录到系统日志
                如 -session

control
    PAM库如何处理与该服务相关的PAM模块成功或失败的情况
    比如两个 auth, 是 and 还是 or

    两种机制
        复杂
            使用一个或多个 "status=action"
            status: 检查结果的返回值
            action: 采取的行为 ok, done, die, bad, ignore, reset
                ok      : 模块通过，继续检查
                done    : 模块通过，返回最后结果给应用
                bad     : 结果失败，继续检查
                die     : 记过失败，立即返回
                ignore  : 忽略结果，不影响最后结果
                reset   : 忽略已经得到的结果
            
        简单
            required : 一票否决,不是一票通过; 这一个必须满足, 否决后还会向下执行
                #auth   required    pam_succeed_if.so user != root quiet_success    (/etc/pam.d/gdm-password)
            
            requisite: 一票否决，否决后立即返回结果给程序
            
            sufficient: 一票通过
            
            optional: 可选的，成功与否不会起到什么作用，其返回值一般被忽略
            
            include: 调用其他的配置文件中定义的配置信息
                auth        include     su  (/etc/pam.d/su-l)


module-path
    /lib/x86_64-linux-gnu/security

arguments
    

#### 模块的帮助

man 模块名

#### 常用模块

pam_shells.so
    login   本地登录服务??? telnet 不是远程吗
    ssh     ssh登录服务


    pam_shells is a PAM module that only allows access to the system
    if the user's shell is listed in /etc/shells.

    It also checks if /etc/shells is a plain file and not world
    writable.


pam_securetty.so

    pam_securetty is a PAM module that allows root logins only if the
    user is logging in on a "secure" tty, as defined by the listing
    in /etc/securetty. pam_securetty also checks to make sure that
    /etc/securetty is a plain file and not world writable. It will
    also allow root logins on the tty specified with console= switch
    on the kernel command line and on ttys from the
    /sys/class/tty/console/active.


pam_nologin.so

    pam_nologin is a PAM module that prevents users from logging into
    the system when /var/run/nologin or /etc/nologin exists. The
    contents of the file are displayed to the user. The pam_nologin
    module has no effect on the root user's ability to log in.


pam_limits.so

    PAM module to limit resources

    The pam_limits PAM module sets limits on the system resources
    that can be obtained in a user-session. Users of uid=0 are
    affected by this limits, too.

    By default limits are taken from the /etc/security/limits.conf
    config file. Then individual *.conf files from the
    /etc/security/limits.d/ directory are read. The files are parsed
    one after another in the order of "C" locale. The effect of the
    individual files is the same as if all the files were
    concatenated together in the order of parsing. If a config file
    is explicitly specified with a module option then the files in
    the above directory are not parsed.

    The module must not be called by a multithreaded application.

    If Linux PAM is compiled with audit support the module will
    report when it denies access based on limit of maximum number of
    concurrent login sessions.


    Linux 有一条这样的命令: ulimit
        help ulimit
            -a        all current limits are reported
            -n        the maximum number of open file descriptors




### 第一栏 The service

service表示使用PAM的应用程序，比如login、passwd、rlogin等。这一栏中的OTHER表示所有没在该文件中显式列出的应用。
也就是说，如果所有程序具有相同的需求，整个配置文件只需要一行即可，并且该行的第一栏为OTHER。
本例中，因为所有应用程序使用相同的会话模块,所以实际上可以用单行，即

OTHER   auth        required     pam_unix_auth.so"


### 第二栏

module_type指明程序所用PAM底层模块的类型：
    1. auth表示鉴别类模块；
    1. account表示帐户类模块；
    1. session表示会话类模块；
    1. password表示口令类模块。注意，每行只能指定一种类型模块，如果程序需要多种模块的话，可在多行中分别规定。


### 第三栏

man 5 pam.d

control_flag规定如何处理模块的成功和失败情况。

单个应用程序可以调用多种底层模块，这通常称为"堆叠"，对应于某程序的按照配置文件中出现顺序执行的所有模块成为"堆"，堆中的各模块的地位与出错时的处理由control_flag栏的取值决定，它的六种可能的取值分别为required、Requisite、sufficient或optional,include,substack，现介绍如下：

    1. required--它表示该模块的成功是用户通过鉴别的必要条件，换句话说，只有当对应于应用程序的所有带required标记的模块全部成功后，该程序才能通过鉴别。同时，如果任何带required标记的模块出现了错误，PAM并不立刻将错误消息返回给应用程序，而是在所有模块都调用完毕后才将错误消息返回调用它的程序。

        一票否决

    1. requisite--它与required相仿，只有带此标记的模块返回成功后，用户才能通过鉴别，不同之处在于其一旦失败就不再执行堆中后面的其它模块，并且鉴别过程到此结束。

    1. optional--它表示即便该模块失败，用户仍能通过鉴别。在PAM体系中，带有该标记的模块失败后将继续处理下一模块。
        可选的
        忽略

    1. sufficient--它表示该模块取得成功是用户通过鉴别的充分条件,也就是说只要标记为sufficient的模块一旦成功，那么PAM便立即向应用程序返回成功而不必尝试任何其他模块。
        当标记为sufficient的模块失败时，sufficient模块当做optional对待, 即忽略。
        一票通过

    1. include
        include all lines of given type from the configuration file specified as an argument to this control.
        通用的

    1. substack
        include all lines of given type from the configuration file specified as an argument to this control. This differs from include in that
        evaluation of the done and die actions in a substack does not cause skipping the rest of the complete module stack, but only of the substack.
        Jumps in a substack also can not make evaluation jump out of it, and the whole substack is counted as one module when the jump is done in a
        parent stack. The reset action will reset the state of a module stack to the state it was in as of beginning of the substack evaluation.

        


    他们的顺序很重要


### 第四栏,module_path指出PAM模块的位置。


### 第五栏

options用于向特定模块传递相关的选项，然后由模块分析解释这些任选项。比如使用此栏打开模块调试，或向某模块传递诸如超时值之类的参数等。另外，它还用于支持下文所述的口令映射技术。

如果任一栏出现错误,或某模块没有找到,那么所在行被忽略并将其作为严重错误进行记录。





pam_shells.so （auth，account） 如果用户想登录系统，那么它的shell必须是在/etc/shells文件中


pam文件是立即生效，编辑pam规则时，要开两个会话，保持一个root绘画，以防止root身份验证错误


### 帮助

man 模块名
man pam_shells
