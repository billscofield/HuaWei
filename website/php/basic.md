
## 注释

```

1. 单行 //

2. 单行 #

3. 多行

    ```

    ```

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

        ```php
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
        $var;       // 一个声明了，但是没有值的变量
                    // 不存在的变量

        对象和资源都不为空

    isset() 函数用于检测变量是否已设置并且非 NULL

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

sort 本函数会为排序的数组中的单元赋予新的键名，这将删除原有的键名而不仅是重新排序
    SORT_REGULAR 正常比较单元
    SORT_NUMERIC 单元被作为数字来比较
    SORT_STRING 单元被作为字符串来比较
    SORT_LOCALE_STRING 根据当前的区域(locale)设置来把单元当作字符串比较

asort() 函数用于对数组单元从低到高进行排序并保持索引关系

    ```php
    $arr = array('b','a','c');
    asort($arr);
    print_r($arr);

    Array
    (
    [1] => a
    [0] => b
    [2] => c
    )
    ```

arsort() 函数行为与 asort() 相反，对数组单元进行由高到低排序并保持索引关系

ksort() 函数用于对数组单元按照键名从低到高进行排序
krsort() 函数行为与 ksort() 相反，对数组单元按照键名进行由高到低排序

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
```

```
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

mysql  扩展
mysqli (增强扩展)
    mysql5.3 之后的版本默认开启 mysqli 扩展

php7 之后是 mysqli, 之前是 mysql

1. 链接数据库

    mysqli_connect(host,username,password,dbname,port,socket);   均可选

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
    打开一个目录，读取它的内容, . .. 文件1 文件2

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
            "r" （只读方式打开，将文件指针指向文件头）
            "r+" （读写方式打开，将文件指针指向文件头）
            "w" （写入方式打开，清除文件内容，如果文件不存在则尝试创建之）
            "w+" （读写方式打开，清除文件内容，如果文件不存在则尝试创建之）
            "a" （写入方式打开，将文件指针指向文件末尾进行写入，如果文件不存在则尝试创建之）
            "a+" （读写方式打开，通过将文件指针指向文件末尾进行写入来保存文件内容）
            "x" （创建一个新的文件并以写入方式打开，如果文件已存在则返回 FALSE 和一个错误）
            "x+" （创建一个新的文件并以读写方式打开，如果文件已存在则返回 FALSE 和一个错误）

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


