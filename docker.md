�û��ռ�

�ں˿ռ�


docker ����(image)Ҳ�����Լ�����
    ͨ����ʹ�� alpine(����Linux) ��װ���ַ���
    https://hub.docker.com

    docker image ls
    docker pull [����]
    
    �������񣬰�װ������ɺ� ifconfig, ���˸� docker0 ������

    docker container ls | docker container ls -a
    docker container run --name [ʵ����1] -it [������]  //һ����������ж��ʵ����ʵ��������
        -i ����ʽ
        -t 

    
    docker container attach [ʵ����]

    curl 172.17.0.2

    docker stop [ʵ����]

    docker start [ʵ����]

    docker kill [ʵ����]
    docker rm [ʵ����]

    docker exec [ʵ����] ifconfig

    docker exec -it [ʵ����] /bin/sh

    docker inspect [ʵ����]


    haproxy



---

## docker����ƪ
1. linux�������
1. docker����֪ʶ
1. Maven/Git���֪ʶ
1. javaEE
1. Docker��go���Կ���
### docker��ʲô
1. Ϊʲô�����docker
    �����Ĵ��� ����ά �ŵ��������͹��ˡ�������һ��������Ͳ�������
    �ѿ����Ļ��������롢���á�ϵͳ������ �������ά
    ���+���� ��װ
    ��ԭʼ����һģһ���ĸ��ƹ���

1. ����
    1. ����
    1. ���л���
    1. ����ϵͳ
    1. �ں�
1. ����
    Build, Ship and Run Any App, Anywhere
    ��װ�䣺���������
    ��װ����ǿ����ߵ�ÿ�����ߣ��������ǰѿ��������еĹ��ߡ������ù������ŵ�������

### Docker �ܸ�ʲô
1. ֮ǰ�����⻯����
    �����
        1. 

    �������⻯����
1. ����/��ά��DevOps)
    1. һ�ο���

1. �����������ֿ�
    Docker Hub

    1. centos 6.5 ���ϰ汾
        uname -r

    1. �����ʵ����������
    ���԰�����������һ�����װ��Linux����������root�û�Ȩ�ޡ����̿ռ䡢�û��ռ䡢����ռ�ȣ������������е�Ӧ�ó���

    1. �ֿ��Ǽ��д�ž���ĵط�

        �����⣬˽�п�


---

container = App + Bins/Libs, �����Ǹ���װ��
Docker ��������������
�󺣾���ʵ��Linux





-------------------------------------
Docker ���������� �����⻯��һ��
ʲô��������
    һ�����⻯�ķ���
    ����ϵͳ��������⻯
    ֻ��������ͬ�������ں˵Ĳ���ϵͳ
    ������Linux�ں����ԣ�Namespace �� Cgroups (Control Group)��(���ܣ�Ҳû��windows����)
        Namespace
            ��װ-��ϵͳ��Դ�ĸ��룬���̣����磬�ļ�ϵͳ...
            1. PID (process ID) ���̸���
            1. NET (network) ��������ӿ�
            1. IPC (InterProcess Communication) ��������ͨ�ŵķ���
            1. MNT (Mount)  ������ص�
            1. UTS (Unix Timesharing System) �����ں˺Ͱ汾��ʶ
        Cgroups (2007�걻���Ͻ�Linux�ں�)
            1. ��Դ����
            1. ���ȼ��趨
            1. ��Դ����
            1. ��Դ����

    ����Linux�ں˵����⻯

1. docker client   �ͻ��ˣ�C/S�ܹ���
1. docker daemon   �ػ����� 
1. docker image    ����
    �����ֻ���ļ�ϵͳ
    ���ϼ���(union mount)
1. docker container    ����
    ���ӿ�д��
    дʱ����(copy on write)
1. docker registry �ֿ�
    �����û������ľ���


docker image����
   
    add Apache
    add emacs
    rootfs(root fs root�ļ�ϵͳ,����ubuntu,centos,ֻ��)
    bootfs(boot fs boot�ļ�ϵͳ)

    һ��������Էŵ���һ������
    ����ֲ�

����
    
    ��д��
    add Apache
    add emacs
    rootfs(root fs root�ļ�ϵͳ,����ubuntu,centos,ֻ��)
    bootfs(boot fs boot�ļ�ϵͳ)


the docker engine consists of two parts:
    a daemon:a server process that manages all the containers
    a client:which acts as a remote control for the daemon


��װ��ʽ
    ���
        1. �ں� uname -r
        1. ls -l /sys/class/misc/device-mapper
    1. ����1 Ubuntu ��apt
        sudo apt install docker.io
        source /etc/bash_completion.d/docker.io  //û�ж�...

    1. ����2 Dockerά���İ�װ��ʽ
        ��� /usr/lib/apt/metods/https �ļ��Ƿ����


        docker �ṩ��shell�ű�
        sudo apt install curl
        curl -sSL https://get.docker.com/ | sudo sh

    1. ubuntuĬ�ϵ��Ǹ������˻���ӵ�docker����߻�����ʾȨ�����⣬�����һ����ͨ�û���ӵ�docker����߾�OK��...
        docker version


��������
    docker run [IMAGE] [command] [args]
        docker run ubuntu echo "hello world"
    ����û�о���Ļ������Զ����� ubuntu:latest

�鿴����
    docker ps   //�������е�
        -a      //���е�container
        -l      //��󴴽����Ǹ�container
        -n [m]     //��󴴽���m��container
        --no-trunk //do not truncate output
        -q --quiet //only show numeric ids
        -s --size   //total size
��ϸ�鿴����
    docker inspect [id��name]

�Զ���������
    docker run --name=container01 -i -t ubuntu /bin/bash
������������
    docker rename [old-container-name] [new-container-name]

��������ֹͣ������
    docker start [-i] [������]
        -i : ����ʽ
        ����û�� -t, -t �� docker run ʱ��

ɾ���Ѿ�ֹͣ������
    docker rm [������]  //����ɾ���������е�����

�ػ�ʽ����
    �ص�
        1. �ܹ���������
        1. û�н���ʽ�Ự
        1. �ʺ�����Ӧ�ó���ͻỰ

    1. ��ʽ1 
        docker run -i -t [������] /bin/bash
        ctrl p  ctrl q //������ʽ�������ں�̨����

        docker run -it ubuntu       //ÿ��������Ĭ�ϵ�shell,����Ubuntu��/bin/bash, busybox ��sh
    
    1. ��ʽ2 
        docker run -d ������
            --detach=true Ĭ����false
        docker run --name one -d ubuntu /bin/sh -c "while true;do echo helloworld;sleep1;done"

    docker attach [������]
    
    exit �ǳ����˳�����

�鿴������־(�����ڲ��������)
    docker logs [-f] [-t] [--tail]
        -f һֱ���� --follows , һֱ����
        -t ʱ�� --timestamps
        --tail 10
            --tail 0
        docker logs -tf [container��]
        
        ����
            ```
            docker run -d --name busy ubuntu /bin/sh -c "while true;do echo 'hello';sleep 1;done;"
            docker logs -tf --detail 1 busy
            ```

    docker top ������   //�鿴�����е������Ľ���
        
        
�����е������������½���
    docker exec  -d -i -t ������ COMMAND ARG...
        docker exec -it dc1 /bin/bash
        docker top dc1  //��ʱ�Ϳ��Կ���һ��/bin/bash����������
        
ֹͣ�ػ�ʽ����
    docker stop ������
        ��docker�����Լ�ֹͣ
    docker kill ������
        ɱ��docker����


man docker-run
man docker-log
man docker-top
man docker-exec
man docker-search




