# tp6

## 安装

[下载地址](https://packagist.org/packages/topthink/think)

    composer create-project topthink/think tp

如果需要更新框架使用

    composer update topthink/framework

[tp手册](https://www.kancloud.cn/manual/thinkphp6_0/1037479)
    写的比较详细


## tp 目录结构

目录：小写
类库和函数文件统一以 .php 为后缀
类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致
类文件采用大驼峰命名，其他采用小写+下划线命名
类名和文件名保持一致

函数的命名: 小写字母+下划线, 如 get_client_ip

方法的命名采用小驼峰，如 getUserName
属性的命名采用小驼峰，如 tableName
    构造方法除外

环境变量/常量: 大写+下划线
配置参数: 小写+下划线， 如 url_convert

数据库表/字段: 小写+下划线

支持多应用

tp                                      安装后的目录结构就是一个单应用模式
├── app                                 应用目录
│   ├── AppService.php
│   ├── BaseController.php
│   ├── common.php                      公共函数文件
│   ├── controller                      控制器目录
│   |   └── index.php
│   ├── event.php                       事件定义文件
│   ├── ExceptionHandle.php
│   ├── middleware.php
│   ├── provider.php
│   ├── Request.php
│   └── service.php
│   └── model                           需要手动创建
│   └── view                            需要手动创建
├── composer.json
├── composer.lock
├── config
│   ├── app.php                         应用配置
│   ├── cache.php
│   ├── console.php
│   ├── cookie.php
│   ├── database.php
│   ├── filesystem.php
│   ├── lang.php
│   ├── log.php
│   ├── middleware.php
│   ├── route.php
│   ├── session.php
│   ├── trace.php
│   └── view.php
├── extend
├── LICENSE.txt
├── public                              公用
│   ├── favicon.ico
│   ├── index.php
│   ├── robots.txt
│   ├── router.php
│   └── static
├── README.md
├── route                               路由定义
│   └── app.php
├── runtime                             缓存目录，看下权限(777?)
├── think
├── vendor                              第三方类库目录, bootstrap
│   ├── autoload.php
│   ├── bin
│   ├── composer
│   ├── league
│   ├── psr
│   ├── services.php
│   ├── symfony
│   └── topthink                        thinkphp 的核心
└── view
    └── README.md

## 运行 tp6

1. nginx 根目录指向 public

2. 在项目根目录执行

    php think run       // 默认 8000
    php think run -p 8080

    think 是根目录下的一个文件


## 配置

database.php
app.php

env 环境变量配置
    默认在根目录有一个示例文件 .example.env(隐藏的) 改名为 .env

    ```
    APP_DEBUG = true                        // 调试模式, 页面右下角有个Trace调试图标

    [APP]
    DEFAULT_TIMEZONE = Asia/Shanghai

    [DATABASE]
    TYPE = mysql
    HOSTNAME = 127.0.0.1
    DATABASE = test
    USERNAME = username
    PASSWORD = password
    HOSTPORT = 3306
    CHARSET = utf8
    DEBUG = true

    [LANG]
    default_lang = zh-cn
    ```

    环境变量不区分大小写

    .env 用于本地开发测试，部署后会被忽略

如何获取 .env 中的值呢? 以 database.hostname 为例:

    use think\facade\Env;
    return Env::get('database.hostname');

    return Env::get('app.default_timezone')

    判断是否存在
        echo Env::has('database.hostname');
        不能用 return , why?

如何获取 config 中的值呢? 以 database.hostname 为例:

    use think\facade\Config;
    return Config::get('database.connections.mysql.hostname');

    config/database.php
        'hostname'        => env('database.hostname', '127.0.0.1')
        首先去 env 中获取 database.hostname, 如果没有则返回 127.0.0.1


## url 访问模式

单应用
    
    http://serverName/index.php/控制器/操作(函数)/参数/值...

    ```

    cp Index.php Go.php

    <?php
    namespace app\controller;
    class Go
    {
        public function index(){                    // 可以省略该方法，但是要设置 url 重写(apache)
            return 'gogogo';
        }

        public function hello($name = 'ThinkPHP6')
        {
            return 'hello,' . $name;
            return json(array(1,2,4,5));            // array 须要用 json 函数
            // 测试的时候不推荐使用 die/exit, 推荐使用 halt('中断测试') halt 函数
        }
    }
    ```

    http://servername:8000/index.php/go         // 默认是 index
    http://servername:8000/index.php/go/hello   // 是 hello 函数
    http://servername:8000/index.php/go/hello/name/Alice   // name 是$name参数，


基础控制器
    
    use app\BaseController;
    class Test extends BaseController{}

    BaseController 提供了 think\App 和 think\request

        return $this->app->getBasePath();       // 当前的世纪路径, /var/www/html/...
        return $this->request->action();        // 当前的方法名

空控制器
    在单应用模式下，我们可以定义一个 Error 控制器类，来提醒错误, 也会覆盖调试模式

    ```
    <?php

    namespace app\controller;

    class Error{
        public function index(){
            return '当前控制器不存在';
        }
    }
    ```

    访问一个不存在的控制器时，报'当前控制器不存在';

多级控制器

    controller 下创建一个目录

    ```
    controller
    ├── aigroup
    │   └── Box.php
    ├── Error.php
    ├── Go.php
    ├── Index.php

    <?php
    namespace app\controller\aigroup;

    class Box {
        public function index(){
            return 'ai group box';
        }
        public function boxMethod(){
            return 'ai group';
        }
    }
    ```

    http://server/index.php/aigroup.box/boxmethod


### 数据库

    ```php
    ./controller/Dbtest

    class Dbtest{
        public function index(){

        }
        public function hello(){
            $user = Db::table('info')->select;
            return json($user);
        }
    }
    ```

    config/database.php 中可以有多个 connection

        Db::connect('mysql')->table('info')->select(); // 这个是配置文件中的默认的 connections['mysql']
        Db::connect('demo')->table('info')->select();


单数据查询

    Db::table
    如果只希望查询一条数据，可以使用 find 方法，需指定 where
        
        Db::table('tp_user')->where('id',27)->find();
        Db::getLastSql()        // 可以获得最近一条 SQL 查询的原生语句
    
    没有查询到任何值，返回 null

    使用 findOrFail() 同样可以查询一条数据，没有数据时抛出异常

        Db::table('tp_user')->where('id',27)->findOrFail();

    使用 findOrEmpty() 同样可以查询一条数据，没有数据时返回一个空数组

        Db::table('tp_user')->where('id',27)->findOrEmpty();

数据集查询

    多列数据在查询不到任何数据时返回空数组
        $user = Db::table('tp_user')->select();
        $user = Db::table('tp_user')->where('status',1)->select();
        var_dump($user);

    使用 selectOrFail() 抛出异常
        $user = Db::table('tp_user')->where('status',3)->selectOrFail();

    在 select() 方法后再使用 toArray() 方法，可以将数据集对象转换为数组

        $user = Db::table('tp_user')->select();

    当在数据库配置文件中设置了前缀后，我们可以使用 name() 方法忽略前缀

        $user = Db::name('user')->select();

其它查询

    value() 方法获得指定字段的值(单个), 没有数据时返回 null

        Db::table('tp_user')->where('id',3)->value('username');

    column() 方法，可以查询指定列的值（多个）或者 null

        Db::table('tp_user')->column('username');
        Db::table('tp_user')->column('username','id');      // id 作为索引


