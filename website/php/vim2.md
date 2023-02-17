# php

## 注释

```
1. 单行 //

2. 单行 #

3. 多行

    /* 
    
    */
```

变量**区分大小写**

### 可变变量

```
$name="bill";
$bill='hello world';
echo $name;
echo $$name;
```

### 变量的引用赋值

```
$name = 'hello';
$newname = $name;           // 普通变量赋值

$newname = &$name;          // 引用变量赋值

```

### 变量类型

var_dump($a)

基础数据类型
    int
        二进制: $numa = 0b1111;
    float
        不区分单双精度，都是双精度
        科学计数法
    string
        涵盖字符
        单双引号

            单引号,不解析变量, 但是可以转义字符和本身

            需要使用 pre 看效果
            
            echo "my name is {$name}!!!"
            
            字符串连接
                echo "Hello".$name;
            
            尽量简单的
        定界符
            $a = <<<liu
                xxx
            liu;
            
            会解析变量，转义字符
        var_dump 返回字节数

    boolean
        true/false
        不区分大小写: True/TRUE
        
        **echo 输出 true 为 1， false 输出空(没有输出)**

        flase:
            null
            0
            0.0

            ''
            '0'

            []          // 空数组
            object      // 对象都为真
            resource    // resource 都为真

        is_bool($a);

复合数据类型

    array

        $a = [1,2,3,4,5,"hello"];
        $a = array(1,2,'nihao',true);

    object(类)
        ```
        class Person{
            var $name = 'liujaio';
            var $gender = "boy";
            function say(){
                    echo "my name is $this->name, i am a $this->gender";
            }
        }
        $liujiao = new Person;
        $liujiao->say();
        ```

特殊数据类型

    resource

        php程序之外的任何东西
        $file = fopen("./top.html",'r');
        var_dump($file);

    null

        unset($a);
        isset($a);
            false:
                未定义
                null
                unset

    empty()
        0
        0.0
        false

        ''
        '0'

        []          // 空数据
        null

        对象和资源都不为空

### 类型转换

1. 获取类型
    
    gettype($a);
        float 的返回值是 double
        integet             is_integer()
        double              is_float() / is_double()
        string              is_string()
        boolean             is_boolean()

        array               is_array()
        null                is_null()
        resource            is_resource()
        object              is_object()


        is_scalar()         标量
        is_numeric()        包含 integer 和 float/double 还有**纯的数字字符串**

2. 自动类型转换

    仅作用于标量

    1. 数学运算

    2. 判断
        if($a > '110a'){
            echo "$a is bigger";
        }

    3. boolean
        true:1
        false:0

3. 强制类型转换

    1. 语言结构
        $a = 123;
        $b = (string)$a;
        (object)
        
        (resource)          错误, 不能转换
        (null)              错误, 不能转换

    2. 相应的函数
        
        strval()
        intval()
        floatval()

        settype($a,float);  返回成功与否, 
            settype($a,boolean);

            resource 依然不可以

    3. 通用


### 常量

不能使用变量提示符

两种声明方式

尽量大写

7.3 之后的值可以是除了对象类型之外的任意类型，之前的只能是标量

1. define

    define('xxx', 'zhangsan');      // 7.3 之前有第三个参数，不区分大小写，默认为 false
    echo xxx;

    一般在页面中用这个


2. const

    const NAME = "ABC";

    一般在类中声明


3. 系统魔术常量

    __FILE__        当前文件的绝对路径文件名
    __LINE__        当前行
    __FUNCTION__    当前函数名
    __CLASS__       当前类名
    __METHOD__      当前方法, 输出如 Person::say

    constant(常量); 获取常量值
    constant($a);   获取常量值      //!!!
        ```
        const NAME = "Liu Jiao";
        echo NAME;                  // Liu Jiao
        
        $a = 'NAME';
        echo $a."\n";               // NAME
        
        $b = constant($a);
        echo $b;                    // Liu Jiao
        ```

    get_defined_constants()     // 页面中所有的常量的数组

        M_PI    圆周率

    defined(XXX)                // 是否定义了 XXX 这个常量

### 运算符

