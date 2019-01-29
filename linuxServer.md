# Linux Server

## ip
������

1. ifconfig
    1. ��Ҫ�ǲ鿴����Ϊ���ܱ��浽Ӳ�̣����Ǵ����ڴ���
    1. ifconfig eth0 192.168.1.1 netmask 255.255.255.0
        1. ������(��������)
            ifconfig eth0:0 192.168.1.2 netmask 255.255.255.0
    1. ����/�ر�����
        1. ifconfig eth0 down
        1. ifconfig eth0 up


service networking restart
/etc/init.d/networking restart


1. ͼ�λ�

1. setup(redhatר��)

    AMD(Advanced Micro Device)

1. �����ļ�
    1. /etc/network/interfaces
    1. auto eth0
    1. inet 
        1. none
        1. static
        1. dhcp
        1. manual
    1. address 
    1. netmask
    1. gateway
    1. broadcast ��ѡ
    1. dns-nameservers 192.168.0.1

```
iface ens33 inet static
address 192.168.1.111
gateway 192.168.1.1
netmask 255.255.255.0
dns-nameservers 8.8.8.8
```

�����ļ��޸ĺ�Linux ping��ͨ����������pingͨ������8.8.8.8, ����ʲôԭ��?



dns
    /etc/resolf.conf        //don't edit this file   ������ָ�� /run/systemd/resolve/stub-resolv.conf


ifdown 
ifup
    ��������ô�ã�
    1. ò����ֻ�е�/etc/network/interfaces �ж�Ӧ��itemʱ���ſ���������������������ʾ unknown interface [��������]

    ```
    /etc/network/interfaces ����� ens33
    init 6 ʹ��������Ч��

    ifdown ��ʾ cannot assign requested address  ��ʲô��˼?
    ```

ò���޸���/etc/network/interfaces����ʹ/etc/init.d/networking restart ����  ifconfig ens33 down && ifconfig ens33 up ���� ifdown ens33 && ifup ens33 Ҳ������Ч��init 6 �Ż���Ч



## ������
1. ��ʱ�޸�
    hostname ��������
    ���µ�½һ���ն˾Ϳ��Կ����ı���

1. �鿴����ip
    hostname -I , --all-ip-addresses
    hostname -i , --ip-adress   //��hostname��Ӧ���Ǹ�ip

    ����docker nginx

    �ϱ���������

1. �������ļ�
    1. /etc/hostname

## ��������ip��Ӧ��ϵ
1. /etc/hosts

��ŵ���������ip�Ķ�Ӧ��ϵ��������������û���κι�ϵ�������Ϊ�κ�һ��IPָ������һ������
?


## netstat
-t:�г�tcpЭ��˿�
-u:�г�udpЭ��˿�

-a:������������  --all  display all sockets (default:connected)
-l:���г��ڼ���״̬������� --listening    display listening server sockets
-n:��ʹ�����������������ʹ��IP��ַ�Ͷ˿ں� --numeric    don't resolve names

-r --route      display routing table
    ͬ route
    ���Բ鿴gateway
-i --interface  display interface table
-g --groups     display multicast group memberships


netstat -nl
netstat -na
netstat -tln
netstat -tuln

tcp�Ż��м�����listen��


established 
netstat -an | grep ESTABLISHED | wc -l


## route
-v, --verbose
-n, --numeric       don't resolve names
-e, --extend        display other/more information
-F, --fib           display Forwarding Information Base
-C, --cache         display routing cache instead of FIB

## nslookup
(name server lookup)

Nslookup can be use in interactive and non-interactive mode.


By default nslookup will use the domain server that is currently configured for your system.
You can switch DNS servers using server name or server IP address option.

To switch to using the open dns server address 208.67.222.222 then go to an interactive prompt and type:

nslookup
>server 20867.222.222


http://www.steves-internet-guide.com/using-nslookup/


## telnet
telnetʹ�õ���tcpЭ�飬���仰˵telnetֻ�ܼ��tcp������˿ڴ���û

Telnet�ǻ���TCP�ģ�Ĭ�϶˿���23��**�˿ڳ��صķ���������û��趨��** sqlserver��Telnet������1433�˿�

telnet ip port����Ŀ�������˿��Ƿ񿪷�

��Ҫ��telnet�����

telnet ip port
telnet 192.168.1.1 23

```
telnet www.baidu.com 80

connected to www.a.shifen.com
escape character is '^]'
��ʾ����˿��Ǵ򿪵�
```

telnetΪʲô�����������ĳ���˿��ǿ����˵���? 
telnet 80�˿���ʲô��˼��?
telnet ����˶�û�п�����Ϊʲô������telnet 80�˿���?

## traceroute
ʹ�õ���ping�������ֹ��ping����ô��...

-n, --numeric   


## wget















