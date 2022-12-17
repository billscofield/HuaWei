reprise / rɪˈpriːz /software
    （尤指乐曲的）重复部分，再现部；重复，重演
    是一家公司
    Reprise License Server Administration

    Reprise License Manager(RLM)是美国Reprise公司的一套许可证管理软件。
    RLM: 重复许可证管理器




migenius realityserver


https://docs.aws.amazon.com/zh_cn/dcv/latest/adminguide/setting-up-production.html#prep-linux

## 在 Linux 上安装 RLM 服务器

1. 从 Reprise Software 网站下载 RLM 许可证管理包

    https://www.reprisesoftware.com/admin/rlm-admin-download.php?&euagree=yes

2. 创建用户组和 rlm 用户。这可以是任何有效的用户或服务账户。我们强烈建议不要使
   用根账户获取此值。

   groupadd -r rlm
   useradd -r -g rlm -d "/opt/nice/rlm" -s /sbin/nologin -c "RLM License Server" rlm
   
    -r, --system
        Create a system account.
        Note that useradd will not create a home directory for such a user

3. 创建 RLM 服务器所需的 /opt/nice/rlm 和 /opt/nice/rlm/license 目录。

    mkdir -p /opt/nice/rlm/license

4. 将 RLM 许可证管理包的内容提取到 /opt/nice/rlm/，并确保文件由 rlm 用户拥有。


    $ tar xvf x64_l1.admin.tar.gz -C /opt/nice/rlm/ --strip-components 1

    $ chown -R rlm:rlm /opt/nice/rlm

5. 获取 RLM 服务器的主机 ID

    ./rlmutil rlmhostid ether


## license.lic文件

license.lic 文件包含以下信息：

1. RLM 服务器的主机名。

2. 您在购买许可证时提供的 RLM 服务器的主机 ID。

3. RLM 服务器的 TCP 端口号。默认为 5053。

4. ISV(Independent Software Vendor) 端口号。这是 RLM 服务器监听 NICE DCV 许可证
   请求的可选端口。如果未指定，RLM 将在启动时随机选择一个端口。

5. 许可证涵盖的 NICE DCV 产品，以及每种产品的以下详细信息：

    许可证涵盖的主要版本（例如，2017 年 NICE DCV 产品）。2017
    到期日期。 Permanent表示许可证未过期。
    最大并发会话数（例如，10 表示服务器上的 10 个并发会话）。
    许可证校验和。
    许可证签名。


    ```
    HOST RLM_server_hostname RLM_server_host_id RLM_server_port
    ISV nice port=port_number
    LICENSE product_1 major_version expiration_date concurrent_sessions share=hi _ck=checksum sig="signature"
    LICENSE product_2 major_version expiration_date concurrent_sessions share=hi _ck=checksum sig="signature"
    ```

    以下代码块显示了已省略 ISV 端口的 license.lic 文件的示例。许可证文件包括两
    个 NICE 产品（DCV 和 dcv-gl）的许可证。

    ```
    HOST My-RLM-server abcdef123456 5053
    ISV nice
    LICENSE nice dcv 2017 permanent 10 share=hi _ck=456789098a sig="abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890ab"
    LICENSE nice dcv-gl 2017 permanent 10 share=hi _ck=123454323x sig="1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz12"
    ```


    RLM_server_host_id 是您在购买许可证时提供的主机 ID。您无法编辑 RLM_server_host_id
    通过添加将 ISV 端口号添加到文件中以开头的ISV行中port=port_number


## 在 Linux 上配置 RLM 服务器

1. 将编辑后的 license.lic 文件复制到 /opt/nice/rlm/license/。

2. 从 NICE DCV 服务器复制该/usr/share/dcv/license/nice.set文件并将其放在 RLM 服务器/opt/nice/rlm上。