1. 算数运算符
    +
    -
    x
    /
    %
    ++
    --

    {} 不能在这用, 只能用于字符串中

    ++ 和 -- 对 boolean 无效，true 还是1
    ++ 和 -- 对 null 无效

2. 字符串运算发

    .

3. 赋值运算符
    
    =
    +=
    -=
    x=
    /=
    %=
    

4. 比较运算符
    ==          // '2' == 2;    true        "a" == True  true
    ===         // '2' === 2;   false
    !=
    !==

    <=>         // a-b>0 ? 1 : -1

    >
    >=
    <
    <=

5. 逻辑运算符
    
    &&

    ||

    !

    xor     // 异或, 如果 $x 和 $y 有且仅有一个为 true，则返回 true。 不是位运算的 xor

    and or not 的优先级比较低

6. 位运算

    1. &

    2. | 

    3. ^(异或)

    4. >> 

    5. <<

    6. ~(按位非)

7. 错误抑制符

    echo @$name;

8. 三元运算符

    条件 ? expression1 : expression2

    $name = isset($name) ? $name : 'mingzi';

9. null

    null 合并运算

    $result = $gender??'girl';

    如果设置了 $gender 就赋值 result 为 $gender, 否则赋值 result 'girl'

    $age ??= 20;

    如果没有设置 $age, 则赋值 20

    $res = $a ?? $b ?? $c ?? $d ?? "final value";


10. 反引号

    执行系统命令

    var_dump(`ls -l`);




### 流程控制

1. 循环


2. 分支

    else if 可以写成 elseif

---

    switch($score){
    case 100:                   // 这里竟然还可以写分号!!!
        echo "100";break;
    default:
        echo "no";
    }

---

mt_rand(1,100)              // [1,100] 随机数

3. 其他语句
    
    1. break
        break 1; 退出一层循环
        break 2; 退出两层循环

    2. continue
        continue 1;
        continue 2;

    3. goto
        同一个文件，
        同一个类
        同一个函数

        ```
        label:
            echo "hello";
        goto label;
        ```

### 未看

https://www.bilibili.com/video/BV1Yt4y1Y7vF?p=20&spm_id_from=333.880.my_history.page.click

20 21 22 23 24 25

### 数组

$name['a'] = 'A';
$name['b'] = 'B';

$name = array('zhangsan','boy',30);     // 索引数组
$name = array('name'=>'zhangsan','gender'=>'boy','age'=>30);    // 关联数组
$name = array(1=>'zhangsan',2=>'boy',3=>30);
$name = array('zhangsan','gender'=>'boy',3=>30);        // 混合数组

---

$arr = ['zhangsan','lisi','wangwu'];
$arr = ['name1'=>'zhangsan','name2'=>'lisi','name3'=>'wangwu'];
$arr = ['zhangsan','name2'=>'lisi',5=>'wangwu'];

---

$arr[] = 'a';
$arr[] = 'b';
$arr[] = 'c';
$arr[] = 'd';
$arr[] = 'e';

---

$arr['a'] = 'a';
$arr['b'] = 'b';
$arr['c'] = 'c';
$arr['d'] = 'd';
$arr['e'] = 'e';


//格式1
foreach (array_expression as $value){
    statement
}

//格式2
foreach (array_expression as $key => $value){
    statement
}

#### 数组的操作

1. 增


2. 删
    unset($name[0]);

    然后添加元素下标同mysql

    删除数组
        unset($arr);

    清空
        $arr = [];
        $arr = array();

3. 改

4. 查


var_dump($arr);     // 会输出类型信息
print_r($arr);      // 不会输出类型信息
不可以用 echo 直接输出




#### 数组的遍历

数组长度函数: count()
    count($arr);

1. 一维索引数组



2. 二纬数组


#### 超全局数组

```
$_GET

$_POST

$_REQUEST
    $_GET + $_POST

$_SERVER

$_SESSION

$_COOKIE
```



#### 分页

