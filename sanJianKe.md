# Linux ������
## awk
    awk '{print}' a.txt ȫ����� ͬ cat a.txt
    
    ---

    awk '{print $1,$2,$3}' a.txt
        1�����ž��ǿո��������ž��Ǵ���
        �ֶ�д�Ŀո������õģ���html���ƣ�html�ô�����һ�����ã�awkһ����û��
        ,: ����ָ�����Ĭ���ǿո�
        "\t" 
        �ⲿ�����õ�����

    awk '{print $1"\t"$2}' a.txt

    ����ָ���
        -F " "
    ����ָ���
        Ĭ����",",���Ի����Լ���Ҫ��������ַ�
        awk '{print $1"-"$2}' 

    ---
    
    �ָ�����Ĭ�Ͽո�,��ʽ�����
        -F  //����ָ���
            1. -F:
            1. -F"add"
    
        {print $1,$NF} ��һ�к����һ��
            -F. {print $1":"$NF}  //��ʽ�������.��Ϊ�ָ���

        egrep --color "([0-9]{1,3}\.){3}[0-9]" b.txt | awk -F. '{print "Hello-"$1"-"$2"-"$3"-"$4"-keep-smile"}'

        egrep --color "([0-9]{1,3}\.){3}[0-9]"  a.txt | head -2

        egrep --color "([0-9]\.){1,3}[0-9]{1,3}" a.txt | tail -2 | awk -F. '{print $1"-"$2"-"$3"-"$4}'

    ---

    awk '{print $1,$2}'     //��д�ļ��������Ǵӱ�׼�����ȡ

### �ڲ�����

    NR number of record,��
        ��������ǰ�е��к�
        awk '{pritn NR "\t" $1 "\t" $2}' b.txt

    $0 һ����,ȫ����

    FNR file NR
        the input record number in the current input file.
        �����ļ���ʾ��ʱ��ÿ���ļ����кŶ��Ƕ����ģ�������ƴ����һ���

    NF number of field,��
        ��һ���м��У�Ҳ�������һ��
        awk '{print NF "\t" $0}' b.txt

        awk '{print $1}' �ļ�   ��ӡ�ļ��ĵ�һ�� ֻ���õ�����
        awk '{print $NF}' �ļ�   ��ӡ�ļ��ĵ�����һ��,�����
        awk '{print $(NF-1)}' �ļ�   ��ӡ�ļ��ĵ����ڶ���


    awk 'BEGIN{FS=","}{print NR "\t" $1,$2}' b.txt //����ȫ�ֱ���FS(����ʱ�ķָ���)Ϊ",",BEGIN����Ϊ��д
        {print $1,$2} ��","ΪĬ�����ʱ�ķָ���:�ո�

    FS  field separator
        the input field separator,a space by default.

    OFS(output field seperate)

        awk 'BEGIN{OFS=","}{print $1,$2}'    //","��������ָ������ָ���������Ϊ",",������Ĭ�ϵĿո�
    
        д������� ;
            awk 'BEGIN{FS="," ; OFS=","}{print $1,$2}'    //","��������ָ������ָ���������Ϊ",",������Ĭ�ϵĿո�

    FILENAME
        awk '{print NR "\t" $0}' a.txt b.txt    //�������ļ����� ƴ������
        awk '{print NR "\t" FILENAME "\t" $0}' a.txt b.txt  

    ����ĳһ�е�����

        awk '{$3="XXX";print NR "\t" $0}' a.txt
    
        �ϱߵ� awk 'BEGIN{OFS=","}{print $1,$2}' b.txt Ҳ����д��
               awk '{OFS=",";print $1,$2}' b.txt

        BEGIN�е�����Ҳ����д����{}��
        �ű��е�ÿ������ĩβ����д��";"

### �Զ������
    awk '{a=1;b=2;print a+b}'
    awk '{a="hello";b="world";print a b}'  //a b �ַ���ƴ��,������+,����; ����JavaScript������Number(),
        awk '{a="4";b="hello";print a+b}' �Ľ��Ϊ 4
        awk '{a="4";b="4hello";print a+b}' �Ľ��Ϊ 8

    awk '{a=1;b=2;c=3;print (a b)+3}'   //���Ϊ15
        ֧��

        ```
        +
        -
        *
        /
        %
        ```

### ����
    awk '/abc/{print $0}' b.txt
    ! ��ʾ��ƥ��
    awk '!/abc/{print $0}' b.txt

    �ҵĽ���������д�������У��ű�Ҳ��
        awk '(/^[a-z]{4}$/){print NR,$0}' a.txt

        �ű�
            (/^[a-z]{4}$/){print NR,$0}
    


### һ���÷�
awk [-F | -f | -v ] 'BEGIN {} //{command1;command2} END {}' file
-F  ָ������ָ���
-f  ���ýű�
-v  �������

pattern��ģʽ

awk '(NR>=3&&NR<=6){print NR,$0}' b.txt
awk '(NR!=6){print NR,$0}' b.txt
awk 'NR!=6{print NR,$0}' b.txt

����
    awk '{$3<10 ? USER="AAA":USER="BBB";print $1,USER}' /etc/passwd
    awk '{$3<10 ? USER="AAA":USER="BBB";}{print $1,USER}' /etc/passwd

    awk '{if($1>10){USER="OK"}else{USER="NO"}}{print $1,USER}' a.txt
        ����ط�ʲôʱ����{},ʲôʱ����()  ???

            if��䲻��ȫ�ֵ�����������������룬����Ӧ�÷���{}��
            awk '{if($1==1){USER="OK"}else{USER="NO"}  print NR,USER}' c.txt
    

    awk '$2==29{print $0}' b.txt            //��Ԫ������������ֵĻ����õ�Ԫ�����ݲ��ü�˫����
    awk '$1=="xian"{print $0}' b.txt        //��Ԫ��������Ƿ����ֵĻ����õ�Ԫ��������Ҫ��˫���ţ�������Ϊ�Ǳ���

    awk 'NR==3{print $0}' b.txt             //ֻ���������

    awk 'NF==5{print $0}' b.txt             //��һ�е�����==5�Ŵ�ӡ����

#### BEGIN �� END ���÷�

���ڶ�����д,��ű�
awk 'BEGIN{}'
awk ...
awk ...
...
awk 'END{}' file

#### ���ñ���
name=xian
awk '{print "'$name'"}' ͬ shell��echo $name

    �ű����������shell������?

#### ��ʽ�����
awk '{printf "%s\n,$1}' a.txt

%20s    �Ҷ��룬20���ַ�
%-20s   �����
    (�ֶγ���20���ַ�Ҳ����ضϵ�)


#### awk�ű�
test.awk
BEGIN{
    print "---------"
    FS=":"
}
$3==100 && $NF=="/sbin/nologin"{
    print NR"\t"$1"\t"$NF
}
END{
    print "---------"
}

awk -f test.awk a.txt

===>>>

awk -F":" 'BEGIN{print "-----"}($3=100 && $NF=="/sbin/nologin"){print NR"\t"$1"\t"$NF}END{print "----------"}'










## sed (Stream Editor) �б༭��
    �ű����޸�һ����sed,ƽ����vim

    sed 's/old/new/g' a.txt 
        -i �޸ĵ��ļ�,ò��Ĭ�����޸ĵ��ڴ�

-n  �����ģʽ�ռ����ݵ���Ļ�������Զ���ӡ
    sed '1p' a.txt
        ��һ�д�ӡ�����Σ�
        ÿһ�ж��ᱻsed����
        sed �ѵ�һ�з���ģʽ�ռ�???
    sed -n '1p' a.txt

-i  ����Ԥ��������Ӳ���ļ�
    -i.bak  ���ļ����б���,-i����ľ��Ǳ��ݵ��ļ����ļ�����׺
-e  ���༭

-r ����
    sed -r 's/\<root\>/rooter/gi' a.txt
        \< �� \> ������ʽ�ı߽�,����//

d   delete
    ɾ����
p
    print
a
    ������,��ָ������һ��
i
    ������,��ָ������һ��
c
    �滻ָ����
    sed '2chello' a.txt
    sed '2c\hello' a.txt
s   �滻
    sed '2,3s/root/roat/i'
    sed 's/root/roat/g'
~   ����
    sed '1~2p' a.txt //���1��3��5...


ģʽ�ռ䣨Pattern space��

�����ռ�















1. grep
    grep --color -n 'root' /etc/passwd 
        -n //�к�
        --color //ƥ���������ɫ
        -v "#"  //�������,ȡ��
        -v "^$" //ƥ��ǿ���

    -E = egrep //��չ��grep
        ipƥ������
        egrep --color "([0-9]\.){1,3}[0-9]{1,3}" a.txt
        

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












