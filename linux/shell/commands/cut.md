
## cut 截取列

remove sections from each line of files

-d, --delimiter=DELIM
    use DELIM instead of TAB for field delimiter

-f, --fields=LIST
    select only these fields;  also print any line that con‐
    tains no delimiter character, unless the  -s  option  is
    specified

cut -d: -f1 /etc/passwd
cut -d: -f1,7 /etc/passwd   和

它不能改变显示的顺序，-f 3,1,5  顺序还是 1， 3， 5


-c, --characters=LIST
    select only these characters

    cut -c1-5 /etc/passwd
    cut -c10- /etc/passwd