array_slice($arr,offset:0,length:3,preserve_keys:true);

    ``` 分页程序
    <?php

    $arr = array(
        array('id'=>1,'name'=>'1zhangsan','gender'=>1,'age'=>23),
        array('id'=>2,'name'=>'2lisi','gender'=>1,'age'=>24),
        array('id'=>3,'name'=>'3alice','gender'=>0,'age'=>21),
        array('id'=>4,'name'=>'4boy','gender'=>1,'age'=>21),
        array('id'=>5,'name'=>'5juce','gender'=>0,'age'=>25),
        array('id'=>6,'name'=>'6tom','gender'=>1,'age'=>22),
        array('id'=>7,'name'=>'7bill','gender'=>1,'age'=>24),
        array('id'=>8,'name'=>'8tomy','gender'=>1,'age'=>24),
        array('id'=>9,'name'=>'9wood','gender'=>1,'age'=>24),
        array('id'=>10,'name'=>'10dragon','gender'=>1,'age'=>25),
        array('id'=>11,'name'=>'11liming','gender'=>1,'age'=>20),
        array('id'=>12,'name'=>'12helo','gender'=>0,'age'=>27),
        array('id'=>13,'name'=>'13will','gender'=>1,'age'=>23),
    );

    # 起始点, 长度
    # 起始点 = 第n页 * 每页个数
    # 每页个数 = 总个数 / 要分几页, 手动指定为3
    # 第n页：(n-1) * 3
    echo '<form>';
    echo 'nth: <input type="text" name="nth">';
    echo '<input type="submit">';
    echo '</form>';

    $nth = $_GET['nth']-1;

    echo '<hr/>';
    echo $nth;
    echo '<hr/>';


    $new = array_slice($arr,$nth * 3,3,true);

    echo '<pre>';
    #var_dump($new);
    print_r($new);
    echo '</pre>';

    echo '<table border="1" width="900">';
    for($i = $nth*3; $i < $nth*3+3; $i++){
        echo '<tr>';
        foreach($new[$i] as $key=>$val){
            echo '<td>'.$val.'</td>';
        }
        echo '</tr>';
    }

    echo '</table>';
    ```

#### 系统预定义变量

```
$_GET
$_POST
$_SERVER        服务器和运行环境信息
$_COOKIE
$_SESSION
    ["HTTP_REFERER"]=> string(24) "http://10.0.6.218/a.html"        // 从那个页面跳转到当前页面的
$GLOBALS
$_ENV
```

    由于$_ENV变量是取决于服务器的环境变量的，从不同的服务器上获取的$_ENV变量打
    印出的结果可能是完全不同的。所以无法像$_SERVER 那样列出完整的列表。以下是
    $_ENV 数组包含的比较通用的元素：

    有时候，$_ENV会为空，其原因通常是php的配置文件php.ini的配置项为：
    variables_order = "GPCS"。要想让$_ENV的值不为空，那么variables_order的值应
    该加上一个大写字母“E”，即：variables_order = "EGPCS"。

    上述配置表示了PHP接受的外部变量来源及顺序，EGPCS是Environment、Get、Post、
    Cookies、Server的缩写。如果variables_order 的配置中缺少E ，则PHP 无法接受环
    境变量，那么$_ENV 也就为空了。

    由于开启$_ENV，即variables_order = "EGPCS"会导致一些性能损失，按php官方的说
    法是，在生产环境中，不推荐使用。他们更推荐使用getenv(string $varname)函数来
    获取Environment中的值

```php
<form action="./index.php?age=32" method="post">   还可以这么玩耍, 同时传 get 和 post
    age: <input type="text" name="age">'¬
    <input type="submit">¬
</form>¬

<?php
    var_dump($_GET);
    echo '<br/>';
    var_dump($_POST);
```


## 错误处理

notice 和 warning 会后续执行

错误抑制 @
    @var_dump(a);
    屏蔽不了致命错误

不显示错误信息
    php.ini
    display_errors = Off

错误信息写道日志
    php.ini
    error_log
    ;error_log = php_errors.log         默认是注释的


## 函数

**函数名不区分大小写**，不能重复定义

function say(){

}


return 语句

#### 全局变量

1. 要在函数内部声明

    ```
    $name = "zhangsan";

    function say(){
        global $name;       // 不能在此赋值，可以在下一行进行赋值
        $name = "zhangsan"  // 外部的也会变
        echo $name;
    }
    ```

