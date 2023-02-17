# PDO

PHP Data Object
扩展类库

## 安装

查看 php 配置文件信息

    php --ini

1. 编辑配置文件

    extension=pdo_mysql // 默认开启的

2. 重启 apache

3. 验证

## 构造函数

    ```
    PDO::__construct

    public PDO::__construct(
        string $dsn,                    // 数据源名称或叫做 DSN(Data Source Name)，包含了请求连接到数据库的信息。
        ?string $username = null,
        ?string $password = null,
        ?array $options = null          // 一个具体驱动的连接选项的键=>值数组
    )

    ---

    $dsn = 'mysql:dbname=testdb;host=127.0.0.1';
    $user = 'dbuser';
    $password = 'dbpass';
    $pdo = new PDO($dsn, $user, $password);
    $dbh->exec('set names utf8'); 或者 $dbh->query('set names utf8'); // 在实际开发中不写，程序员确保一致

    PDO::ATTR_ERRMODE
        PDO::ERRMODE_SILENT
        PDO::ERRMODE_WARNING
        PDO::ERRMODE_EXCEPTION

    PDO::ATTR_AUTOCOMMIT
        0 关闭自动提交
        1 开启自动提交

    PDO::ATTR_DEFAULT_FETCH_MODE
        PDO::FETCH_ASSOC
        PDO::FETCH_NUM
        PDO::FETCH_BOTH
        PDO::FETCH_OBJ
    ```

    $pdo->exec()    // 执行有影响行数的语句
    $pdo->query()   // 执行有结果集的语句

## PDOStatement PDO预处理

代表一条预处理语句，并在该语句被执行后代表一个相关的结果集  。
更安全

## PDOException 异常类

## mysql

[format函数](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_format)

    format(round(rand()*10+10),0)

    Formats the number X to a format like '#,###,###.##', rounded to D decimal
    places, and returns the result as a string. If D is 0, the result has no
    decimal point or fractional part. If X or D is NULL, the function returns
    NULL.

