Ruby on Rails : 
    web框架
    做网站或手机App后台
    非常轻量级
    更新也很快
    


RMV（Ruby Version Manager）是一个方便的命令行工具，可让您安装，管理和使用多个Ruby环境。


## rvm安装
导入公钥
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
请求安装
    curl -sSL https://get.rvm.io | bash -s stable

    ```
    Installing RVM to /usr/local/rvm/
    Installation of RVM in /usr/local/rvm/ is almost complete:

      * First you need to add all users that will be using rvm to 'rvm' group,
        and logout - login again, anyone using rvm will be operating with `umask u=rwx,g=rwx,o=rx`.

      * To start using RVM you need to run `source /etc/profile.d/rvm.sh`
        in all your open shell windows, in rare cases you need to reopen all shell windows.
      * Please do NOT forget to add your users to the rvm group.
         The installer no longer auto-adds root or users to the rvm group. Admins must do this.
         Also, please note that group memberships are ONLY evaluated at login time.
         This means that users must log out then back in before group membership takes effect!

    ```

查看可以安装的ruby版本
    rvm list known

安装ruby
    rvm install 2.6.3


列出本地可用的ruby版本
    rvm list

使用rvm为默认版本
    rvm use 2.6.3 --default


交互界面
    irb
    <c-d>退出

扩展名
    .rb

输出
    puts "helloworld"

函数

    sayhello.rb
    ```
    def sayhelo
        puts "hello world"
    end

    sayhelo

    ---带参数的---
    def sayHelo(name)
        puts "helo #{name}"

    sayHelo("xian") 


    ---默认值---
    def say(name='xian')
        puts "helo #{name}."
    end
    ```


对象
    @name 是实例变量，能够被该类或者子类继承使用,模板变量

    ```ruby
    class Player
        def initialize(name='Tom')
            @name = name
        end

        def show()
            puts "Player: #{@name}"
        end
    end


    tom = Player.new()
    tom.show()

    jerry = Player.new(''jerry')
    jerry.show()
    ```
    
instance_methods(all:bool):列出对象（类）内部的方法
respond_to?:调查对象的方法、属性是否可用
send:执行对象的方法


```ruby

class Game
    def initialize(title="怪物猎人世界",price=2000)
        @title=title
        @price=price
    end

    def show1()
        put "标题: #{@title}"
        put "价格: #{@price}"
    end

    def show2()
    end

    def show3()
    end
end

puts Game.instance_methods(false)
    show
    show1
    show2

    false: 不列出系统的
    true: 列出系统的



tom = Game.new("猫和老鼠",100);
if tom.respond_to?("show")      #判断对象时候存在shouw方法
    tom.send("show")            #执行指定的方法
end
```


### 对象的属性

attr_accessor:定义可存取对象的属性, 这样外部可以访问、修改

字符串转符号(to_sym或intern),符号也可以转换成字符串(to_s)

```
class Game
    attr_accessor :price, :title
    def initialize(title="怪物猎人世界",price=2000)
        @title=title
        @price=price
    end

    def show()
        puts "标题: @title"
        put  "价格: @price"
    end
end

mygame = Game.new()
mygame.show()


puts "title is " + mygame.respond_to?("title").to_s
puts "price is " + mygame.respond_to?("price").to_s

mygame.price = 1200
mygame.show()
```


### 静态方法
只能被类本身调用，不能被实例调用

```
class Game
    def initialize(id,title,price)
        @id = id
        @title = title
        @price = price
    end

    # 这个是实例方法
    def showGame
        puts @id.to_s + ":" + @title + ":" + @price.to_s
    end

    # 这个是类方法，惊掉下巴
    def self.toStr
        puts "i love this game"
    end
end

one = Game.new(1,"hello",29)
two = Game::new(2,"hello",29)


  Game.toStr




## 继承

class SteamGame < Game
    def SteamInfo
        puts "this is extended from Game"
    end
end


SteamGame.toStr     # 调用父类的类方法

mygame = SteamGame.new(22,"22",22)
mygame.showGame
mygame.SteamInfo
```


## 初探数组

### 数组的定义

game = ["A","B","C"]

### 数组的循环

```方法一
game.each do |game|
    puts "hello #{game}"
end
```

```方法二
game.each_with_index do |game,i|
    puts "#{i} is #{game}"
end

这样的输出是类似 
    0.basketball
    1.tennis
    2.football
```

### 数组的连接

put game.join(",")


### 判断是否是数组

if game.respond_to?("each") # 有each方法
    ...
end



## 备注

1. 单行
    #

1. 多行
    =begin
    ... ... 

    =end

1. 之后全部备注
    __END__


## 操作符

1. 算数操作符
    1. +
    1. -
    1. *
    1. /
    1. %
    1. **

1. 比较操作符
    1. ==
    1. !=
    1. <
    1. <=
    1. >
    1. >=

1. 逻辑操作符
    1. &&   或 and
    1. ||   或 or
    1. !    或 not

???
1 && 0
0 && 1

三元运算符
    puts 1>2?"ok":"no"

## 条件
if then

    else

end
1. 位操作符



## 字符串

1. 连接
    +
    puts "hello" + " world"

1. 字符带入
    <<, 相当于 +=
    a = "hello"
    a << " world"
    puts a

1. 字符循环
    *
    puts "?" * 10


## 引号
1. 单引号
    不转移
1. 双引号
    转义

1. 双引号中 大括号(运算式)
    score = "#{2 * 7}"


## 哈希变量(key-value)

    ```ruby
    team_members = {
        "zhangsan" => 1,
        "lisi" => 2,
        "wangwu" => 3
    }
    
    puts team_members["lisi"]
    ```

    ```
    类似 Json 的用法
    player = {
        name:'lina',            #name :   这样报错, 也就是 key 和 冒号 之间不能有空格
        age:27,
        gender:'girl'
    }

    puts player
        输出:
        {:name=>"lina", :gender=>"girl", :age=>22}


    puts player[:name]

    
    ```

## 类型转换
1. 字符 - 数值
1. 数值 - 字符


a = '10'
b = '20'

a.to_i + b.to_i 

to_f
to_s


不是四舍五入

'nihao'.to_i    输出 0

12345.5678.to_s         这样也可以!!!




## 模块

```
module BaseFunc
    Version = "0.1.1"

    def v
        return Version
    end

    def add(a,b)
        return a + b
    end

    def self.showVersion
        return Version
    end

    # 将 方法定义为静态方法
    module_function:V
end

class BaseClass include BaseFunc

end
```