2. GLOBALS 数组

    ```
    function say(){
        echo $GLOBALS['name'];          // 外部的也会变
    }
    ``` 

#### 静态变量

可以统计被调用的次数

$num=1;
```
function say(){
    static $num = 1;
    $num ++;
    echo $num;
}
```

和全局变量不冲突


#### 引用传参

function say(&$num){

}


array_pop($arr)     也是引用传参

#### 变量函数

```
$num = 1;

function say(){
    echo "hello<br/>";
    
}

$a = 'say';

$a();

---

if($_GET['operator']){
    $_GET['operator']($_GET['num1'],$_GET['num2']);
}

```

#### 回调函数

变量函数的一种变形

```
function say($func){
    $func();
    
}

function say1(){
    echo 'This is'.__FUNCTION__.'<br/>';
    
}

function say2(){
    echo 'This is'.__FUNCTION__.'<br/>';
    
}


say('say1');                    // 要用引号括起来
say('say2');                    // 要用引号括起来

```

array_filter()                  // 返回为 true 的
array_filter($arr,$my_func)     // 返回为 true 的


    ``` 自实现
    $arr = array("hello",1,2,3,0.01,0.0,2,0.0,true,999,false,9);

#$res = array_filter($arr);

    function say($arr,$func=''){
        $myarr=[];
        if(empty($func)){
            foreach($arr as $key=>$value){
                if($value){
                    $myarr[$key] = $value;
                }
            }
        }
        return $myarr;
    }

    $res = say($arr);

    echo '<pre>';
    print_r($res);

    echo '</pre>';

    ```

#### 内部函数(函数内部的函数)

在函数内部定义函数

```
function outer(){
    function inner(){
        echo "say";
    }
    inner();
}

outer();
```


#### 递归函数


#### 匿名函数

```
$a = function (){
    echo "hello anonymous";
    
};                              // 这里有分号

$a();

var_dump($a);                   // 是 object 类型

```



#### 闭包

```
function say(){
    $name = 'say';
    $anon = function() use($name){                  // 用什么要写在 use 里边, 只能用匿名的形式，正常方式是不可以的, **只读的**
        echo "I am anon ".$name."<br/>";
    };

    return $anon;
}

$a = say();
$a();


---

function say(){
    $name = 'say';
#$anon = function() use($name){
    echo $name.'<br/>';
    $anon = function() use($name){
            $name = "woshi bibao";
                    echo "I am anon ".$name."<br/>";
                        
    };


        return $anon;
        
}

$a = say();         // 输出 say
$a();

$b = say();         // 同样输出 say
$b();
}
```


#### 匿名回调

#### 可变长度参数

array_push()

func_get_args() 获取传入的所有实参

```
function sum(){
$arr = func_get_args();

    echo '<pre>';
    print_r($arr);
    echo '</pre>';
}

$res = sum(1,2,3,4,'a','b');

```

#### 系统函数

1. & 表示只能传变量，不能传数值

2. mixed 可以传任何类型的数据变量或值

3. [] 里的是可选的

4. callable 参数的函数，表示这个位置需要穿第一个回调函数

5. ... 表示可以传多个


### 文件包含


include()
    成功返回 1
    效率高(相比较 include_once)

include_once()
    第一次成功返回1， 之后成功返回 true
    

```
$res = include('./a.php');      // 

require("./top.html");

$top = require("./top.html");
```


require
    $one = require('./top.html');
    $two = require './top.html';        // 另外一种写法

require_once

    返回和 include / include_one 一样, 第一次返回1， 第二次返回 true


包含失败的话， include 报 warning 错，require 会报 fatal 错


### 常用系统函数




### 分页函数

```

```


### 时间

时间戳

    1970年1月1日 0:00:00(格林威治时间)

    1970年1月1日 8:00:00(北京时间)

    date('Y m d H:i:s',time())

    date('Y m d')

        Y  4位的

    date_default_timezone_set('PRC');

    php.ini
        date.timezone = "Asia/Shanghai"
        date.timezone = "UTC"
        date.timezone = "PRC"