3. 创建 RLM 服务器服务，并确保该服务在启动时自动启动。

    在 dcv-rlm 文件夹中创建名为 /opt/nice/rlm/ 的文件：

        touch /opt/nice/rlm/dcv-rlm

    ```
    #! /bin/sh
    # chkconfig: 35 99 01
    # description: The Reprise License Manager daemon.
    # processname: dcv-rlm

    ### BEGIN INIT INFO
    # Provides: dcv-rlm
    # Required-Start: $local_fs $remote_fs $syslog
    # Required-Stop: $local_fs $remote_fs $syslog
    # Default-Start: 3 4 5
    # Default-Stop: 0 1 2 6
    # Short-Description: The Reprise License Manager daemon.
    # Description: A service that runs the Reprise License Manager daemon.
    ### END INIT INFO

    # user used to run the daemon
    RLM_USER="rlm"

    # root of rlm installation
    RLM_ROOT="/opt/nice/rlm"

    # license directory (license files should have .lic extension)
    RLM_LICENSE_DIR="/opt/nice/rlm/license"

    # log file
    RLM_LOG_FILE="/var/log/rlm.log"

    _getpid() {
        pidof -o $$ -o $PPID -o %PPID -x "$1"
    }

    start() {
        echo -n "Starting rlm: "
        touch ${RLM_LOG_FILE}
        chown "${RLM_USER}" ${RLM_LOG_FILE}
        su -p -s /bin/sh "${RLM_USER}" -c "${RLM_ROOT}/rlm -c ${RLM_LICENSE_DIR} \
            -nows -dlog +${RLM_LOG_FILE} &"
        if [ $? -ne 0 ]; then
            echo "FAILED"
            return 1
        fi
        echo "OK"
    }

    stop() {
        echo -n "Stopping rlm: "
        pid=`_getpid ${RLM_ROOT}/rlm`
        if [ -n "$pid" ]; then
            kill $pid >/dev/null 2>&1
            sleep 3
            if [ -d "/proc/$pid" ] ; then
                echo "FAILED"
                return 1
            fi
        fi
        echo "OK"
    }

    status() {
        pid=`_getpid ${RLM_ROOT}/rlm`
        if [ -z "$pid" ]; then
            echo "rlm is stopped"
            return 3
        fi
        echo "rlm (pid $pid) is running..."
        return 0
    }

    restart() {
        stop
        start
    }

    case "$1" in
        start)
            start
            ;;
        stop)
            stop
            ;;
        status)
            status
            ;;
        restart)
            restart
            ;;
        *)
            echo $"Usage: $0 {start|stop|status|restart}"
            exit 1
    esac

    exit $?

    # ex:ts=4:et:
    ```

    将脚本编写为可执行文件，将其复制到 /etc/init.d/，然后将其添加到 chkconfig 实用程序：

        chmod +x /opt/nice/rlm/dcv-rlm 
        cp -a /opt/nice/rlm/dcv-rlm /etc/init.d/
        chkconfig --add dcv-rlm

4. 启动 RLM 服务器：

    $ service dcv-rlm start

5. 确保 RLM 服务器正在按预期运行和工作。使用您常用的文本编辑器打开 var/log/rlm.log，并确认显示以下行：

### 配置 NICE DCV 服务器

将您的 NICE DCV 服务器配置为使用 RLM 服务器。为此，必须在 NICE DCV 服务器上license-file配置配置参数。

配置 Linux 服务器上的 license-file 配置参数

    1. 导航到 /etc/dcv/，并使用您常用的文本编辑器打开 dcv.conf。

    2. 在 [license] 部分中找到 license-file 参数。然后，将现有路径替换为 RLM 服
       务器的端口和主机名，5053@RLM_server_hostname格式。

        如果 license-file 部分中没有 [license] 参数，则使用以下格式手动添加此参数：

            license-file = "5053@RLM_server_hostname"



## windows server 问题

1. 在 Windows 服务器上更改许可证路径

    https://docs.aws.amazon.com/zh_cn/dcv/latest/adminguide/setting-up-evaluation.html

    更新 Windows 服务器上的 license-file 配置参数

    打开 Windows 注册表编辑器。

    导航到 HKEY_USERS/S-1-5-18/Software/GSettings/com/nicesoftware/dcv/license/ 注册表项，并选择 license-file 参数。

    如果该注册表项中没有 license-file 参数，请创建一个：

    在左侧面板中打开 license 注册表项的上下文（右键单击）菜单，然后依次选择新建和字符串值。

    对于名称，输入 license-file 并按 Enter。

    打开 license-file 参数。对于值数据，输入 license.lic 文件的完整路径。 
        如: 50009@10.0.0.2

    选择确定，并关闭 Windows 注册表编辑器。


2. 手动创建验证方式:

    https://docs.aws.amazon.com/zh_cn/dcv/latest/adminguide/security-authentication.html#set-authentication-windows

    HKEY_USERS/S-1-5-18/Software/GSettings/com/nicesoftware/dcv/security/ 注册表项，并选择 authentication

    如果注册表项中没有authentication参数，请创建一个：

    在导航窗格中，打开身份验证密钥的上下文 (右键单击) 菜单。然后，选择 “新建，字符串值”。

    对于名称，输入 authentication 并按 Enter。

    打开 authentication 参数。对于数值数据，输入 system 或 none。

    选择确定，并关闭 Windows 注册表编辑器。



