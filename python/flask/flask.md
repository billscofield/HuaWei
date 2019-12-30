# Flask

## Flask简介
轻量级Web开发框架
2010年

Flask的两个核心
    WSGI 采用 Werkzeug(路由模块)
    模板引擎:Jinja2

## 常用扩展包
Flask-SQLalchemy    数据库
Flask-migrate       管理迁移数据库
Flask-Mail          邮件
Flask-WTF           表单
Flask-script        插入脚本
Flask-Login         认证用户状态
Flask-OpenID        认证
Flask-RESTful       开发REST API的工具
Flask-Bootstrap     
Flask-Moment        本地化时间和日期
Flask-Admin         管理接口的框架

扩展库:
    flask.pocoo.org/extensions


## 安装
pip install flask   #pyenv路径 /root/.pyenv/versions/3.7.3/envs/liujiao373/lib/python3.7/site-packages

from flask import Flask


## requirements 文件
pip freeze > requirements.txt

pip install -r requirements.txt


## ptags.py
sudo cp ptags.py /usr/bin

为当前目录生成tag文件 :  ptags.py *.py

为整个项目生成tag文件：find  . -name \*.py -print | xargs ptags.py

然后就有tag了。在vim的配置文件中导入tag文件的目录就可以了。

比如在.vimrc 中添加：

set tags+=tags

## 基础模板
文件夹
    static
    templates

```
from flask import Flask

app = Flask(__name__)       //__name__ 为了确定资源所在路径

@app.route('/',methods=['get','post'])             //定义路由及视图函数, methods默认是get
def index():                                       //打开页面时是get方法，点击提交按钮时就是POST了
    print("Welcome")

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)  //启动简易服务器,用于测试


debug=True  这个1.0版本后就不支持了，使用 export Flask_Debug=1 
然后 app.run(debug=True) 这里边也要设置

```


### 路由传参
```
@app.route('/orders/<order_id>')
def get_order_id(order_id):
    return 'order is %s' % order_id
```

限定

    ```
    @app.route('/orders/<int:order_id>')
    <int: >
    <float: >   必须有小数点,int不可以
    ```


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

from flask import Blueprint

user = Blueprint('user',__name__,url_prefix='/user/',template_folder='绝对或相对路径')  //相对于这个脚本文件
@user.route('/')
def index():
    pass        //如果此处用render_template('index.html')       如果 templates 目录和 template_folder 目录均存在 index.html 文件，优先使用 templates 目录中的



main.py
from 文件夹.文件名 import user
app.register_blueprint(user)











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
