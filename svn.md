
sudo apt install subversion

svnserve --version

�����汾��Ŀ¼
mkdir /home/hjimi/

�����汾��
mkdir /home/hjimi/svn-znjj/

svnadmin create /home/hjmim/svn-znjj/

�汾��  /home/hjimi/svn-znjj/

�汾���Ŀ¼ /home/hjimi/

## ����
svnadmin create /home/hjimi/svn-znjj/ ��confĿ¼
    /home/hjimi/svn-znjj Ŀ¼����Ϊ��

1. authz
    1. �˺�Ȩ�޵Ĺ���
    
    ```
    [/home/hjimi/svn-znjj/]   //�ڶ�������˵ д��[\]
    tomrw = rw
    tomr = r
    tomw = w
    ```
    
1. passwd
    tomrw = tomrw
    tomr = tomr
    tomw = tomw

1. svnserve.conf (svn��������)
    anon-access = read
    auth-access = write
    (ǰ�ߵĿո�Ҳȥ��)
    password-db = passwd
    authz-db = authz        //�ڶ�������˵�����Ҫ���
    realm = My First Repository
    

1. svn�˿ں�3690
    (tomcat�˿ں�8080)
    
    /sbin/iptables -I INPUT -p tcp --dport 3690 -j ACCEPT
    (ubuntu 16 server Ĭ��û������iptables???)

    /etc/init.d/iptables save
    /etc/init.d/iptables restart

    ufw enable  //��������ǽ
    ufw disable //�رշ���ǽ
    
    svnserve -d -r /home/hjimi   //(�汾��Ŀ¼��ַ)

    netstat -apn | grep 3690


���յڶ������ӵ����� ����Ȩ��û�����ã�tomr Ҳ�����ϴ�

svn û��ֱ�������ķ��������岽�����£�
    1. ps -ef | grep svn
    1. kill -9 [���̺�]
    1. svnserve -d -r /home/hjimi   (����Ŀ¼)

    -r��ʾ��svn��Ŀ¼������Ŀ¼

add
commit  //������������ύ��

update ���� pull


SVN�ڷ������˵Ĵ洢��ʽ�Ϳͻ����ǲ�һ���ģ������ڷ��������ǿ�����Դ�ļ��ġ��������������ִ洢��ʽFSFS��BDB��ĿǰĬ�϶���FSFS��


��ô�л��û���?



https://www.bilibili.com/video/av40310479/?p=3

https://www.cnblogs.com/Life-Record/p/7099297.html

https://www.cnblogs.com/ygj0930/p/6623148.html
