# shell

```
\< ����
\> ��β
\b �ȿ��Ա�ʾ���ף�Ҳ���Ա�ʾ��β
```

Ĭ��̰��

[^.] ���ˡ�.��

[:alpha:]

����ƥ�� \1 ������ǵ�һ����ƥ�䣬������������ʽ
(exp) ��exp)  \1  \2

:%s/xyz/&er/g
    & ����xyz, ��������

\b([0-9]{1,3}\.){3}[0-9]{1,3}\b

\b Ӧ���Ǻ�vim���ڵ��ʵĶ�����һ���ģ�
    

### .sh�ļ��Զ����ע�ͣ��ļ�ͷ

```
autocmd BufNewFile *.sh exec ":call setTitle()"

function setTitle()
    if expand("%:e") == 'sh'
    call setline(1,"#!/bin/bash")
    call setline(2,"#")
    call setline(3,"#*********************************")
    call setline(4,"#Author:                BillScofield")
    call setline(5,"#DATE:                  ".strftime("%Y-%m-%d"))
    call setline(6,"#FILENAME:              ".expand("%"))
    call setline(7,"#*********************************")
    call setline(8,"")
    endif
endfunc
```

## �ű��еĴ���
1. syntax error ������ִֹͣ��
1. command not found  ����Ӱ������������ִ��
    1. �����Ĳ������ܾ��Ǵ����

1. ������
    1. �﷨����    bash -n a.sh

1. �ű���ִ�й��̣�ÿһ����������������������£���
    1. bash -x a.sh
    1. + һ���ӺŴ���������
    1. ++ �����ӺŴ����ٽ�һ������

## bash
1. -i  interactive
1. -r  restricted shell
1. --  any arguments after -- are treated as filenames and arguments. - is equal to --



## ����    

= ���Ҳ����пո�

name="BILL"

����������ŵ�ʱ��Ҫ����˫���ţ�����Ƕ�����˫����

```
������� ``
```

### ˫���ű�����ʽ
name=`cat /etc/fstab`
echo $name  //û�л��еĸ�ʽ
echo "$name"    // /etc/fstab ����ʲô��ʽ�Ͱ���ʲô��ʽ���, ������ʽ

### ���ڸ�ֵ
���¸�ֵ  ��������һ���ռ�ţ�ԭ���Ļ���

name1=1
name2=2
name3=3

name4=$name1
name1=11

echo $name1 ����1

### ��������
������

i=100 ���������ַ���

**��֧�ָ�����**

������
    1. �շ�������
    1. ��ĸ�����֡��»���
    ������,ע��Ҫͳһ

#### ��������
1. �ֲ���������׼��������ͨ����
    1. ֻ�ڵ�ǰsession����Ч
    1. �ӽ���Ҳ����ʹ�ø����̵ı���
    1. �������ϴ��ݣ�Ҳ�������´���

1. ȫ�ֱ���
    1. bash �Ǻ�ִ̨��
    1. ȫ�ֱ�������
        export name="Xian"

        ����

        name="xian"
        export name

        ���֮ǰ�����˾ֲ�����a,export a ���Խ�������Ϊȫ�ֱ���
    1. �������´���
        1. �ӽ��̿��Ըģ����ǲ������ϴ���
    
    1. declare -x Ҳ��������ȫ�ֱ���

    **�Ӳ���˫���ŵ�ԭ����������ܷ�ʶ����**

    set ������ʾ���б�������һЩ����

1. �����л�������
    1. env
    1. printenv
    1. export
    1. declare -x

1. ������ɾ��
    1. unset name

1. ϵͳ���ñ���

1. �Զ������


${name}
$name


lscpu
/proc/meminfo
lsblk   Ӳ�̴�С
`date +%F`

echo -e "\e[031;31m����\e[0m"
    -e : enable interpretation of backslash escapes

1. bash Ƕ��
    1. echo $$  //��ǰ���̵Ľ��̱��
    1. echo $PPID   //�����̵Ľ��̱��
    1. pstree  ֱ�۵Ŀ����̱��
        1. pstree -p


SHLVL   ��ǰshell ��ȣ���һ��Ϊ1

`$_`  ǰһ����������һ������

ֻ��������������
readonly name="bcd"
declare -r
    Ҳ����unset,�˳���û���ˣ����̵���������

��ʾ���г���
    1. declare -r 
        UID
        ������
    1. readonly -p
    
### С����
umask 026;touch /data/f1    640
umask 026;touch /data/f2    640

(umask 026;touch /data/f1)  ������һ�Σ�**һ����**
    ()  ��������shell ,subshell

(cd /data;rm -rf /data/)    ��ҵ��ɺ��ֻص�֮ǰ��shell

x=1;echo "pid=$$";(echo "subpid=$$";echo "subx=$x";x=2;echo "subx2=$x");echo x=$x

**С��������subshell ����ͨ�� subshell ��ͬ**
    1. ���Ľ���ID �͸�����IDһ��
    1. �����̵ı���������shell����
    
    ��ͬ��
        1. �������ϴ���



### ������
{;} //���һ���������зֺŵ�
{name="aaa";echo $name;}
�����ڱ�shell��ִ�У���������ѧ�����е����ȼ���


### λ�ñ���
1. $1 $2 $3 

baskup.sh a b c
$1 ����a
$2 ����b
$3 ����c
...

1. $#   ��������
1. $0   �ű����ƣ�����·�����֣� 
    1. ������ �Ļ���ʾ �����ӵ�����
1. $@   ���в���,**ÿ������Ϊ�����ַ���**
1. `$*` ���ݸ��ű������в�����**ȫ��������Ϊһ���ַ���**



```
a.sh
echo "----------"
echo 1st is $1
echo 2st is $2
echo 3st is $3
echo 10st is ${10}      �������Ϊ��$1+0   
echo "���в��� $@"
echo "�������� $#"
echo "�ļ��� $0"

**echo "�ļ��� `basename $0`"**    ȥ��·�� 
    `basename $0`


a.sh one two three four

```

С����

```
a.sh

echo "start to copy..."
scp $1 wang@192.168.1.2:/home/wang/work/
echo "copy finished!!!"

��ǿ�汾���±ߣ�$* ���ƶ���ļ�
scp $* wang@192.168.1.2:/home/wang/work/
�ܲ��ܻ���$@��???
```

```
$* $@ ������

a.sh
echo "a.sh:all arg are $*"
./b.sh "$*"  //$* ���в�����Ϊһ�������ַ���,�������˫���Ų���һ������
# ./b.sh "$@"   //$@ ÿ��������Ϊһ���������ַ���


b.sh
echo "b.sh:1st arg is $1"




```

**set-- �������λ�ñ���**


```
a.sh
echo $0

link -s a.sh link.sh
./link.sh   ���link.sh

```

whereis pidof
**$0 ��һ������ͨ��������������ӹ��ܲ�һ��**
pidof ֱ������ �� ����Դ�ļ� �����һ�� //��$1



shift ����   �ѵ�һ���Ƴ�ȥ
```
a.sh
echo $1
echo $2
echo $3
shift


echo $1
echo $2
echo $3
shift


echo $1
echo $2
echo $3


���123 23  3

shift Ĭ����1λ
shift 2


#!/bin/bash
while [ $# != 0 ];do
echo "��һ������Ϊ��$1,��������Ϊ��$#"
shift
done
```

**$? =0 ��ʾǰһ������ִ�гɹ�**
    ǰһ�������ִ�н��״̬

    ���ڽű����ԣ�Ҳ��ǰһ������Ľ��״̬

    **һ���ű����صĽ�������һ�����������**

    **���Ƿ����﷨���������**


**�˳�״̬��**
    exit    
    exit 10





