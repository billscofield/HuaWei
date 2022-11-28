

awsthinkbox.com/deadline

## the Deadline Render Farm Management System

1. Database

    The Database stores the jobs, settings, and Worker configurations.

    The Clients access the Database via a direct socket connection over the
    network.

    It only needs to be installed on one machine (preferably a server) .

    Deadline uses MongoDB for the Database.

2. The Repository

    The Repository is the global file system component of the Deadline Render
    Farm Management System.

    It stores the plugins, scripts, logs, and any auxiliary files (like scene
    files) that are submitted with the jobs.

    The Clients access the Repository via a shared network path.

    It only needs to be installed on one machine (preferably a server).


    The Database and Repository together act as a global system where all of
    Deadline’s data is stored.

    The Clients then connect to this system to submit, render, and monitor jobs.

    It is important to note that while the Database and Repository work together,
    they are still separate components, and therefore can be installed on separate
    machines if desired.

3. The client

    负责渲染

Summary:

    Repository Directory 在 nas 中共享
        Slave 需要设置这个路径

        需要安装图形界面吗？如何远程管理渲染任务?




## Installation

DeadlineRepository-10.1.23.6-linux-x64-installer.run
DeadlineClient-10.1.23.6-linux-x64-installer.run


you can choose either a local path on the current machine, or the path to an
existing network share. Note that if you choose a local path, you must ensure
that path is shared on the network so that the Clients can access it.

    Repository Directory
        默认: Repository Directory [/opt/Thinkbox/DeadlineRepository10]

After choosing the Repository Installation directory, you will be asked to
choose the type of Database you want to use.

    we recommend you use MongoDB version 3.6.21 through 4.2.12. However, for
    security, you may need to use a later patch version for 4.2.12 if 4.2.12
    has any security issues that might affect you.

    make sure to download the .tgz or .zip file for your operating system

        MongoDB Directory

    Ensure you choose **locally attached storage to install the Database. Do NOT
    install the DB to a NAS/network drive. Do NOT share out the DB directory
    once installed.

    The MongoDB Hostname is the host name or the IP address of the machine that
    the MongoDB database will be running on.

    If desired, you can specify multiple entries and separate them with semicolons. 

        Note that if there are IP addresses listed that cannot be resolved, the
        Deadline Command application can run slower on Linux and Mac OS X
        Clients because it won’t exit until the connection attempt for those IP
        addresses time out.  repository 是服务端

    密码安全性
        Require client authentication via SSL/TLS 保持默认
        
        1. Certificate Directory: The installer will generate the required
           certificates for authentication and place them in this directory.
           This is where you will find a client certificate that can be used to
           connect to the Database.

        2. Certificate Password: You may associate a password with the client
           certificate. If you do, clients will require this password in order
           to connect to the Database. If you do not wish to set a password,
           leave this field blank.

        3. Use client certificate for DB user authentication: If enabled, the
           client certificate will also be used for Database user
           authentication. The installer will create a user on the Database
           corresponding to the client certificate that is generated.

        Once the certificates have been generated, the ‘Deadline10Client.pfx’
        file will need to be securely moved to client machines that are
        expected to connect to this Repository directly; it will be needed at
        connection time. In addition, the user(s) running the client processes
        will need to be granted Read access to the file (the installer creates
        the file with restrictive permissions).

    使用 mongodb 数据库
client 是客户端
portlink 可以不安装





## 

    yum install -y vim
    yum install -y epel-release
    yum install -y net-tools
    yum groupinstall "Development Tools" "Development Libraries"
    yum install -y tcpdump
    yum install -y nfs-utils
    yum install -y rsync
    yum install -y iftop
    yum install mesa-libGL mesa-libGLU  (workstation)
    setenforce 0
    systemctl stop firewalld


    RENDERNODES
    >>> yum install redhat-lsb


    修改网卡名称为 eth0
        1. 修改网卡配置文件中的 DEVICE 为: DEVICE="eth0"
        2. mv ifcfg-ens33 ifcfg-eth0
            ifcfg-ens33 文件最好删除掉，否则重启 network 服务时候会报错
        3. /etc/default/grub,  在 GRUB_CMDLINE_LINUX 这个参数后面加入 net.ifnames=0 biosdevname=0
        4. grub2-mkconfig -o /boot/grub2/grub.cfg
        5. reboot