feof()
    检查是否已到达文件末尾（EOF）。

    ```
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

flock()
    flock(file,lock,block)
        lock
            LOCK_SH - 共享锁定（读取的程序）。允许其他进程访问该文件。
            LOCK_EX - 独占锁定（写入的程序）。防止其他进程访问该文件。
            LOCK_UN - 释放一个共享锁定或独占锁定
            LOCK_NB - 锁定的情况下避免阻塞其他进程。

fclose(handle)


file() 函数把整个文件读入一个数组中。

    数组中的每个元素都是文件中相应的一行，包括换行符在内。
    枚举数组

copy()
unlink()
    删除文件

file_get_contents() 把整个文件读入一个字符串中。
    file_get_contents(path[,include_path,context,start,max_length])

    file_get_contents('https://baidu.com');


file_put_contents() 函数把一个字符串写入文件中。

    int file_put_contents ( string $filename , mixed $data [, int $flags = 0 [, resource $context ]]  )

    如果文件不存在，将创建一个文件
    如果 flag 设置了 FILE_APPEND，那么将移至文件末尾。否则，将会清除文件的内容

    file_put_contents($file, $site, FILE_APPEND | LOCK_EX);


文件上传

    上传的文件默认是放在一个临时的目录中的，我们要做的就是移动这个文件到指定目录

    php.ini
        file_uploads            on
        memory_limit            8M      // 设置脚本可以分配的最大内存，防止失控的脚本独占服务器内存
        upload_max_filesize     2M      // 必须小于 post_max_size
        post_most_size          8M      // post 方法可以接受的信息最大量
        upload_tmp_dir          NULL    // 山川文件临时路径

    $_FILES     多维数组

        $_FILES['file']['name']         // 文件名称(包含扩展名)
        $_FILES['file']['size']         // 字节
        $_FILES['file']['tmp_name']     // 临时文件名
        $_FILES['file']['error']        
            UPLOAD_ERR_OK           - 没有错误发生，文件上传成功。 
            UPLOAD_ERR_INI_SIZE     - 上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值。 
            UPLOAD_ERR_FORM_SIZE    - 上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值。 
            UPLOAD_ERR_PARTIAL      - 文件只有部分被上传。 
            UPLOAD_ERR_NO_FILE      - 没有文件被上传。 
            UPLOAD_ERR_NO_TMP_DIR   - 找不到临时文件夹。PHP 4.3.10 和 PHP 5.0.3 引进。
            UPLOAD_ERR_CANT_WRITE   - 文件写入失败。PHP 5.1.0 引进。

        $_FILES['file']['type']     - 文件MIME类型
        $_FILES['file'][]


        method='POST' enctype='multipart/form-data'

    is_uploaded_file(string $filename): bool
        Tells whether the file was uploaded via HTTP POST

        if(isset($_POST['btn_submit'])){
            if(is_uploaded_file($_FILES['myfile']['tmp_name'])){
                $finfo = pathinfo($_FILES['myfile']['tmp_name']);
                move_uploaded_file($_FILES['myfile']['tmp_name'],$finofo['basename'].$finfo['extension']);
            }
        }


文件下载
    获取文件 MIME 类型

    ```
    <?php
    if(!function_exists('finfo_open')){
        header('Content-type:text/html;chrset=utf8');
        exit('请先开启 fileinfo 扩展');
    }
    $file='./upload/a.txt';

    $fileinfo = finfo_open(FILEINFO_MIME_TYPE);
    $mimetype = finfo_file($fileinfo,$file);
    finfo_close($fileinfo);

    # 指定文件meme类型
    header('Content-type:'.$mimetype);

    # 指定文件描述
    header('Content-Disposition:attachement; filename='.basename($file));

    # 指定文件大小
    header('Content-Length:'.filesize($file));

    # 读取文件输出到缓冲
    readfile($file);
    ```

## OOP

成员属性不可以是带运算符的表达式、变量、方法或函数调用

    public $var1 = 1 + 2;                       // wrong
    public $var2 = self::myStaticMethod();      // wrong
    public $var3 = $myVar;                      // wrong

var什么时候才能用

访问控制，来声明成员变量的属性

如果把var换成public，一样可以的。但是这个时候你在类中去掉var,什么访问修饰符都没
有，那会提示语法错误的。

var就是public的别名，是用在类中定义公有属性的，只不过历史问题，现在不用var了。

php官方的解释：

类属性必须定义为公有，受保护，私有之一。如果用 var 定义，则被视为公有。

Note: 为了兼容性考虑，在 PHP 4 中使用 var 关键字对变量进行定义的方法在 PHP
5 中仍然有效（只是作为 public 关键字的一个别名）。在 PHP 5.1.3 之前的版本，
该语法会产生一个 E_STRICT 警告

当不确定使用那个限定修饰符时可以先使用 var

成员属性可以有默认值

    $this->name     // 没有 $

    Creation of dynamic property Person::$score is deprecated
    从实例中创建一个动态的属性是

类中有哪些东西

    - 常量
        const NUM = 1;

        类名::NUM;
        self::NUM;

        其中::符号被称为范围解析操作符，用于访问静态成员、静态方法和常量，还可
        以用于覆盖类中的成员和方法。

        self 当前类
        this 当前类的实例

    - 属性
        访问属性 $name;
        访问属性 $name = 'zhangsan';    // 可以初始化

        $实例->name;
        $this->name;

        public/var
            全部公开透明
            类外/类内/子类

        protected
            子类可以访问
            类内/子类
            方法：实例不能使用

        private
            仅仅自己可以使用
            类内

    - 方法

引用传值

完全克隆对象
    $b = clone $a;

    __clone(){
        // 对一些成员属性进行赋值
    }

    ```
    <?php

    class Person{
        public $name;
        public $age;

        public function __construct($name,$age){
            $this->name = $name;
            $this->age = $age;
        }
        public function say(){
            echo $this->name.'say<br>';
        }

        public function __clone(){
            $this->name = 'bob';
            $this->age = 20;
        }
    }

    $a = new Person('alice',17);
    $a->say();

    $b = clone $a;
    $b->say();

    ```

其中::符号被称为范围解析操作符，用于访问静态成员、静态方法和常量，还可以用于覆
盖类中的成员和方法。

    ```
    <?php
        class Website{
            static public $name = 'C语言中文网<br>';
            public $title = 'PHP教程';
            public static function url(){
                echo self::$name;
                echo 'http://c.biancheng.net/php/<br>';
                echo $this -> title;
            }
        }
        Website::url();
    ?>
    ```


构造函数

    ```
    public function __constructor([$...])  // 无参，有一个参数，有多个参数, 默认值
    ```

    new Person;         // 构造函数没有参数，可以不写括号
    new Person();

析构函数

    ```
    public function __destruct(){           // 必须无参数
        // 可以用 echo, 可以用 var_dump
    }
    ```

    脚本结束或者显式(unset, =null)的销毁时才执行

    $a = new People;
    $b = $a;
    unset($a);              // 此时不执行析构函数
    $b->say();


    ```
    class People{
        public function __destruct(){
            var_dump($this->name.' is destroying');
        }
    }
    $a = People('zhangsan');
    $a = People('lisi');

    正常结束，lisi 先被销毁, 栈
    ```

继承
    php 只有单继承

    重写
    ```
    public function say(){
        parent::say();
        echo '<br> parent say is override';         // parent 永远是直接的上级
    }
    ```

    子类并不会显式继承父类的构造方法, 如果要定义自己的 constructor, 一定要先执
    行父类的 constructor, 否则父类的 constructor 就被覆盖了

    final class A
        这个类就不能被继承了
    
    final 方法
        该方法不能被重写, 否则提示错误

static
    该方法或属性只属于当前的类, 只能通过类调用

    ```
    public static $count = 0;

    public static function getInfo(){
        // 不能使用 $this
        // 可以使用 静态属性, self::count;
    }

    self::getInfo();
    People::getInfo();

    公共的代码, 直接通过类调用
    ```

晚绑定(延迟绑定)
    $this 到底代表谁不确定，在调用的那一刻才会知道

早绑定
    在写代码的时候

    ```php
    <?php
    class A {
        public static function who() {
            echo __CLASS__;
        }

        public static function test() {
            self::who();    // 这样写的花就是前期绑定
            static::who(); // 这里有变化，**后期静态绑定**从这里开始, 还需要定义一个static 函数去调用
        }
    }

    class B extends A {
        public static function who() {
            echo __CLASS__;
        }
    }

    B::test();              // 输出 B
    ?>
    ```

参数类型约束

    1. 类
    2. 数组
    3. callable
    4. 接口

    ```
    <?php

    class A{
        function say(){
            echo "A<br>";
        }
    }

    class Say{
        function say(A $a){             // 类约束
        function say(Array $a){         // 数组约束
        function say(callable $fn){     // 函数约束 $param
            $a->say();
        }
    }

    $a = new A;

    $s = new Say;
    $s->say($a);
    ```


    $param = function (){}              // 匿名函数, 也可以直接写

**unset 是没有返回值的**

魔术方法

    魔术方法一般都是 public 的

    一般会在魔术方法内部进行一些流程处理, 而不是直接用这个值

    ```
    public function __toString(){
        return $this->name."object cannot be echo";
    }

    public function __get($key){
        // 这个方法用来获取<私有/受保护的成员属性值>的
        // 是在直接获取<私有/受保护的属性>的时候对象自动调用的
        // 如果成员属性不封装成私有的，对象本身就不会去自动调用这个方法
    }


    public function __set($key, $val){
        // 这个方法用来为<私有/受保护成员属性设置值>的
        // 如果成员属性不封装成私有/受保护的，对象本身就不会去自动调用这个方法
    }

    public function __iset($key)
        isset($person->私有/受保护成员)        // 返回 false
        也可以判断 public
    
    public function __unset($key)
        // 这个方法用来销毁 <私有/受保护成员属性>
        


    public function __call(string $fun_name,array $arguments)
        对象中调用一个不存在的方法, 不可访问的方法(private,protected)时调用

        ```php
        <?php

        class DB{
            private $sql=array('table'=>'',
                'field'=>'',
                'where'=>'',
                'order'=>'',
                'limit'=>'');

            public function say(){
                echo "hello";
            }

            public function __call($fun,$arguments){
                if(array_key_exists($fun,$this->sql)){
                    $this->sql[$fun] = $arguments[0];
                    return $this;
                }else{
                    die('');
                }
            }

            public function select(){
                if($this->sql['table']){
                    $table = "FROM {$this->sql['table']}";
                }
                if($this->sql['where']){
                    $where = "WHERE {$this->sql['where']}";
                }
                if($this->sql['order']){
                    $order = "ORDER BY {$this->sql['order']}";
                }
                if($this->sql['limit']){
                    $limit = "LIMIT {$this->sql['limit']}";
                }

                $sql = "SELECT {$this->sql['field']}  $table $where order by {$this->sql['order']} $limit";

                echo $sql;
            }
        }

        $a = new DB;
        $a->table('user')->field('age')->where('id>3')->order('ASC')->limit('10');

        #var_dump($a);
        $a->select();
        ```


    public static function __callStatic(string $fun_name,array $arguments)
        在<静态上下文>中调用一个不可访问方法时
        d A::__callStatic() must be static
    ```

    public function __toString(){           // 必须返回字符串
        return $this->name;
    }

命名空间

    ```php
    /projectone/classes/space1/Hello.php
    <?php
    namespace space1;                          // 这个一定不要忘了
    calss Hello{
    }

    /projectone/classes/space2/Hello.php
    <?php
    namespace space2;
    calss Hello{
    }


    /projectone/classes/index.php

    require_once './space1/Hello.php';
    require_once './space2/Hello.php';

    $a = new \space1\Hello();
    $b = new \space2\Hello();
    ```


类的说明

```
class Person{
    /*¬
    * @param String $name 这个用户的用户名      // vim, vscode, phpstorm 并没有很好的提示效果
    * @param String $gender 这个用户的性别
    * @param int $age 这个用户的年龄¬
    */¬
}
```

### 抽象方法和抽象类

抽象方法: 没有花括号, 必须使用 abstract
    public abstract function fun();
    abstract public function fun();

    抽象方法可以传参数，实现的时候也要一样

抽象类: 包含抽象方法的类
    也必须要使用关键字 abstract 加以声明
    不能实例化
    若想使用抽象类，就必须定义一个类去继承这个抽象类，并定义覆盖父类的抽象方法

    抽象类可以不包含抽象方法
    抽象类可以包含普通方法

    ```
    abstract class A{

    }
    ```

### 接口

为了继承多个类, 多继承
接口不能实例化

接口定义了实现该接口的类必须要实现的一系列函数

定义格式:

    ```
    interface 接口名称{
        // 常量成员    const关键字定义
        // 抽象方法   不需要使用 abstract 关键字, 不能有普通方法，所以可以省略 abstract
    }
    ```

使用格式

    class 类名 implements 接口名1,接口名2{...}

    ```
    <?php

    interface human{
        const NAME='lisi';

        public function say();
        public function eat();
    }

    interface transformer{
        public function transform();
    }

    class Person implements human,transformer{
        public function say(){
            echo 'say<br>';
        }

        public function eat(){
            echo 'eat<br>';
        }

        public function transform(){
            echo 'I can transform<br>';
        }
    }

    $a = new person;

    $a->say();
    $a->eat();
    $a->transform();
    echo $a::NAME;

    ```

### 多态

是指父类中定义的属性或行为被子类继承之后，可以具有不同的数据类型或表现出不同的
行为。这使得同一个属性或行为在父类及其各个子类中具有不同的语义。

    ```
    <?php

    interface USB{
        public function run();
    }

    class Mouse implements USB{
        public function run(){
            $this->init();
        }
        public function init(){
            echo 'mouse init<br>';
        }
    }

    class Store implements USB{
        public function run(){
            $this->init();
        }

        public function init(){
            echo '存储设备初始化<br>';
        }
    }

    class Pc {
        public function useUSB($obj){
            $obj->run();
        }
    }

    $a = new Pc;
    $a->useUSB(new Mouse);
    $a->useUSB(new Store);

    ```

### 面向对象程序设计常用函数

`__autoload`
    [link](https://www.php.cn/php-weizijiaocheng-426838.html)
    
    ```
    <?php

    function __autoload($className){
        $file=$className.'.class.php';
        $path = "./class/".$file;
        if(file_exists($path)){
            include($path);
        }else{
            die("该类不存在");
        }
    }

    __autoload() is no longer supported, use spl_autoload_register() instead
    ```



class_exists
    查类是否已经定义
    class_exists(string $class, bool $autoload = true): bool

    autoload
        是否默认调用 __autoload。 


get_class_methods
    返回由类的 public方法名组成的数组

    get_class_methods(object|string $object_or_class): array
    参数可以是 类名，也可以是 对象名

    只能返回 public 的

    ```php
    <?php
    class A{
        public function say0(){ }
        public function say1(){ }
    }

    $A = get_class_methods('A');

    var_dump($A);

    $a = new A;
    $anum = get_class_methods('A');
    var_dump($anum);
    ```

---

get_class
    返回对象的类名
    get_class(object $object = ?): string

get_object_vars
    获取指定对象的<可访问非静态属性>
    get_object_vars(object $object): array

---

get_parent_class
    检索对象或者类的父级类名
    get_parent_class(object|string $object_or_class = ?): string|false

is_a
    如果对象属于该类 或 该类是此对象的父类则返回 true
        1       2         2      1

    判断一个对象是否由一个类或这个类的子类实例化来的
    属于: 直接关系
    父类: 上上个
    is_a(mixed $object_or_class, string $class, bool $allow_string = false): bool
                    要判断的对象   类

    ```php
    class Person{
    }

    class Student extends Person{}

    $a = new Person;
    $b = new Student;

    echo is_a($a,'Person');
    echo '<br>';
    echo is_a($b,'Person');
    ```

---

method_exists
    检查类的方法是否存在(public/protected/private)
    method_exists(object|string $object_or_class, string $method): bool

    ```php
    <?php

    class Person{
        public function say(){}
    }

    echo method_exists('Person','say');  // 可以是类

    $a = new Person;
    echo method_exists($a,'say');       // 可以是实例化的对象
    ```

property_exists
    检查对象或类是否具有该属性 (public/protected/private)
    property_exists(object|string $object_or_class, string $property): bool

### 对象串行化

为了文件传输和存储

    ```
    <?php

    $arr = array(
        'name'=>'zhangsan',
        'age'=>27,
        'gender'=>'F'
    );

    $str = serialize($arr);

    var_dump($str);


    $arr1 = unserialize($str);
    var_dump($arr1);

    ```

    string(68) "a:3:{s:4:"name";s:8:"zhangsan";s:3:"age";i:27;s:6:"gender";s:1:"F";}"

    a: array, 
    a:3  array 里有3个值

    s:4  string,4个长度

---

    string(42) "O:6:"Person":1:{s:4:"name";s:7:"zhsngsa";}"

    o:6  object, object名称是6个字符
    s:4  string, 4个字符

    public function __sleep(){  // 串行化

    }

    serialize() 函数会检查类中是否存在一个魔术方法 __sleep()。如果存在，该方法
    会先被调用，然后才执行序列化操作。此功能可以用于清理对象，并返回一个包含对
    象中所有应被序列化的变量名称的数组。如果该方法未返回任何内容，则 null 被序
    列化，并产生一个 E_NOTICE 级别的错误。

    public          属性名
    private         \00所属类名\00属性名
    protected       \00*\00属性名

    只能属性，不能方法

    ```
    public $name1 = 'zhsng';
    protected $age12=17;
    private $weigh = 110;

    public function __sleep(){              // 无参数
        return array("name",'age');         // 返回一个数组，该数组包含需要串行化的属性
    }


    O:7:"Student":3:{s:5:"name1";s:5:"zhsng";s:8:"*age12";i:17;s:12:"Persoweigh";i:110;}
                        public                  protected            private
    ```

---

    public function __wakeup(){             // unserialize 会调用的, 无参数
        $this->age =$this->age +1;
    }


## 异常处理

throw new Exception("不能创建更多实例")


### 系统自带的异常处理

```
class Exception implements Throwable {

    /* 属性 */
    protected string $message = "";
    private string $string = "";
    protected int $code;
    protected string $file = "";
    protected int $line;
    private array $trace = [];
    private ?Throwable $previous = null;

    /* 方法 */
    public __construct(string $message = "", int $code = 0, ?Throwable $previous = null)

    final public getMessage(): string
    final public getCode(): int
    final public getFile(): string              // 异常的文件名
    final public getLine(): int                 // 异常的行

    final public getPrevious(): ?Throwable
    final public getTrace(): array
    final public getTraceAsString(): string
    public __toString(): string
    private __clone(): void
}
```

### 自定义异常

    ```php
    <?php

    class myException extends Exception{
        public function getAllInfo(){
            $s1 = "<br>异常的文件->".$this->getFile();
            $s2 = "<br>异常的行->".$this->getLine();
            $s3 = "<br>异常的代码->".$this->getCode();
            $s4 = "<br>异常的描述->".$this->getMessage();

            return "$s1.$s2.$s3.$s4";
        }
    }

    try{
        throw new myException("wrong");
    }catch(myException $e){
        echo $e->getAllInfo();
    }
    ```

### 捕获多个异常

    ```
    <?php

    class myException extends Exception{
        public function getInfo(){
            return $this->getMessage();

        }

    }

    try{
        if($_GET['num'] ==1)
            throw new myException('自定义异常');
        else if($_GET['num'] == 2)
            throw new Exception('系统异常');

        echo "success";


    }catch(myException $e){
        echo $e->getInfo();

    }catch(Exception $e2){          // 系统的异常要放在最后
        echo $e2->getMessage();
    }

    ```
