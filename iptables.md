iptables �ǻ����ں˵ķ���ǽ��������ֱ����Ч

netfilter/iptables
    netfilter��Linux�ں˵Ĺ���

����ǽ����־�� IDS,IPS�ȸ߼���ȫ�豸�Ļ���

�������е�λ��
    ����߽�

������˵ķֽⲽ��
    ��ȡ
        ��̽
        ��������
    ʶ��
        Э��ͷ
        ��������
    ����
        ����
        �޸�
        �Ź�
        ��¼��־

4��5��

���õ�4�ű�
    1. raw
        1. prerouting
        1. output
    1. mangle
        1. �����޸����ݰ������ϣ��������������εģ������ݰ������ʶ��Ĭ�ϵĹ�������:
            1. prerouting
            1. forward
            1. postrouting
            1. input
            1. output
    1. nat
        1. 
            1. prerouting
            1. postrouting
            1. output
    1. filter
        1. ����������ݰ���
            1. input
            1. output
            1. forward

�� -> �� -> ����


��������˳��
    raw > mangle > nat > filter



-t --table

-A --append chain rule-specification

-C --check chain rule-specification

-D --delete chain 
     1. rule-specification
     1. rulenum

-E --rename-chain old-chain new-chain

-F --flush [chain]

-I --insert chain [rulenum] rule-specification

-L --list [chain]

-N --new-chain chain

-P --policy chain target

-R --replace chain rulenum rule-specification

-S --list-rules [chain]

-X --delete-chain [chain]

-Z --zero [chain [rulenum]]


netfilter���Ƶ�
                    ·�ɾ���
    preroutint    [routing-decision]  forward     postroutint

                    input                       output





iptables -t filter(default)