�������в�����վ
    �˿�ӳ�䣬��ʽΪ������(����)�˿�:�����˿�
        -P[upcase] , --publish=[]
        -p
    
    1. ����ӳ��80�˿ڵĽ���ʽ����
    1. ��װNginx
    1. ��װvim
    1. ������̬ҳ��
    1. �޸�Nginx�����ļ�
    1. ����Nginx
    1. ��֤��վ����

docker run -p 80 --name web -it ubuntu /bin/bash
apt install -y nginx
apt install vim
mkdir -p /var/www/html
cd /var/www/html
vim index.html
    <html>
        <head>Nginx in docker</head>
        <body>
            this is from docker
        </body>
    </html>

whereis nginx
ls /etc/nginx/sites-enabled
vim /etc/nginx/sites-enabled/default
    server 
        root /var/www/html;
nginx
ctrl p ctrl q

docker ps
    �鿴��������80�˿�ӳ�䵽���ĸ��˿�
docker port web
    ���Ҳ���Կ��˿�ӳ�����
docker top web

curl http://127.0.0.1:�˿�

docker inspect //������ip��ַ
curl http://������ip��ַ
    ����ͨ�� docker inspect [������] ���鿴ip��ַ���˿ڵ�������鿴 NetworkSettings


docker stop web
docker start web
docker exec web nginx
curl http://127.0.0.1:�˿� �����ܷ���
ֹͣ��������������ʱ��ip��ַ��ӳ��Ķ˿ںŶ���仯
    ��ô�����?


�����λ��
    docker info 
        �鿴imageλ��
        /var/lib/docker/
        find ./ -name respositories.json
            respositories.json Ҳ����Щ��Ϣ

�г�����
    docker images   //�Ѿ���װ�ľ���
        -a --all    //��ʾ�м�㾵��
        -f --filter
        --no-trunc  //���׶� imageid
        -q --quiet
       
        repository:�ֿ���  ����ubuntu,centos. һϵ�о���ļ���;��ͬ��repositry �ṩ����Ĵ洢����
        tag:��ǩ��, һ��repository�ӵľ������� tags ���������ֵģ�repository + tag �ͽ�����Ψһ��ʶ
            repository:tag �����������ľ�������
            repository Ĭ��ʹ��latest��Ӧ�ľ���
                ���磺docker pull ubuntu == docker pull ubuntu:latest
        Image ID    
        created ����ʱ��
        virtual size ��С

        docker images ubuntu    //ubuntu ��һ��repository, �����ܶ಻ͬtag��image

        1��image�����ж��tag, ��ֻ��һ��numeric id; 
            ���� docker rmi ubuntu:latest ����ֻɾ����һ����ǩ����û��ɾ�����еģ����������docker rmi [numeric id] ��ֱ�ӽ���ͬnumeric �ľ��ж����ǩ��imageɾ��
            Ϊʲôͬһ������Ҫ�ж��tag��?

�鿴����
    ֧�������Ĳ鿴
    ֧�־���Ĳ鿴
    
    docker inspect ubunt
        ����json��ʽ��Ϣ

ɾ������
    docker rmi  ����1 ����2 ...
        -f , --force
        --no-prune  //do not delete untagged parents   ���Ƴ��þ���Ĺ��̾���,Ĭ���Ƴ�
        
�����ǩ


���Ҿ���
    1. ����1 docker hub 
        1. ע��
        1. ���� ubuntu
        1. ��ַ hub.docker.com
    1. ����2 ������
        1. docker search [option] TERM
            1. --no-trunc   //���ض�,do not truncate output(��Ҫ���description)
            1. --limit [����] //һ�η��ض��ٸ�results  Ĭ��25
            1. --filter=stars=����ֵ
            1. --filter=is-automated=true
                automated�Զ���ѡ��ʱʲô��˼???
            1. --filter=is-official=true|flase

    1. problems
        Ϊʲôdocker search ubuntu �ķ��ؽ�����е���repository,�е�û�У�repository����һ��;��hub.docker.com������ʱֻ��tag��ͬ
        ��ҳ����ʱ������� repository? ��������: ?

��ȡ����
    docer pull [option] NAME[:TAG]
        -a,-all

        ȫ�����û���/������

    --registry-mirror   //�޸�Ϊ���ڵ�???
        /etc/default/docker ���  DOCKER

    docker pull hub.c.163.com/library/ubuntu
        hub.c.163.com/library/      //����docker registry
        ��ͬվ�����ص�image ��һ�������������ص�ubuntu 120MB,��Ĭ�ϵ�վ���86MB

    DAUCLOUD
    
    busybox��һ��������һ�ٶ�����linux����͹��ߵ����,ͬʱ��Ҳ��һ����С��Linuxϵͳ�����ṩ�˸�ϵͳ����Ҫ���ܣ�����grep��find��mount�Լ�telnet�ȵ�������һЩ��GNU��صĹ��ܺ�ѡ�

    ����Docker�й����ٷ�����

        ```
        vim /etc/docker/daemon.json

        {
            "registry-mirrors":["https://registry.docker-cn.com"]
        }

        sudo service docker restart

        docker pull busybox //���в���
        ```


���;���
    docker push �û���/������
    docker �������ϴ��������񣬶����ϴ��޸ĵĵط�


��������
    1. ����1 docker commit   //ͨ����������
        docker commit [options] CONTAINER���� [REPOSITORY[:TAG]] (������)
                                ??
            -a --author [string]
                docker inspect ʱ���Կ���
            -m --message    [string]
                docker inspect ʱ������������û��???
            -p --pause  //pause container during commit(default true)

            docker commit [numeric id] ������
    1. ����2 docker build //ͨ��dockerfile�ļ�����
        docker build 
            --tags " "



remote api

    ��ͳC/S��ʽ
    user -> docker client -> docker server

    remote api ��ʽ
                        remote api
    user -> �Զ������ ----------->  docker server



docker client & server
    ͨ��socket ��ʽ����
        unix

docker �ػ�����
    service docker status
    ps -el | grep docker
    /etc/init.d/docker start
    /etc/init.d/docker stop
    /etc/init.d/docker restart

    docker ���������ļ�
        /etc/default/docker

docker ��Զ�̷���???
    1. ��Ҫ��֤�汾һ��

    1. -H
    1. /etc/default/docker


docker������
    docker0:
        docker server������
        linux���������� 
            1. ��������IP��ַ
            1. �൱��ӵ��һ�����ص���������

        ���Ź����� bridge-utils(ubuntu Ĭ��û�а�װ)
            brctl show

    docer ���� ��stop start�� ip���ܻ�ı䣬���ɿ�
    docker ʹ���˱����Ļ��ƽ��������

### ��������
1. docker version
1. docker info
1. docker --help
    Ϊʲô�ҵ�ֻ��ʾ��ô����options???//������Щ��֪����ʲô���������д��shit
    docker run --help
    docker exec --help


## ��װ���
1. net-tools, the collection of base networking utilities for Linux.
    Includes: 
        arp
        hostname
        ifconfig
        netstat
        rarp
        route
        plipconfig
        slattach
        mii-tool
        iptunnel 
        ipmaddr








## 
docker 
dns - bind9
nginx
    nginx������


������ uname -r �� ������ uname -r ��ͬ

������ hostname �� ������ hostname ��ͬ
    ��������hostname����docker ps --no-trunc ��ǰ12���ַ�


������Ϊdocker�ĳ��ֶ�������������Ϊdocker��Ϊ����,�����׹���

docker �ѿ���������������


Mirror site(����վ��)
    �ǽ���վ�Ķ���������ò�ͬ�ķ�����������������߷�Ӧ�ٶȣ��û������ڷ��ʽ��ٻ�����ٶȽϿ�ķ�������ȡ����Ϣ����������紫��Ч�ʣ�Ҳ�������վ�İ�ȫ�ԡ�������뱣֤���ϸ����Է�ӳԭվ�ı仯����Щʱ��ԭվû���������ӽ�������·��������վȴ�������ӽ���







