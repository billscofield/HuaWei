
1. Dokuwiki ��php�ģ�����Ҫ�ȴphp���������� apache��php����1��2�������꣬��ص�������������

## Dokuwiki ��װ
1. httpd
    yum -y install httpd
    // �������������http://localhost �����ʵIt works��˵��Apache��װ�ɹ�������Apacheδ�ɹ���װ

2. php
    yum -y install php
    //����Apache���Ա�Apacheע��PHPģ�� sudo /etc/init.d/apache2 restart

    ```
    ����PHP�Ƿ�װ�ɹ�

    ʹ��vi�༭����/var/www/htmlĿ¼���½�һ��php�ű�test.php

    vi /var/www/html/test.php
    ��test.php��������´���

    <?php
      phpinfo();
    ?> 
    �ٴε�¼��ҳ�����룺localhost/test.php�����ʾ��php�İ汾��Ϣ�ȣ���ô��˵���ɹ�֧��PHP,����׼��������ϡ�
    ```

��Ϊ��yum�����Ҳ�����װ��������ֱ��ȥ���������ȶ���

3. ���ز���ѹdokuwiki�����
    wget -c http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
    tar -zvxf dokuwiki-stable.tgz

    ```
    
    ```

apache Ĭ�ϵ�ַ�� /var/www/html �����԰�dokuwiki�������ѹ��ŵ��˵�ַ

4. ����ѹ����ļ����Ƶ� apache Ĭ��·����
    mv dokuwiki-2017-02-19e/ /var/www/html/wiki
    
    ``` ???
    ����Ȩ�ޣ����������Ȩ�޻ᵼ���޷�������װ

    #data��confĿ¼��ҪдȨ��
    cd dokuwiki
    sudo chown -R www-data:www-data data conf
    ```

httpd Ĭ���������û������� apache�������޸��ļ��������û�����

5. �޸��ļ��������û�����
    chown -R apache:apache /var/www/html/wiki

    ``` ����3
    ��װDokuWiki����������������밲װ: http://localhost/dokuwiki/install

    ���ˣ���װ�ɹ���
    ```

6. ���� httpd
    service httpd start

���˿�80�Ƿ��п�ͨ
    firewall ��ͨ80�˿�
    firewall-cmd --zone=public --add-port=80/tcp --permanent
    firewall-cmd --reload

7. ���� install.php �������װ
    http://IP��������/wiki

8. ��װ����
    1. ά�����ƣ���wiki�����֣������ҵ���Lainme's Blog
    1. ����ACL���Ƽ�����������Ȩ�޿��ƣ��������Ĭ�ϣ�ѡ��״̬��
    1. �����û������볬���û����û���
    1. ȫ���������û���ȫ��������һ��һ������
    1. E-Mail�������û��ĵ����ʼ���ַ
    1. ���룺�����û�������
    1. ������һ�Σ��ٴ���������
    1. ��ʼ��ACL���ߣ�ȫ��Ȩ�޿��Ʋ��ԣ��������б���ѡ��һ�����ʵ�
    1. ���ŵ�ά�����κ��˶��ж���д���ϴ���Ȩ�ޣ�
    1. ������ά�����κ��˶��ж���Ȩ�ޣ�ֻ��ע���û�����д���ϴ���Ȩ�ޣ�
    1. �رյ�ά����ֻ��ע���û����ж���д���ϴ���Ȩ�ޣ�

��д��ɺ󰴡����桱��ɰ�װ�������ٴν���http://IP��������/wiki�����������½ǿ����и�����¼����ť��ͬʱ������Ҳ��������趨����վ���ơ�

9. ��װ�ɹ���
    1. ɾ�� install.php
        rm -f /var/www/html/wiki/install.php
    2. ��URL���й����Ա�֤���ݰ�ȫ
        vim /etc/httpd/conf/httpd.conf
        �� httpd.conf ����������

        ```
        <LocationMatch "/wiki/(data|conf|bin|inc)/">
        ����Order allow,deny
        ����Deny from all
        ����Satisfy all
        </LocationMatch>
        ```
    
10. �������� apache
    chkconfig --levels 235 httpd on

### ����������1��Dokuwiki Setup Error
DokuWiki Setup Error

The datadir ('pages') at ./data/pages is not found, isn't accessible or writable. You should check your config and permission settings. Or maybe you want to run the installer?

�����������yum�����Ȱ�װ httpd���ٰ�װ php����ʼ��ʱ��ֱ���� yum ��װ php��ͨ���������Զ���װ�������������� httpd������һֱ�� Dokuwiki Setup Error�����϶�û���ҵ�����������������´�һ����������װ httpd����װ php����û�г������������

### ����������2���������ʱ��ʾ 403 Forbidden����Ҫ�ر�SELinux
�鿴SELinux״̬��
1��/usr/sbin/sestatus -v ##���SELinux status����Ϊenabled��Ϊ����״̬
SELinux status: enabled
2��getenforce ##Ҳ���������������

�ر�SELinux��
    1. ��ʱ�رգ�����������������
        setenforce 0 //����SELinux ��Ϊpermissiveģʽ
        //setenforce 1 ����SELinux ��Ϊenforcingģʽ
    2. �޸������ļ���Ҫ����������
        �޸�/etc/selinux/config �ļ�
        ��SELINUX=enforcing��ΪSELINUX=disabled
        ������������
### ����
https://www.cnblogs.com/error503/p/8041982.html

https://thishosting.rocks/build-your-own-wiki-on-ubuntu-with-dokuwiki/

https://www.cnblogs.com/ljxxz/p/5079226.html

https://blog.csdn.net/wszll_Alex/article/details/80246588

https://www.linuxprobe.com/ubuntu-dokuwiki-wiki.html

https://www.dokuwiki.org/zh:install:ubuntu (official methods)

Dokuwikiϵ�н̳�
    1. https://blog.csdn.net/wszll_alex/article/category/7650010

ʹ�ý̳�
    1. http://www.360doc.com/content/15/0716/13/15077656_485261906.shtml
    1. dokuwikiע�ἰ���ʼ�����Ľ��
        1. http://www.fwolf.com/blog/post/82
    1. https://blog.csdn.net/leekwen/article/details/54907445

## Dokuwiki�����﷨
ά���﷨��Ҳ֧��Markdown�﷨