1. nas:

    hostnamectl set-hostname nas001
    10.0.30.12
    yum install -y nfs-utils
    systemctl enable nfs-server

    ```/etc/exportfs
    /data *(rw,no_root_squash)
    ```


2. master(repository server)

    hostnamectl set-hostname master001
    10.0.30.10
    yum install -y autofs
    systemctl enable autofs

    ```/etc/auto.master
    /data /etc/auto.nas
    ```

    ```/etc/auto.nas
    nas -rw,timeout=360 10.0.30.12:/data
    ```

    chmod +x DeadlineRepository-10.1.23.6-linux-x64-installer.run
    ./DeadlineRepository-10.1.23.6-linux-x64-installer.run

        repository directory 更改为: /data/nas/Thinkbox/DeadlineRepository10

        MongoDB's open file descriptor limit (ulimit -n) will be set to the recommended value of 200000.
        You can change this limit in /etc/init.d/Deadline10db after the installation has finished

        MongoDB Directory [/opt/Thinkbox/DeadlineDatabase10]
        MongoDB Hostname [master001;10.0.30.10]
        MongoDB Port [27100]
        Certificate Directory [/opt/Thinkbox/DeadlineDatabase10/certs]
        Use client certificate for DB user authentication [Y/n]
            Secrets Management
                root
                ABCabc123*

        iptables -I INPUT 1 -p tcp --dport 27100 -j ACCEPT
        ip6tables -I INPUT 1 -p tcp --dport 27100 -j ACCEPT

    Desktop(Mate Desktop)
        yum groupinstall "X Window System"
        yum install -y "Mate Desktop"
        echo "exec /usr/bin/mate-session" >> ~/.xinitrc
        startx

    ---

     --mode <Installation mode>
        Default: gtk
        Allowed: gtk xwindow text unattended
    
    --prefix <prefix>   The path to install the Repository to
        Default: /opt/Thinkbox/DeadlineRepository10

    --dbtype <dbtype>    The type of Database that we're connecting to
        Default: MongoDB

    --installmongodb <installmongodb>
        This will install a new Mongodb instance. On Linux/Mac, the installer must be run by root if this is set to true.

    --prepackagedDB <prepackagedDB>
        Location of prepackaged MongoDB binaries (.tgz on Unix, .zip on Windows). If set, overrides dbInstallationType to prepackagedDB.

    --dbInstallationType <dbInstallationType>
        Options doesn't need to be used. Defaults to downloading the database. Specifying 'prepackagedDB' with an associated path will override this option.
        Default: downloadDB
        Allowed: downloadDB prepackagedDB

    --dbLicenseAcceptance <dbLicenseAcceptance>
        Do you accept this license?
        Default: notAccept
        Allowed: accept notAccept
    
    --mongodir <mongodir>
        Only applies if installing MongoDB. This is the path MongoDB will be installed to.
        Default: /opt/Thinkbox/DeadlineDatabase10

    --dbListeningPort <dbListeningPort>
        Only applies if installing MongoDB. The port on which the installer MongoDB server will listen for incoming connections. If connecting to an existing server, use <dbport> instead.
        Default: 27017

    --requireSSL <requireSSL>
        Only applies if installing MongoDB. If enabled, Deadline client connections will be authenticated via TLS/SSL. Certificates will be generated for this purpose and placed in <certgen_outdir>.

    --certgen_outdir <certgen_outdir>
        Only applies if installing MongoDB. The output directory in which generated x509 certificates will be placed.
        Default: /opt/Thinkbox/DeadlineDatabase10/certs

    --dbhost <dbhost>
        The host name or IP address of the machine that MongoDB is running on.

    --dbname <dbname>
        The name of the MongoDB database that the data is stored in.
        Default: deadline10db

    --dbuser <dbuser>
        The user name to connect to MongoDB with.

    --dbpassword <dbpassword>
        The password to connect to the database with. Submitting a value with
        the prefix 'env:' will instruct Deadline to pull the password from an
        environment variable. The name of the environment variable is the value
        after 'env:' (e.g. env:MY_VARIABLE)

    --dbclientcert <dbclientcert>

        If <dbssl> is true, this certificate will be presented when connecting
        to the server. Additionally, if <dbauth> is true, and <dbuser> is empty,
        this will also be used to authorize commands against the database.

        Default: /opt/Thinkbox/DeadlineDatabase10/certs/Deadline10Client.pfx


    --installSecretsManagement <installSecretsManagement>
        This will install the Secrets Management Feature in Deadline.
        Default:
        Allowed: true false

    --secretsAdminName <secretsAdminName>
        Secrets Management Admin username.
        Default:

    --secretsAdminPassword <secretsAdminPassword>
        The password for the Secrets Management Admin User.
        Default:


3. slave client

    hostnamectl set-hostname slave001
    10.0.30.14
    yum install -y autofs

    ```/etc/auto.master
    /data /etc/auto.nas
    ```

    ```/etc/auto.nas
    nas -rw,timeout=360 10.0.30.12:/data
    ```


    Installation Directory [/opt/Thinkbox/Deadline10]:

    The Repository Connection Type that Deadline will connect to.
    Connection Type
    [1] [Recommended] Remote Connection Server: Select this option if you are connecting to a Remote Connection Server.
    [2] Direct Connection: Select this option if you are connecting to a repository using the file system.


    Running Deadline Launcher as a daemon requires an open file descriptor limit (ulimit -n) to be set to the recommended value of 200000.

    You can change this limit in /etc/systemd/system/deadline10launcher.service
    after the installation has finished, but Deadline Launcher will have to be
    restarted before it recognizes the change.


    Once installation has completed, you can test it with deadlinecommand.
        /opt/Thinkbox/Deadline8/bin/deadlinecommand GetRepositoryOption

    export PATH=$PATH:/opt/Thinkbox/Deadline10/bin

    deadlinecommand GetFarmStatistics
    deadlinecommand GetFarmStatisticsEx
        shows some farm statistics

    deadlinecommand GetJobIds
         list the Job Ids for all the jobs in the queue
     deadlinecommand GetJob [Job Id Here]


     deadlinecommand Help GetJobIdsFilter
        deadlinecommand GetJobIdsFilter UserName=dwight JobStatus=Completed

    deadlinecommand SetJobSetting [Job ID Here] UserName james






Sharing The Repository

    the Repository must be visible to all machines that are connecting to it.

    The clients must have read access to the Repository root and all of its subdirectories.

    In addition, the Clients should have full read/write access to the following folders in the Repository:
        jobs: This is where job auxiliary files are copied to during submission.
        jobsArchived: This is where archived jobs are exported to.
        reports: This is where the physical log files for job and Worker reports are saved to.

    We recommend that these folders be restricted to read/execute permissions only (no write access):
        plugins: Contains Python scripts for the various render plugins supported by Deadline.
        events: Contains Python scripts for event plugins.
        scripts: Contains Python scripts that can be run from the Monitor.
        custom: This directory can house additional plugins, events, and scripts.

    
    This user will be granted appropriate access to the Repository.
        useradd -m deadlineuser
        chown -R deadlineuser:nogroup /path/to/repository   //Some distributions of Linux use nobody instead of nogroup
        chmod -R 500 /path/to/repository
        chmod -R 700 jobs/ jobsArchived/ reports/





Integrated Submission Script Setup

    Copy the file [Repository]/submission/Maya/Client/DeadlineMayaClient.mel to [MAYA_APP_DIR]/scripts.

    /data/nas/Thinkbox/DeadlineRepository10/submission/Maya/Installers
        三个平台的安装包


## deadline model

yum install -y epel-release
yum install -y mesa-libGL mesa-libGLU  (workstation)
yum install -y rsync
yum install -y iftop
yum groupinstall -y "Development Tools"






## links

deadline Download Integrated submission script    command line

https://www.awsthinkbox.com/blog/monitor-scripting-introduction

https://www.awsthinkbox.com/blog/deadline-command-tool

https://forums.autodesk.com/t5/3ds-max-forum/install-integrated-submission-script/td-p/6262926

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/app-maya.html#app-maya-integrated-submission-script-label

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/install-submitters.html#install-submitters-ref-label

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/manual-submission.html#

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/job-submitting.html#job-submitting-ref-label

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/install-client.html#linux

https://www.awsthinkbox.com/blog/installing-deadline-from-the-command-line

https://www.awsthinkbox.com/blog/deadline-command-tool

https://github.com/ThinkboxSoftware/Deadline/tree/master/Installation

https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/command.html

https://docs.thinkboxsoftware.com/



