## Linux ������
1. awk
    awk '{print $1}' �ļ�   ��ӡ�ļ��ĵ�һ�� ֻ���õ�����
    awk '{print $NF}' �ļ�   ��ӡ�ļ��ĵ�����һ��
    awk '{print $(NF-1)}' �ļ�   ��ӡ�ļ��ĵ����ڶ���
    
    �ָ�����Ĭ�Ͽո�,��ʽ�����
        -F
            1. -F:
            1. -F"add"
    
        {print $1,$NF} ��һ�к����һ��
            -F. {print $1":"$NF}  //��ʽ�������.��Ϊ�ָ���

        egrep --color "([0-9]{1,3}\.){3}[0-9]" b.txt | awk -F. '{print "Hello-"$1"-"$2"-"$3"-"$4"-keep-smile"}'

1. sed
    �ű����޸�һ����sed,ƽ����vim

    sed 's/old/new/g' a.txt
        -i �޸ĵ��ļ�,ò��Ĭ�����޸ĵ��ڴ�
















1. grep
    grep --color -n 'root' /etc/passwd 
        -n //�к�
        --color //ƥ���������ɫ
        -v "#"  //�������,ȡ��
        -v "^$" //ƥ��ǿ���

    -E = egrep //��չ��grep
        ipƥ������

## ��������

1. find
    -type
        f file
        d directory
    -ctime
    -atime
    -mtime  �ļ��޸�ʱ��
        +  ��Χ֮��
        -  ��Χ֮��  

    -size
        +10k(Сд)
        +10M(��д)

    -perm 755
        

    find  | xargs rm -rf {} \;
            --exec rm -rf {} \;

    find ... | --exec cp {} /tmp/ \;
        xargs �������ܵ�

    find ./ -type f --exec chmod -R 644 {} \;
    find ./ -type d --exec chmod -R 755 {} \;

    find ./ -type f -name *.log -mtime +30 --exec shred -uz {} \;


1. dd
    
1. cron














































1. �ܵ�
    1. stdint 0
    1. stdout 1
    1. stderr 2
    ֻ���汨����Ϣ
    2>&1 

    find ./ -user root | grep xian 2>/dev/null

    grep linuxcast < /etc/passwd

    ls a.txt no.txt >result 2>&1
                    >/dev/null 2>&1

    1. ����& 1 ��׼ȷ��˵Ӧ����**�ļ������� 1**,��1��ʶ��׼�����stdout��
    1. ����2 ����ʾ��׼����stderr��
    1. 2>&1 ����˼���ǽ���׼�����ض��򵽱�׼����������׼����Ѿ��ض����� /dev/null����ô��׼����Ҳ�������/dev/null
    http://www.cnblogs.com/zhenghongxin/p/7029173.html

    tar �Ĺܵ��÷���ô��ô�ر���?xargs
    find ./ -user root | grep a.txt | xargs tar -zcvf a.tar.gz




echo 'main' | cat test.cpp
���������cat�����test.cpp�����ݣ�������'main'�ַ��������test.cpp��������cat�������ļ������ڣ������᳢�Դӱ�׼�����ж�ȡ��echo 'main' | ��ͨ���ܵ��� echo �ı�׼���(Ҳ�����ַ���'main')���뵽 cat �ı�׼���룬Ҳ����˵��ʱcat�ı�׼�������������ݵģ������ݾ����ַ���'main'���������������cat��������ı�׼�����ж���Ҫ��������ݡ�

**��ʵ������linux�������кܶ�������������ȴ������в����л�ȡ������Ȼ��ӱ�׼�����ж�ȡ**

��ӳ�ڳ����ϣ������в�����ͨ��main���� `int main(int argc,char*argv[])` �ĺ���������õģ�����׼��������ͨ����׼���뺯������C�����е�scanf��ȡ���ġ����ǻ�ȡ�ĵط��ǲ�һ���ġ�

(ע:��׼��������һ���������ģ����������ڳ�����ʹ��scanf�����ӱ�׼�����ж�ȡһ����ʵ�����Ǵӱ�׼����Ļ������ж�ȡ��)

�����������һ������  -  ���ֱ������������ָ�� -  ���ʾ�ӱ�׼�����ж�ȡ


a.txt 
    i love you
echo "love" | grep "love"  a.txt -
echo "love" | grep "love" - a.txt

���
a.txt:love
(standard input):love

(standard input):love
a.txt:love

��ʱgrep��ͬʱ�����׼������ļ�test.cpp�е����ݣ�Ҳ����˵���ڱ�׼���������� 'main' Ҳ�����ļ� test.cpp (���ļ�����grep�����в����л��)������ 'main'��
Ҳ����˵���������� test.cpp �� - ��������ͬʱ���ڵ�ʱ�򣬲�ͬ�ĳ�����ͬ��
���ǿ�����cat��grep����Ͳ�ͬ��
������һ����һ���ģ�
�������������в���Ҫ��������ݵ���Դ(�Ǵ��ļ����Ǵӱ�׼���룬���Ƕ���)��**��������������Ҳ�����Ҫ��������ݵ���Դ��صĲ���** ��Ĭ�ϴӱ�׼�����ж�ȡҪ�����������

����ܶ������ **�������׼����** �ģ����� kill , rm ��Щ�������**�����в�����û��ָ��Ҫ����������򲻻�Ĭ�ϴӱ�׼�����ж�ȡ**�����ԣ�
echo '516' | kill
���������ǲ���ִ�еġ�

echo 'test' | rm -f
����Ҳ��û��Ч���ġ�

����������ֻ���������в�����ָ���Ĵ������ݣ����ӱ�׼�����л�ȡ�������ݡ�


xargs

���Կ��� echo '--help' | cat   �������������echo�����ݣ�Ҳ����˵��echo�����ݵ���cat������ļ������ˣ�ʵ���Ͼ���echo��������ͨ���ܵ�����cat�������ˡ�Ȼ��cat�����׼�����ж�ȡ��������ı����ݡ���ȼ�����test.txt�ļ�����һ���ַ� '--help' Ȼ������  cat test.txt ��Ч����

�� echo '--help' | xargs cat �ȼ��� cat --help ʲô��˼�أ�����xargs������ܵ��ַ��� --help ����cat��һ���������������cat���ͬ��  echo 'test.c test.cpp' | xargs cat �ȼ��� cat test.c test.cpp ��ʱ�Ὣtest.c��test.cpp�����ݶ���ʾ������

**xargs ���Խ��ܵ����׼���루stdin������ת���������в���**












