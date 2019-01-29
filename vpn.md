## ��� 
https://www.bilibili.com/video/av34517294/?p=4

vpn�������

GRE��IPSec��SSL/TLS��VPN(WebVPN)��PPTP��L2TP  ��Щ���ǿ�ܣ��൱��OSI�������Ǿ����Э��

## ���ݸ���
1. GRE������� (Tunnel)
1. ���ܼ��� �����㷨 HMAC
1. IPSec (IP Security)
1. IPSec LAN-to-LAN VPN
1. IPSec Dynamic LAN-to-LAN VPN
1. GRE over IPSec
1. Dynamic Multipoint VPN (DMVPN)
1. IPSec VPN Feature
1. Easy VPN (EzVPN)
1. SSL VPN (Web VPN)
1. PPTP VPN
1. L2TP VPN


### GRE(Generic Routing Encapsulation)
    ��򵥵ģ���֤˽���ԣ�û�м��ܵĹ���
    1. ����ԭʼIP���ݰ�����**�˿�Э��**��ԭʼIP���ݰ���ͷ��IP��ַΪ˽��IP��ַ
    1. ��ԭʼIP���ݰ���װ��GREЭ�飬GREЭ���Ϊ��װЭ�飨Encapsulation Protocol������װ�İ�ͷIP��ַΪ����ֱ����·���˵�IP��ַ
    1. ������GRE���ݰ��������ݣ�������װ����IP��ͷ��Ҳ�����������Դ���յ㣬�Ӷ�·�ɵ�����յ�

### IPSec   : Internet Protocol Security

https://en.wikipedia.org/wiki/IPsec

1. ����ʵ��������ܣ���Ҫʵ�����ݰ�ȫ
1. ����
    1. ����Դ��֤
    1. ��������������
    1. ��֤����˽����
    1. ��ֹ�м��˹���
    1. ��ֹ���ݱ��ط�

1. �����Կ����   ��  ������ݼ���

1. ΪIPSec�����3��Э��
    1. IKE(Internet Key Exchange) ��Կ����,��֤��Կ��ȫ���ԳƼ���
        ΪʲôҪ�öԳƼ�����???
        ��ԿЭ�̣���ֹ�м��˼�������

        1. ��֤��Authentication�� ��ʵ�Է���ݣ�ȷ�������м���
            1. Pre-Shared Keys (PSK) Ԥ������Կ
                ���Ⱥ�ʵ�Է���ݣ��ٹ�����Կ
                    �����������ԱЭ�̺󣬱�����Ԥ�������Կ 123456,���Ϻ��������Կ 987654�������ڶԻ���ʱ����ܺ�ʵ����ˣ��м��˿϶���֪����������Կ��Ҳ�Ͳ��ܱ���ʵ������м���֪���ˣ��Ǿ�over��

                    �����ͷ����

                    ��ʵ����ݺ���

                ˫������ԿҪһ����?

            1. Publick Key Infrastructure(PKI)
                1. ����֤��

            1. RSA encrypted nonce

        1. IKEʹ�� Diffie-Hellman���㷨��**�����Կ���м���**,������Կ
            1. Group1  ��Կ����768bit
            1. Group2  ��Կ����1024bit
            1. Group3  ��Կ����1536bit
            
    1. ESP(Encapsulating Security Protocol) ��֤���ݰ�ȫ
    1. AH(Authentication Header) ��֤���ݰ�ȫ

1. SA(Security Association) ���ƺ�ͬ,���ͷ��ͽ��շ��ĺ�ͬ
    1. IKE SA
    1. IPSec SA


#### security architecture
The IPsec is an open standard as a part of the IPv4 suite. IPsec uses the following protocols to perform various functions:

    1. Authentication Headers (AH) provides connectionless data integrity and data origin authentication for IP datagrams and provides protection against replay attacks.[10][11]

    1. Encapsulating Security Payloads (ESP) provides confidentiality, connectionless integrity, data-origin authentication, an anti-replay service (a form of partial sequence integrity), and limited traffic-flow confidentiality.[1]

    1. Security Associations (SA) provides the bundle of algorithms and data that provide the parameters necessary for AH and/or ESP operations. The Internet Security Association and Key Management Protocol (ISAKMP) provides a framework for authentication and key exchange,[12] with actual authenticated keying material provided either by manual configuration with pre-shared keys, Internet Key Exchange (IKE and IKEv2), Kerberized Internet Negotiation of Keys (KINK), or IPSECKEY DNS records.[13][14][15][16]




PPTP    :Point-to-Point Tunneling Protocol
L2TP    :Layer Two Tunneling Protocol


## 

https://www.cnblogs.com/linuxde/p/8729339.html


## GRE���:��������ӿ�IP��ַ��ʲô���ã�

GRE���ͨ��û���κεļ��ܻ��ƣ�ֻ����һ�����ߵĶ�̬·��Э��ͨ�������ַ���������ڽӹ�ϵ��ѧϰ·�ɵ�Ŀ�ģ�һ��Ipsec�޷����ݶ�̬·����Ϣ��ֻ��ͨ��GRE������ֲ����ȱ�ݣ������͵�����һ�ֽ�ipsec over gre�ļ�����
����1����Ϊ������ݱ���ͨ��GRE�����װ���ܴ��ݵ��Զˣ���ͨ��GRE�������Ҫ��GRE����ӿڲ��ܴ�����������Ľ�������ʼĩ·�����Ͻ�������������������ӿڱ���������ʼĩ·�����ϣ�

����2����Ϊ������������ͷ·��������豸ͨ��ֱ���߽���һ�㣬һ������·����ֱ���ӿ�ͨ�ţ����������ͬһ���ΰ�

����3�����������ַ����ҪĿ�ģ���ͨ��·�ɽ�һЩ��Ҫ�����������ת�������ͨ�����ת�����Զˣ���Ȼ��������ߵ�·������Ҫͨ��GRE���������̬·���ڽӹ�ϵ�γ�·�ɱ��������ô��Ϊ����ֻ�ǽ������������һ��Ŀ�ġ�



### GRE
1. Generic Routing Encapsulation ͨ��·�ɷ�װЭ��
1. GRE is a tunneling protocol developed by Cisco Systems that can encapsulate a wide variety of network layer protocols inside virtual point-to-point links or point-to-multipoint links over an Internet Protocol network.

### PPTP
    1. The Point-to-Point Tunneling Protocol (PPTP) is an obsolete method for implementing virtual private networks. 
    1. PPTP has many well known security issues.


### IPSec
    1. In computing, Internet Protocol Security (IPsec) is a secure network protocol suite that authenticates and encrypts the packets of data sent over an internet protocol network. 
    1. It is used in virtual private networks (VPNs).



### ��������
https://my.vultr.com/deploy/    
    https://www.cnvultr.com/


### �vpn�̳�
https://www.bilibili.com/video/av24382357/?spm_id_from=333.788.videocard.0
    https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/vpnsetup.sh (�ű��ļ�)

https://segmentfault.com/a/1190000015067117?utm_source=tag-newest
https://blog.csdn.net/u201012980/article/details/79187765
https://blog.csdn.net/qq_33571718/article/details/81543408


ss(shadow sockets)
http://blog.51cto.com/14018334/2299803?cid=724705










## FS

����һ������ϵͳ�����һ����Կ����ȡ����ôֻ�б������Կ���ܵ����ݻᱻ��ȡ��
��һЩ����ϵͳ����Կ���Ǵ��ʼ��һ����Կ�����ģ����������һ����Կ����ȡ�������߽������ռ����㹻����Ϣ��������������Կ��
��ʹ��PFS֮ǰ��PFSʹ��IPSEC�ڶ��׶ε���Կ�Ǵӵ�һ�׶ε���Կ�����ģ�ʹ��PFS��ʹIPSEC�������׶ε���Կ�Ƕ����ġ����Բ���PFS����߰�ȫ�ԡ�
Ҫ��һ����Կֻ�ܷ������������������ݣ�����������Կ��Ԫ��һ��һ���������ٲ�����������Կ��һ����Կ���ƽ⣬����Ӱ��������Կ�İ�ȫ�ԣ�PFS ��������DH�㷨���ϵġ�

In cryptography, forward secrecy (FS), also known as perfect forward secrecy (PFS), is a feature of specific key agreement protocols that gives assurances your session keys will not be compromised even if the private key of the server is compromised.[1] Forward secrecy protects past sessions against future compromises of secret keys or passwords.[2] By generating a unique session key for every session a user initiates, even the compromise of a single session key will not affect any data other than that exchanged in the specific session protected by that particular key. Forward secrecy further protects data on the transport layer of a network that uses common SSL/TLS protocols, including OpenSSL, which had previously been affected by the Heartbleed exploit. If forward secrecy is used, encrypted communications and sessions recorded in the past cannot be retrieved and decrypted should long-term secret keys or passwords be compromised in the future, even if the adversary actively interfered, for example via a man-in-the-middle attack.

    (https://en.wikipedia.org/wiki/Forward_secrecy)




## ���ܼ���
�����㷨
    1. �ԳƼ����㷨��˽Կ�㷨��
        1. DES(40bits  56bits 3DES(3����56bits ��168bits))
        1. AES(128-bit, 192-bit, 256-bit)

    1. �ǶԳƼ����㷨����Կ�㷨��
        RSA:���ܳ���λ�����������˹�����

Hash�㷨
    1. MD5 (Message Digest 5) 
        1. ���κ�����ͨ����������**128-bit**���ȵ�Hashֵ
    1. SHA-1 (Secure Hash Algorithm 1)
        1. ���κ�����ͨ����������**160-bit**���ȵ�Hashֵ

    ������



