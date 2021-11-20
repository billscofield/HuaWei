# Flask

## Flask简介

轻量级Web开发框架
2010年

Flask的两个核心
    WSGI 采用 Werkzeug(路由模块)
    模板引擎:Jinja2

## 常用扩展包

Flask-SQLalchemy    数据库(alchemy n. 炼金术；魔力)
Flask-migrate       管理迁移数据库
Flask-Session
Flask-Mail          邮件
Flask-WTF           表单
Flask-script        插入脚本
Flask-Login         认证用户状态
Flask-OpenID        认证
Flask-RESTful       开发REST API的工具
Flask-Bootstrap     
Flask-Moment        本地化时间和日期
Flask-Admin         管理接口的框架

[扩展库](flask.pocoo.org/extensions)


## 安装

pip install flask   #pyenv路径 /root/.pyenv/versions/3.7.3/envs/liujiao373/lib/python3.7/site-packages

from flask import Flask


## requirements 文件

pip freeze > requirements.txt

pip install -r requirements.txt


## ptags.py

sudo cp ptags.py /usr/bin

```
为当前目录生成tag文件 :  ptags.py *.py

为整个项目生成tag文件：find  . -name \*.py -print | xargs ptags.py

然后就有tag了。在vim的配置文件中导入tag文件的目录就可以了。

比如在.vimrc 中添加：

set tags+=tags

```

## 基础模板

文件夹
    static
        http://ip/static/1.jpg
    templates

```
from flask import Flask

app = Flask(__name__)       //__name__ 为了确定资源所在路径, 当前工程目录
    以 static 查找静态文件
    以 template 查找模板文件
    import_name
    主模块所在目录


    :param import_name:
        the name of the application package¬

    :param static_url_path:
        can be used to specify a different path for the static files on the
        web.  
        Defaults to the name of the `static_folder` folder.
        
        static_url_path='/s', 此时 http://ip/s/1.jpg

    :param static_folder: 
        The folder with static files that is served at ``static_url_path``.
        Relative to the application ``root_path`` or an absolute path.
        Defaults to ``'static'``.
        
        自定义静态文件路径, 默认为 static

    :param template_folder:
        the folder that contains the templates that should be used by the
        application.  Defaults to ``'templates'`` folder in the root path of
        the application.





@app.route('/',methods=['get','post'])             //定义路由及视图函数, methods默认是get
def index():                                       //打开页面时是get方法，点击提交按钮时就是POST了
    print("Welcome")

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=80,debug=True)  //启动简易服务器,用于测试


debug=True  这个1.0版本后就不支持了，使用 export Flask_Debug=1 
然后 app.run(debug=True) 这里边也要设置
```



flask 将配置信息保存到了 app.config 属性中，该属性可以按照哦啊字典类型进行操作

读取
    app.config.get(name)
    app.config[name]

工程配置参数
    主要使用以下3种方式
    1. 从配置对象中加载
        app.config.from_object(配置对象)
        
        ```
        class DefaultConfig(object):
            """
            默认配置
            """
            SECRET_KEY='jdsklafjldksjafldsajf'
        
        app=Flask(__name__)
        app.config.from_object(DefaultConfig)
        
        @app.route('/')
        def index():
            return app.config.get('SECRET_KEY')
        ```
        
        优点: 可以继承
        缺点: 敏感数据暴露
        应用场景: 默认配置, 示例
        优先级最低

    2. 从配置文件中加载
        app.config.from_pyfile('配置文件')
        
        ```setting.py
        SECRET_KEY = 'jklsa;djfklsdajfkl;jds;laj'
        ---
        app.config.from_pyfile('setting.py')
        ```
        优点: 保护敏感数据，
        缺点: 不能继承，路径不灵活
        应用场景: 
    
    3. 从环境变量中加载
        app.config.from_envvar()
        这个环境变量也是一个文件的路径什么的
        export setting='/home/root/setting.py'
        
        ```
        在操作系统中声明一个变量
        export name='flaskgogogo'
        ---
        app.config.from_envvar('name')
        
        def from_envvar(self, variable_name: str, silent: bool = False) -> bool:¬
            slient: False 没有值则直接报错, True 没有也不报错，保持安静
        ```
        
        优点: 保护敏感数据，没有路径，很灵活
        缺点: 需要进行变量设置这一步骤
        应用场景: 
        优先级更高

        ```
        class DefaultConfig(object):
            myname='flaskgogogo'
        
        app.config.from_object(DefaultConfig)
        app.config.from_pyfile('settings.py')
            settings.py
            myname="settings.py"
        app.config.from_envvar('myname')
        ```

    工厂
        ```
        def create_flask_app(config):
            """
            创建Flask应用
            :param config: 配置对象
            :return: flask 应用
            """
            app = Flask(__name__)
            app.config.from_ojbect(config)
            app.config.from_envvar("PROJECT_SETTING",slient=True)
            return app
        
        class DefaultConfig(object):
            SECRET_KEY='xxx'
        app = create_flask_app(DefaultConfig)
        ```

def run(
        self,
        host: t.Optional[str] = None,
        port: t.Optional[int] = None,
        debug: t.Optional[bool] = None,
        load_dotenv: bool = True,
        **options: t.Any,
    ) -> None:


新版的启动方式

    flask run
        1. if __name__ 这些不要写
        2. FLASK_APP=启动文件
            export FLASK_APP='helloworld'
            flask run
            flask run -h host -p port
            flask run --help
            
            export FLASK_ENV=production     生产环境(default)
            export FLASK_ENV=development    开发环境
            
        等价于 python -m flask run





### 路由传参

URL 路径参数(动态路由)

    ```
    @app.route('/orders/<order_id>')        // <>  转换器语法, 默认string, 本例:<string:order_id>, DEFAULT_CONVERTER
    def get_order_id(order_id):
        return 'order is %s' % order_id
        return 'order is {}'.format(order_id)
    ```

    限定

        ```
        @app.route('/orders/<int:order_id>')
        <int: >
        <float: >   必须有小数点,int不可以
        ```

    自定义转换器

        ```
        @app.route('/sms-codes/<int:mob_num')

        ---

        1. 
        from werkzeug.routeing import BaseConverter

        class MobileConverter(BaseConverter):
            """
            手机号格式
            """
            regex = r'1[3-9]\d{9}'      // regex 是固定的
        
        2. 将自定义转换器注册
            app.url_map.converters['mobile']=MobileConverter

        3. 使用
            @app.route('/sms-codes/<mobile:mob_num')
        ```

其他参数
    
    request 是一个全局对象
    不同位置的参数都放在 request 的不同属性中

    **from flask import request**

    @app.route('/articles')
    def get_articles():
        channel_id=request.args.get('channel_id')
        return 'the result is {}'.format(channel_id)

    http://ip/articles?channel_id=123


    request
        data        请求体的 body
        form        请求的表单数据
        args        请求中的查询参数
        cookies     请求中的 cookie 信息
        headers     请求中的报文头, 可以认为是个字典
        method      请求中的 http 方法
        url         请求中的 url 地址
        files       body 中记录请求上传的文件, 转换成为 python 的文件类型


    from flask import request
    @app.route('/upload',methods=["POST"])
    def upload():
        f = request.files['pic']
        with open('./demo.png','wb') as new_file:
            new_file.write(f.read())
        return 'ok'

        flask 封装了一个方法 file.save()

        f.save('./demo.png')    替换 with ...


响应
    返回模板(jinja2)
        template/index.html

        @app.ruote('/')
        def home():
            data = dict(
                my_name='xxx',
                my_name2='xxx'
            )
            return render_template('index.html',**data)

        @app.ruote('/')
        def home():
                my_name='xxx',
                my_name2='xxx'
            return render_template('index.html',my_name=my_name,my_name2=my_name2)


    返回 json 
        1. json.dumps()
            仅仅把数据转换为 json 格式
            没有添加 Content-Type:application/json
            
        1. from flask import jsonify
            转换为 json 格式
            设置了响应头 Content-Type:application/json

    自定义状态码和响应头
        1. 元组方式
            必须是 (response,status,headers)的形式, 且至少一个
            
            @app.route('/')
            def home():
                return '状态码是666',666,{'itcast':'python'}
                        body         状态码 响应头


        2. make_response 方法
            @app.route('/')
            def home():
                resp = make_resonse('make_response 测试')   //消息体
                resp.headers['itcast'] = 'python'           //消息头
                resp.status = 444                           //状态码, 应该返回 码和说明 = 444 wtf
                return resp

    cookie
        @app.route('/')
        def home():
            resp = make_resonse('set cookie')
            resp.set_cookie('username','itcast')                //默认临时cookie
            resp.set_cookie('username','itcast',max_age=3600)   //秒
            return resp

        读取 cookie
        @app.route('/get_cookie')
        def get_cookie():
            resp = request.cookies.get('username')
            return resp

        删除 cookie
        @app.route('/delete_cookie')
        defa delete_cookie():
            response = make_response('hello')
            response.delete_cookie('username')
            return response


    session
        from flask import session
        @app.route('/setsession')
        def set_session():
            session['username'] = 'itcast'      // 必须配置 secret key

        @app.route('/getsession')
        def get_session():
            return "username {}".format(username)

---
    class DefaultConfigration(object):
        SECRET_KEY='helloworld'

    from flask import session
    @app.route('/setsession')
    def set_session():
        session['username'] = 'itcast'      // 必须配置 secret key

        flask 默认的 session 是 浏览器 session, 所以要用 SECRET_KEY 签名
    




查看所有的路由
    1. 命令行 flask routes     // FLASK_APP
        ➜  test flask routes
        Endpoint  Methods  Rule
        --------  -------  ---------------------
        index     GET      /
        static    GET      /bill/<path:filename>

    2. app.url_map 在程序中使用
        
        print(app.url_map)
            Map([<Rule '/' (GET, HEAD, OPTIONS) -> index>,
            <Rule '/bill/<filename>' (GET, HEAD, OPTIONS) -> static>])


    遍历 app.url_map 对象
        app.url_map.iter_rules()        // 返回迭代器
        
        for rule in app.url_map.iter_rules():
            print('name={} path={}'.format(rule.endpoint, rule.rule))
        ---
        rules_iterator = app.url_map.iter_rules()
        return json.dumps({rule.endpoint: rule.rule for rule in rules_iterator})




请求方式
    CORS 跨域
    get
    options: 
        简化的 get, 用于询问服务器接口信息的, 只是询问接口信息, 如请求方式等
        返回reponse -> allow-origin
        然后再发送 GET 消息
    head
        简化的 get, 只返回 GET 请求处理的响应头, 不返回响应体



app.route()
    The endpoint name for the route defaults to the name of the view¬
    function if the ``endpoint`` parameter isn't passed.¬

    The ``methods`` parameter defaults to ``["GET"]``. ``HEAD`` and¬
    ``OPTIONS`` are added automatically.¬

    :param rule: The URL rule string.¬
    :param options: Extra options passed to the¬
        :class:`~werkzeug.routing.Rule` object.¬

        methods=["POST"]



## 异常处理

abort 方法
    终止视图继续执行

    from flask import abort
    if channel_id is None:
        abort(400)      // bad request

异常捕获
    比如涉及到数据库的查询, 如果抛出数据库异常
    errorhandler 装饰器

    @app.errorhandler(500)              //更改默认的500错误
    def internal_server_error(e):
        return '服务器搬家了'

    @app.errorhandler(ZeroDivisionError)
    def zero_division_error(e):
        return 'cannot be divided by zero'


## 请求钩子

在客户断和服务器交互的过程中,有些准备工作
    1. 在请求开始时, 建立数据库连接
    2. 在请求开始时, 进行权限校验
    3. 在请求结束时, 指定数据的交互格式

起到中间件/中间层的作用

多个中间件的顺序

    pre_process -> view -> pre_process

    pre1 > pre2 > pre3 > view > after3 > after2 > after1 > 用户

中间件不区分视图，通通使用


flask 以钩子(装饰器)的形式实现

    @app.before_first_request
        1. 在处理第一个请求前执行

    @app.before_request
        1. 在每次请求前执行
        2. 如果在某修饰的函数中返回了一个响应，试图函数将不再被调用

    @app.after_request
        1. 如果没有抛出错误，在每次请求后执行
        2. 接受一个参数: 试图函数做出的响应
        3. 在此函数中可以对响应值在返回之前做最后一步修改处理
        4. 需要将参数中的响应在此参数中进行返回

    @app.teardown_request
        1. 在每次请求后执行
        2. 接受一个参数: 错误信息, 如果有相关错误抛出

## 上下文

有两种，请求上下文，应用上下文



request context

    1. request

    2. session

    虽然是全局的，但是在线程内

应用上下文 (application context)

    1. current_app
        如果用 Blueprint, app 就拿不到了，所以有了个 current_app
        
        from flask import current_app

    2. g对象
    


## Jinja2

    ```
    template:

    {{name}}



    @app.route('/orders/<int:order_id>')
    def index():
        name = 'liujiao'
        return render_template('index.html',name=name)

    ```

### 变量

