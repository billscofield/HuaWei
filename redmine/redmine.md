# 开源项目管理软件Redmine

## 
Redmine是类似JIRA的一个项目/BUG管理工具，使用ruby语言编写的

https://blog.csdn.net/hxpjava1/article/details/79710999

https://blog.csdn.net/jzd1997/article/details/80990512

redmine傻瓜部署
    https://blog.csdn.net/begin000/article/details/79115215

## 部署

0. 安装 mariadb-server

    apt install mariadb-server

    apt install libmariadb-dev

1. 安装rvm

	apt install curl

	curl -L https://get.rvm.io | bash -s stable

	```
    Installation of RVM in /usr/local/rvm/ is almost complete:

    * First you need to add all users that will be using rvm to 'rvm' group,
    and logout - login again, anyone using rvm will be operating with `umask u=rwx,g=rwx,o=rx`.

    * To start using RVM you need to run `source /etc/profile.d/rvm.sh`
    in all your open shell windows, in rare cases you need to reopen all shell windows.
    * Please do NOT forget to add your users to the rvm group.
    The installer no longer auto-adds root or users to the rvm group. Admins must do this.
    Also, please note that group memberships are ONLY evaluated at login time.
    This means that users must log out then back in before group membership takes effect!
    Thanks for installing RVM 🙏
    Please consider donating to our open collective to help us maintain RVM.

	```

	rvm -v
	如果提示

        -bash: rvm: command not found

	那就执行

        source /usr/local/rvm/scripts/rvm

2. 安装ruby

    sed -i 's!cache.ruby-lang.org/pub/ruby!ruby.taobao.org/mirrors/ruby!' $rvm_path/config/db
    apt install 2.5(可以通过apt list | grep ruby 查看版本情况,这里选择的最新的stable版本)


3. 安装rails

    切换镜像
        source 和 sources 都可以
        查看当前source：gem source -l

        移除当前source：gem source -r XXXXX

        添加可用的source：gem sources --add https://gems.ruby-china.com/
                          gem sources -a XXX

        更新cache：gem source -u 或:   
                   gem source -update

    gem install rails -V

4. 安装 apache2
    
    apt install apache2

    apt-get install apache2-dev


5. 安装redmine的apache支持，这样可以通过apache访问

    gem install passenger 

    passenger-install-apache2-module

6. 配置 mariadb-server

    CREATE DATABASE redmine CHARACTER SET utf8mb4 collate utf8mb4_general_ci;

    CREATE USER 'redmine'@'localhost' IDENTIFIED BY 'passredmine';

    GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'localhost';

7. 安装redmine

    git clone https://github.com/redmine/redmine

    cp database.yml.example database.yml

    并修改数据库用户名：redmine 密码
    


    邮件服务配置
    cd config
    cp configuration.yml.example configuration.yml

    ```

    # default configuration options for all environments
    default:
        # Outgoing emails configuration (see examples above)
        email_delivery:
            delivery_method: :smtp
            smtp_settings:
                address: smtp.163.com
                port: 25
                domain: 163.com
                authentication: :login
                user_name: "redmine@example.net"
                password: "redmine"

    ```

    gem install bundler


    通过bundle根据redmine下面的Gemfile安装所有需要安装的软件包

        bundle install (这一步不能使用root账户，必须使用其他账户)

8. Redmine配置

    rake generate_secret_token

    RAILS_ENV=production rake db:migrate

    RAILS_ENV=production rake redmine:load_default_data


9. 运行

    ruby bin/rails server webrick -e production

    运行上面的服务之后，我们就可以在浏览器中输入http://IP:3000 来测试

    
    初始用户名/密码：admin/admin

    但是这样启动之后中断窗口是不能关闭的，如果要像服务一样启动，得添加-d参数：

        ruby script/server webrick -e production -d

    如果想要关闭服务，可以通过查看该服务的PID来关闭：

        cat redmine/tmp/pids/server.pid
        kill -9 [PID]


10. 第一次登陆会提示更换密码

    passredmine





## 插件

https://91redmine.com/tag/redmine-institute/