### 数据库

php -m | grep mysqli

mysql  扩展

mysqli (增强扩展)

    mysql5.3 之后的版本默认开启 mysqli 扩展

php7 之后是 mysqli, 之前是 mysql

1. 链接数据库

    mysqli_connect(host,username,password,dbname,port,socket);   均可选

        host: 如果不执行 mysql_secure_installation 好像不能使用 localhost, 只能
        使用 127.0.0.1, 否则报: No such file or directory错误

        https://www.bbsmax.com/A/xl56yam0Jr/

    $link=@mysqli_connect('host','user','pass','dbname');

    mysqli_connect('host','user','pass');

    mysqli_connect_errno()

        返回最后一次连接调用的错误代码

        0 是正确无误

    mysqli_connect_error()

        返回最后一次连接调用的错误描述

2. 判断是否连接成功

    if(!$link)


3. 设置默认客户端字符集

    mysqli_set_charset($link,'utf8mb4');

4. 选择数据库

    mysqli_select_db($link,'dbname')


5. 准备 sql 语句

    $sql = "select "

6. mysqli_real_escape_string() 

    转义字符串中的特殊字符

    mysqli_real_escape_string(connection,escapestring);
        
        要转义的字符串。编码的字符是 NUL（ASCII 0）、\n、\r、\、'、" 和 Control-Z。"'

        ```
        $newname="菜鸟'教程";

        // 没有转义 $newname 中特殊字符，执行失败
        mysqli_query($con,"INSERT into websites2 (name) VALUES ('$newname')");

        // 转义特殊字符
        $newpers=mysqli_real_escape_string($con,$newname);

        // 转义后插入，执行成功
        mysqli_query($con,"INSERT into websites2 (name) VALUES ('$newpers')");
        ```

6. 发送 sql 语句

    $res = mysqli_query($link,$sql);        // object

    mysqli_query(connection,query,resultmode);

        MYSQLI_USE_RESULT（如果需要检索大量数据，请使用这个）, 结果还在服务器

        MYSQLI_STORE_RESULT（默认）

    [
    mysqli_real_query($link,$sql)

        有结果就返回true, 否则返回 false

    mysqli_store_result($link)  // 返回的当前的结果集。
    ]

7. 执行多条语句

    mysqli_multi_query(connection,query);
        query 规定一个或多个查询，用分号进行分隔。
        如果第一个查询失败则返回 FALSE
        第二条之后的不影响返回值


8. 处理结果集
    
    1. $result = mysqli_fetch_assoc($link);    // 只取一条数据的关联数组

        while($row = mysqli_fetch_assoc($link)){
        }

        列名为 key

    2. mysqli_fetch_row($res)                  // 返回一条索引数组
        0 => 这条数据的第1列
        1 => 这条数据的第2列

        while()

    3. mysqli_fetch_array($res)                // 返回索引和关联数据的结合体
        0 => 这条数据的第1列
        id => 这条数据的第1列
        1 => 这条数据的第2列
        name => 这条数据的第2列

            MYSQLI_ASSOC
            MYSQLI_NUM
            MYSQLI_BOTH

    4. mysqli_fetch_all()                       // 从结果集中取得所有行作为关联数组，或数字数组，或二者兼有。

        mysqli_fetch_all(result,resulttype);
            MYSQLI_ASSOC
            MYSQLI_NUM
            MYSQLI_BOTH

    5. mysqli_num_rows($res)                    // 返回结果集中行的数量
        如果是 MYSQLI_USE_RESULT, 需要全部获取完毕后才不会报错

    5. mysqli_affected_rows($link)              // 返回前一次 MySQL 操作所影响的记录行数

    6. mysqli_insert_id($link)                  // 返回最后一个查询中自动生成的 ID

    7. mysqli_free_result()                     // 释放结果内存。

        mysqli_free_result(result);


9. 关闭数据库

    mysqli_close($link);



预处理语句

    1. $query = 'insert into t1(id,info) values(?,?)';          // ? 是占位符
    2. $stmt = mysqli_prepare($link,$query);                    // statement 声明
    3. mysqli_stmt_bind_param($stmt,'is',$val1,$val2);
        i: int
        s: string
        d: double / float
        b: 二进制数据
    4. 执行
        $val1=1;
        $val2='ok'
        mysqli_stmt_execute($stmt);

    5. 从一个prerpared语句中抓取结果到指定变量中
        bool mysqli_stmt_bind_result ( mysqli_stmt $stmt , mixed &$var1 [, mixed &$... ]  )     // 引用赋值, 所以不用外边定义
            var1 要绑定的变量。

    6. mysqli_stmt_fetch($stmt)
        然后就可以 echo $var1, $var2
        函数在获取数据时返回 TRUE，如果出现错误则返回 FALSE，如果结果中没有更多行则返回 NULL。
        fetch 一条
        while(mysqli_stmt_fetch($stmt)){
            echo $var1
        }



##

```
session_start();
$_SESSION['username'] = 'zhangsan';

unset($_SESSION['username'])

session_destroy()           // 单单 session_destroy 后还是可以访问 session 的

```

## 画图 gd

phpinfo()
    有 gd 则表示打开

    php.ini             // 默认关闭的
        ;extension=gd2  // 报错, /usr/local/php749/lib/php/extensions/ 没有这个文件

mime
    windows 服务器中有个 mime.types 的文件, 但是 debian 中没有


1. 创建画布

    imagecreatetruecolor(int $width, int $height)

    $image = imagecreatecolor(600,600);

2. 创建颜色

    imagecolorallocate(resource $image,int $red, int $green, int $blue)

    imagecolorallocate($image,255,0.0)

3. 使用 gd 库画画

    imageline($im,0,0,600,600,$text_color);
    imagestring($im, 1, 5, 5,  "A String", $text_color);

4. 告诉浏览器 mime 类型

    header("content-type:image/png");

5. 输出到浏览器或者可以存放到本地

    imagepng($im);
    imagejpeg
    imagegif
    imagewbmp

6. 销毁资源

    imagedestroy($im);


获取文件信息

    $arr = getimagesize("./a.jpg");
    list($width,$height) = $arr;
    echo $width,$height;


合并

    $dst = imagecreatefromjpeg('./a.jpg')
    $src = imagecreatefromjpeg('./b.jpg')

    imagecopyresampled($dst,$src, )
    header('content-type:image/jpeg')
    imagejpeg($im);


### 验证码

    ```
    function verify($width = 100, $height = 40, $num = 5, $style = 1){
        #1. 准备画布
        $im = imagecreatetruecolor($width, $height);

        #2. 颜色

        #3. 字符
        switch($type){
            case 1:
                $str = '01234567890';
                $string = substr(str_shuffle($str),0,$num);
                break;
            case 2:
                $arr = range('a','z');
                shuffle($arr)
                $tmp = array_slice($arr,0,$num);
                $string = join('',$tmp);
                break;
            case 3:
                // 0-9 a-z A-Z
                $str = '0123...abc...A...Z';
                $string = substr(str_shuffle($str),0,$num);
                break;
        }

        imagefilledrectangle($image,0,0,$width,$height,lightcolor($image));
        
        #4. 写字
        for($i = 0; $i < $num; $i++){
            $x = floor($width / $num) * $i;
            $y = mt_rand(10,$height - 20);
            imagechar($image, 5, $x, $y, $string[$i],darkColor($iamge));
        }

        #5. 干扰线
        for($i = 0; $i<$num; $i++){
            imagearc($image,mt_rand(10,$width),mt_rand(10,$hieght), mt_rand(10,$width), mt_rand(10,$height), mt_rand(0,10), mt_rand(0,270), darkColor($image))
        }


        for($i = 0; $i<$num; $i++){
            imagesetpixel($image, mt_rand(0,$widht), mt_rand(0,$height), darkColor($image));
        }


        #6. 输出的类型
        header('content-type:image/png')

        #7. 输出图片


        #8. 
    }

    function darkcolor($iamge){
        return imagecolorallocate($image, mt_rand(0,135), mt_rand(0,135, mt_rand(0,135)));
    }
    function littlecolor($iamge){
        return imagecolorallocate($image, mt_rand(130,255), mt_rand(130,255, mt_rand(130,255)));
    }
    ```

## 文件操作

is_file()
is_dir()

file_exists()   // 文件或目录是否存在
filesize()      // 文件大小
    返回文件大小的字节数。如果失败，则返回 FALSE
is_readable()   // 文件是否可读
is_writable()
filectime()
filemtime()
fileatime()
stat()

basename()
dirname()
pathinfo(path)
    返回的数组元素如下：

    [dirname]: 目录路径
    [basename]: 文件名
    [extension]: 文件后缀名
    [filename]: 不包含后缀的文件名

opendir(path)
    打一个目录，读取它的内容, . .. 文件1 文件2

readdir(dir_handle)
    返回目录中下一个文件的文件名
    ls -a

    ```
    $dir = "/images/";

    // Open a directory, and read its contents
    if (is_dir($dir)){
        if ($dh = opendir($dir)){
            while (($file = readdir($dh)) !== false){
            echo "filename:" . $file . "<br>";
            
            }
            closedir($dh);
            
        }
        
    }
    ```
rewinddir(dir_handle)
    重置由 opendir() 创建的目录句柄


closedir(dir_handle)

mkdir()
    mkdir(path [,mode,recursive,context])
        mode:默认是 0777, mode 参数在 Windows 平台上被忽略。
        recursive: true/false
rmdir()
scandir()
    scandir(directory[,sorting_order,context]);
    返回指定目录中的文件和目录的数组
    枚举数组


fopen()
    fopen() 函数打开一个文件或 URL。
    如果 fopen() 失败，它将返回 FALSE 并附带错误信息。您可以通过在函数名前面添加一个 '@' 来隐藏错误输出。

    fopen(filename[,mode,include_path,context])
        mode
            "r"     （只读方式打开，将文件指针指向文件头）
            "r+"    （读写方式打开，将文件指针指向文件头）
            "w"     （写入方式打开，清除文件内容，如果文件不存在则尝试创建之）
            "w+"    （读写方式打开，清除文件内容，如果文件不存在则尝试创建之）
            "a"     （写入方式打开，将文件指针指向文件末尾进行写入，如果文件不存在则尝试创建之）
            "a+"    （读写方式打开，通过将文件指针指向文件末尾进行写入来保存文件内容）
            "x"     （创建一个新的文件并以写入方式打开，如果文件已存在则返回 FALSE 和一个错误）
            "x+"    （创建一个新的文件并以读写方式打开，如果文件已存在则返回 FALSE 和一个错误）

fread()
    string fread ( resource $handle , int $length  )
    函数会在到达指定长度或读到文件末尾（EOF）时（以先到者为准），停止运行。
    length: 规定要读取的最大字节数。

    ```
    读取整个文件：

    <?php
    $file = fopen("test.txt","r");
    $contents = fread($file,filesize("test.txt"));
    fclose($file);
    ?>
    ```

fgets()
    fgets() 函数从打开的文件中返回一行。
    fgets(file,length)
        length可选。规定要读取的字节数。默认是 1024 字节。实验表明就是一行，不论字节数

readfile('file')
    读取文件并写入到输出缓冲。
    成功时返回从文件中读入的字节数， 或者在失败时返回 false 

file_get_contents('file')
    将整个文件读入一个字符串

file('file')
    把整个文件按行读入一个数组中


feof()
    检查是否已到达文件末尾（EOF）。

    ```php
    while(! feof($file))
    {
    echo fgets($file). "<br />";
    }
    ```

fwrite(file,string[,length])

    length可选。规定要写入的最大字节数。
    
    返回写入的字节数

    ```
    $file = fopen("test.txt","w");
    echo fwrite($file,"Hello World. Testing!");
    fclose($file);
    ?>
    ```

fseek(file,offset[,whence])
    whence
        SEEK_SET - 设定位置等于 offset。默认。
        SEEK_CUR - 设定位置为当前位置加上 offset。
        SEEK_END - 设定位置为文件末尾（EOF）加上 offset（要移动到文件末尾之前的位置，offset 必须是一个负值）。

rewind()