注释
    {# #}

变量
    1. {{ 变量 }}
    1. {{ 列表.index }}     {{ 列表[index] }}
    1. {{ 字典.key}}        {{ 字典['key'] }}
        dict.url            dict['url']

流程控制
    {% for %}

    {% endfor %}


    ---

    {% if score > 4 %}

    {% endif %}


    ---


## 过滤器 |

针对模板中的变量

1. 不转义
    {{ '<em>strong</em>' | safe }}
1. upper
1. lower

支持链式调用
    {{ url | upper | lower }}



## Web 表单 Flask-WTF扩展
封装了WTForms, 拥有验证表单数据的功能
pip install flask_wtf

from flask import request       //1.判断请求方式

@app.route('/')
def index():
    if request.method == 'POST':

        username = request.form.get('username')     //2.获取请求参数
        password = request.form.get('password')     //获取请求参数

        if not all([username,password,password1]):
            print("参数不完整")
        if password != password1:
            print("两次输入密码不一致")

        return 'POST'                               //如果是GET方法，直接就返回这个了,没有表格加载
        
    return render_template('index.html')


在 Flask 文件中定义表单类，在 html 文件中调用
```
class RegisterForm(FlaskForm):
    username = StringField('用户名' , validators = [DataRequired()])
    password = PasswordField('密码', validators = [DataRequired()])
    password = PasswordField('确认密码', validators = [DataRequired(),EqualTo('password',)])
    input = SubmitField('提交')
```




### flash 给模板传递消息   传统实现
    ```
    import flash

    app = Flash(__name__)

    app.security_key = 'hello'

    @app.route('/')
    def index():
        if request.method == 'POST':

            password = request.form.get('password1')

            if password == password1:
                flash('密码正确')
        return render_template('index.html')




    index.html

        <form method="POST">
            <label>姓名:<input type="text" name='username' value='liujiao'></label><br>
            <label>密码:<input type="password" name='password'></label></br>
            <label>确认密码:<input type="password" name='password2'></label></br>
            <label><input type="submit" value="提交"></label></br>
        </form>


        //使用遍历获取闪现
        {% for message in get_flashed_messages() %}         //get_flashed_messages()
            {{ message }}
        {% endfor %}
    ```

    ---

    ```
    py文件 a.py
    from flask import Flask
    
    app=Flask(__main__)
    
    @app.route('/')
    def index(name):


    html文件 index.html
    
    <body>
        {{ name }}

    </body>
    ```


### WTForms 常用验证函数




## flask_bootstrap
https://flask-bootstrap-zh.readthedocs.io/zh/latest/basic-usage.html

pip install flask_bootstrap
pip install flask-bootstrap //这个也可以，两个都行?



### 继承
```
base.html
<html>
<head>
    <title>{% block title %}{% endblock %}</title>
</head>
<style>
    ...

    {% block head %}
    {% endblock %}
</style>
<body>


{% block 名字 %}
    
{% endblock %}
</body>
</html>

---

index.html
{% extends 'base.html' %}

{% block 名字 %}
    这里是首页的内容
{% endblock %}


```

父模板中要事前定义好



### url链接

```
a.py 文件
@app.route('')
def index():
    pass


@app.route('/login/')
def login():
    pass


index.html
<a href='http://192.168.10.151/login/'>LOGIN</a>    //方法一
<a href='/login/'>LOGIN</a>
<a href='{{ url_for("login") }}'>LOGIN</a>

```



1.静态文件引入：{{ url_for('static', filename='文件路径')  }}
2.定义路由：{{ url_for('模块名.视图名'，变量=参数)  }}
3.定义数据块：{% block 数据块名称 %}...{% endblock %}
4.继承模板：{% extends "home/home.html" %}
5.包含模板： {% include "home/menu.html" %}




### url 反转
从视图函数到url的转换

页面重定向的时候，会使用url反转
在模板中，会使用url反转

<a href="{{ url_for('login') }}">登录</a>


---

from flask import url_for

@app.route('/')
def index():
    print(url_for('my_list'))               //url_for() 中的参数是视图函数名称
    print(url_for('article',id="abc"))      //看这个，变量用字典指定


@app.route('/list/')
def my_list():
    return 'list'


@app.route('/article/<id>')
def article(id):
    return "id is %d" % id



### 页面跳转和重定向

    ```

from flask import redirect
from flask import url_for

@app.route('/')
def index():
    return redirect(url_for("login"))   或者用 return redirect('/user/')        ###
    return "这是首页"


@app.route('/login')
def login():
    return '登录页面'

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)


    ```


## Blueprint

可以理解为存储一组视图方法的容器对象
1. 可以将一个 Blueprint 注册到任何一个未使用的 URL 下, 比如 "/user", "/goods"
1. 可以有自己的模板，静态文件或者其它
1. 在一个应用初始化时，就应该要注册需要使用的 blueprint

创建蓝图对象
    user_bp = Blueprint('user',__name__)
注册
    app.register_blueprint(user)


单文件蓝图
单个目录蓝图
    蓝图对象放在 __init__.py

    ```user/__init__.py
    from flask import Blueprint
    from . import views             // 这个放到下边的 user_bp 后边能防止循环引用

    user_bp = Blueprint('user',__name__,url_prefix='/user/',template_folder='绝对或相对路径')  //相对于这个脚本文件

    ---存在循环引用

    from . import user_bp       # 视图也可以定义在单独文件中, views.py

    @user.route('/')
    def index():
        pass        //如果此处用render_template('index.html')       如果 templates 目录和 template_folder 目录均存在 index.html 文件，优先使用 templates 目录中的
    ```


main.py
from 文件夹.文件名 import user
from user import user_bp
app.register_blueprint(user)        // 在主程序中注册 blueprint


http://ip/url_prefix/blueprint-name


蓝图内的静态文件和模板，没有默认值，需要手动指定



Debug 模式的作用
    后端错误会将真实报错信息返回给前端
    修改代码自动重启服务器



## Flask-Script


    ```
    from flask import Flask
    from flask_script import Manager

    app = Flask(__name__)
    manager = Manager(app)  //创建manager管理类的对象

    @app.route('/')
    def index():
        pass

    if __name__ == '__main__':
        manager.run()



    python a.py --help
    python a.py runserver --help
        python a.py runserver --host='0.0.0.0'
                              -h='0.0.0.0'
        python a.py runserver --host='0.0.0.0' --port=
                              -p
        python a.py runserver --debug
                              -d


    ----
    python a.py shell   //相当于导入了a.py这个文件
    ```




## Flask-SQLAlchemy

Alchemy 炼金术；魔力

pip install Flask-SQLALchemy

数据库驱动
    host
    port
    connect()
    cursor.execute(sql)


app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True   //自动提交

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True  //
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:mysql@127.0.0.1:3306/test3'

app.config['SQLALCHEMY_ECHO'] = True  //显示转换后的原始sql语句





### SQLAlchemy
ORM框架
把关系表结构映射到对象

关系对象映射
    1. 类对应数据库的表
    1. 对象对应数据库的行


原生SQL 就用 pymysql 或 MySQLdb
    1. pymysql 支持 Python2/3
    1. MySQLdb 仅支持 Python2

ORM 就用 SQLAlchemy


```
一 然后创建一个声明类，映射类到表的关系
from sqlalchemy.ext.declarative import declarative_base
BaseModel = declarative_base()

二 定义我们的python类 - -> 数据库中的表
from sqlalchemy import Integer, String, Column
class User(BaseModel):
    __tablename__ = 'user'
    
    id = Column(Integer, primary_key = True)
    name = Column(String(32), index = True, nullable = False)


三 所有的数据库操作， 我们首先要创建一个连接。 告诉我们的代码， 连接到我们数据库的路径
from sqlalchemy.engine import create_engine
engine = create_engine('mysql+pymysql://root:root@127.0.0.1/test?charset=utf8')


四 创建数据表
##BaseModel.metadata.create_all(engine) 会找到 BaseModel 的所有子类，并在数据库中建立这些表
BaseModel.metadata.create_all(engine)                           


五 会话制造工厂
from sqlalchemy.orm import sessionmaker
select_db = sessionmaker(engine)

db_session = select_db()



六 数据库操作
db_session.query



session.commit()
session.close()



四
```


synchronize_session

```
synchronize_session –

chooses the strategy for the removal of matched objects from the session. Valid values are:

False - don’t synchronize the session. This option is the most efficient and is reliable once the session is expired, which typically occurs after a commit(), or explicitly using expire_all(). Before the expiration, objects may still remain in the session which were in fact deleted which can lead to confusing results if they are accessed via get() or already loaded collections.

'fetch' - performs a select query before the delete to find objects that are matched by the delete query and need to be removed from the session. Matched objects are removed from the session.

'evaluate' - Evaluate the query’s criteria in Python straight on the objects in the session. If evaluation of the criteria isn’t implemented, an error is raised.

The expression evaluator currently doesn’t account for differing string collations between the database and Python.

Returns
the count of rows matched as returned by the database’s “row count” feature.

https://docs.sqlalchemy.org/en/13/orm/query.html
```