## hash
1. ���
    1. linuxϵͳ�»���һ��hash������տ���ʱ���hash��Ϊ�գ�ÿ����ִ�й�һ������ʱ��hash����¼�����������·�������൱�ڻ���һ����

    1. ��һ��ִ������shell������Ĭ�ϵĻ��PATH·����Ѱ�Ҹ������·��������ڶ���ʹ�ø�����ʱ��shell���������Ȼ�鿴hash��û�и�����Ż�ȥPATH·����Ѱ�ҡ�
    1. hash������ã�
        1. ����������ĵ������ʡ�

1. ����
    1. help hash
    1.  hash -l             //--long
        1. �鿴hash���е�����

    1. hash -p /bin/ls bb
        1. ��ls��������д��һ�飬����Ϊbb

    1. hash -t ls����//-t�������Բ鿴hash���������·��
        1. hash����û�м�¼�������Ļ�������not found

    1. hash -r
        1. ���hash��
    1. hash -d bb
        1. ���ĳһ��



## ��������
x=10
y=20

$x+$y ���10+20


let $x+$y
    help let
    let:ר������������
        z=x+y
        z=$x+$y
    let x++

sum=$[x+y]
sum=$[$x+$y]
sum=$((x+y))

var=expr 1 + 2  //expr�����������Ҫ�пո�
var=expr 1 \* 2
var=$(expr 1 \* 2)


##  ��·
false && cmd2;cmd3
true || cmd2;cmd3

�����������ͷ

### XOR ���
0^1 -> 1
0^0 -> 0
1^1 -> 0
1^0 -> 0

declare -i x=10 //����Ϊ����








COLOR=$[RANDOM%7+31]




## to review

Զ������  xrdp
    https://blog.csdn.net/sinolover/article/details/78673625



unzip �÷�
    https://blog.csdn.net/qq_35399846/article/details/70168002



# ����
echo "!!!"  //! ��shell����ʲô�����ô���?

echo $UID
    $PWD

$0 Ҳ����������⣬bash �ĵ�һ������ ���ļ�����


## if ���

```
if ();then
    COMMAND
else
    COMMAND
fi



if 
then
    COMMAND
else
    COMMAND
fi




if 
then

elif
then

else

fi
```

-f  �ж��ļ��Ƿ����    if [ -f FILENAME ]
    
    ```
    FILE=/data/a.txt
    if [ ! -f $FILE ];then
        echo "">>$FILE
    else
        echo "exists"
    fi 
    ```

-d  �ж�Ŀ¼�Ƿ����    if [ -d DIR ]
    
    ```
    if [ ! -d /data/newyear ];then
        mkdir -p /data/newyear
    else
        echo "the Direction exists"
    fi
    ```

-eq ���ڣ����ڣ����ͱȽ�
    
    ```
    score=$1

    if [ -z $score ];then
        echo "please input"
        exit
    fi


    if [[ $score -gt 90 ]];then
        echo "very good"
    elif [[ $score -gt 60 ]];then
        echo "good"
    else
        echo "bad"
    fi

    ```
    ���ֱȽ��� [[]] , �ļ���Ŀ¼��[]??

-ne ������

-lt little than
-le little or equal
-gt greater than
-ge greater or equal

-a  and
-o  or
-z  ���ַ���

! ȡ��, Ҫ��һ���ո�

1. []
    Ҫ�пո�

1. ��bash�У�$( )��` `�������ţ����������������滻�ġ�
    �����滻������滻��࣬�����������������еģ������������������У�Ȼ�������滻��������������µ������С�

    ```
    echo today is $(date "+%Y-%m-%d")
    echo today is `date "+%Y-%m-%d"`
    ```

    $( )�ı׶��ǣ����������е���unixϵͳ��֧�����ַ�ʽ�����������ǿ϶�֧�ֵġ�

    echo Linux `echo Shell $(echo today is $(date "+%Y-%m-%d"))`
        ����Ƕ�׵�����£�����ʹ�÷����Ż��������, ���$()ͬʱʹ��Ҳ����������



1. һ������£�$var��${var}��û������ģ�������${ }��ȽϾ�ȷ�Ľ綨�������Ƶķ�Χ

    ```
    A=Linux
    echo ${A}B  //���LinuxB
    echo $AB    //��ʾ����AB
    ```


### MySQL ����

```
#!/bin/bash
# auto backup mysql db

# ����·��
BACK_DIR=/data/backup/`date +%F`

# �Ƿ���root�û�
if [ $UID -ne 0 ];then
    echo "must root"
fi

# ��������·��
if [ -d $BACK_DIR ];then
    mkdir -p $BACK_DIR
fi

# ����
MYSQL_DB=discuz
MYSQL_USER=backup
MYSQL_PW=1234
MYSQQL_CMD=/usr/bin/mysqldump

# ��������
$MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PW -d$MYSQL_DB > $BACK_DIR/$MYSQL_DB.sql

if [ $? -eq 0 ];then
    echo "success"
else
    echo -e "failed"
fi
```



## for
```
for ���� in �ַ���
    do
        ���
    done


for i in `seq 1 10`
    do 
        echo $i
    done


j=0
for ((i=1;i<=100;i++))
    do
       j = `expr $i + $j` 
    done




��������ļ�
for i in `find ./ -name "*.log"`
    do
        tar -zcvf $i.tar.gz $i//��������
    done


���������ļ�scp


    ```
    FIELS=$*
    for i in 
        do 
            scp -r $FILES root@192.168.1.1
    done
    ```


## ����shell
1. AIX �µ�Korn Shell, ��ksh
1. Solaris �µ� Bourne Shell, ��bsh
1. FreeBSD �µ�C Shell, ��csh
1. HP-UX �µ�POSIX Shell
1. Linux �µ�Bourne Again Shell, ��bash

cat /etc/shells


    ```
    find ./ -name a[b.]*
        ���Ϊʲô������?

    find ./ -name a[b.].*

    find ./ -name "a[b.]*"


    ��ǰĿ¼�� �� a.sh ab.sh
    ----

    a.txt ab.txt c.txt b.txt
    find ./ -name "[!a]*"
    find ./ -name "[! a]*"
        ��������Ԥ����ͬ
    find ./ -name "[ ! a ]*"

        ����������Ϊʲô��һ����?


    
    ```


    ��׼���+������� �ϲ���һ���ļ�

| tee �ļ�      T�͹ܵ�
    
## �ļ�ͨ���
*
?
[]
[�ַ�1,�ַ�2,�ַ�3]
[��ʼ�ַ�-�����ַ�]
[! �ַ�]

## ��������ض���� �� �ܵ���
1. <       ��׼�����ض���
1. >       ��׼����ض���
1. 2>      ��׼��������ض���
1. &>      ��׼����ϲ��ض���
1. >>      ��׼���׷���ض���
1. |       �ܵ�
1. | tee   T�͹ܵ�
    1. ��ǰһ�������**��׼���**����һ���ļ��У������ݸ���һ��������Ϊ��׼����
        �÷�:   ���� | tee �ļ� | ����



## ����ִ�п��Ʒ�
1. ;    ˳��ִ��
1. &&   �߼���
1. ||   �߼���
1. &    ��ִ̨��

## �����滻����
1. ""   
1. ''   ��ֹshell��������
1. ``   ��ִ������Ľ������ڱ�����

## Ԫ�ַ�
1. #        ע�ͷ���
1. $        ���������÷���
1. �ո�     �ָ����������ָ� ��������������ѡ��

## ת���
1. \



## ���������ļ�
ȫ�ֻ������������ļ���/etc/profile , /etc/bashrc
�û��������������ļ���~/.bash_profile , ~/.bashrc
��ȡ˳��
    1. /etc/profile         //ÿ���û��������
    1. ~/.bash_profile      //�����û���½ʱ������һ�Σ�

    1. ~/.bashrc            //���û���½ʱ��ÿ�δ���shellʱ�����ļ�����ȡ
    1. /etc/bashrc          //ÿ���û�����bash����ʱ�����ļ�����ȡ
