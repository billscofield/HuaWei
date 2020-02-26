每行对应一个登记项, 每一行又分为五列

man 5 pam.d

service    type    control    module-path    module-arguments_

### 第一栏 The service

service表示使用PAM的应用程序，比如login、passwd、rlogin等。这一栏中的OTHER表示所有没在该文件中显式列出的应用。也就是说，如果所有程序具有相同的需求，整个配置文件只需要一行即可，并且该行的第一栏为OTHER。本例中，因为所有应用程序使用相同的会话模块,所以实际上可以用单行，即

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
