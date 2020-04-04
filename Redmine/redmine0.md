https://www.howtoing.com/how-to-install-redmine-with-nginx-on-ubuntu

https://www.cnblogs.com/jcchan/p/10400601.html


https://segmentfault.com/a/1190000002621640
https://my.oschina.net/u/614774/blog/1817557



apt install mysql-server mysql-client git subversion libmysqlclient-dev curl

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L get.rvm.io | bash -s stable

error:
	Try to install GPG v2 and then fetch the public key, put the recommanded command in the terinal and run, here is:
	gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

	and then 
		curl -L get.rvm.io | bash -s stable
	again
	
	```
	Primary key fingerprint: 7D2B AF1C F37B 13E2 069D  6956 105B D0E7 3949 9BDB                            │
	GPG verified '/home/myredmine/.rvm/archives/rvm-1.29.9.tgz'                                            │
	Upgrading the RVM installation in /home/myredmine/.rvm/                                                │
	    RVM PATH line found in /home/myredmine/.mkshrc /home/myredmine/.profile /home/myredmine/.bashrc /ho│
	me/myredmine/.zshrc.                                                                                   │
	    RVM sourcing line found in /home/myredmine/.profile /home/myredmine/.bash_profile /home/myredmine/.│
	zlogin.                                                                                                │
	Upgrade of RVM in /home/myredmine/.rvm/ is complete.                                                   │
													       │
	Thanks for installing RVM 🙏                                                                            │
	Please consider donating to our open collective to help us maintain RVM.                               │
													       │
	👉  Donate: https://opencollective.com/rvm/donate                     
	```
	Look at the above output, 
	
	source ~/.bashrc
	rvm -v

	```
	Maybe this should be deleted	
	VM并将其添加到.bashrc中进行自动重新加载：

	source /usr/local/rvm/scripts/rvm
	echo '[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"' >> ~/.bashrc
	```



检查Rvm是否安装成功
rvm -v

用Rvm安装ruby环境
rvm requirements    //此时会更新一大堆的依赖包，耐心等待即可。


rvm list known
rvm install ruby-2.3.0
rvm install ruby-2.6.3
	Install of ruby-2.6.3 - #complete 
	Ruby was built without documentation, to build it run: rvm docs generate-ri
rvm list
rvm use 2.6.3 --default
察看ruby的路径，就是RVM帮我们安装的
	which ruby



apt install gem

    查找默认源
    gem sources
    移除默认源
    gem sources --remove https://rubygems.org/
    添加新源
    gem sources -a https://mirrors.aliyun.com/rubygems/


rails框架可以使用gem install rails -v=5.2.3 进行安装，也可以通过bundle自已查找依赖进行安装 。


安装 bundle，如下：
    gem install rake
    gem install bundle



gem install rails --version=4.2  (还是不安装这个了，让bundle去安装吧)
    gem uninstall rails
    gem uninstall rails -v=x.x.x
    gem install rails --version=5.2

gem install bundler --version=1.17.3


提示Run `bundle install` to install missing gems.
    bundle install


rvm remove VERSION-NUMBER

To check rvm, ruby bundler
	rvm -v
	rails -v
	ruby -v
	bundler -v

## 配置用于redmine的MySQL数据库

```
create database redmine;
create user redmine@localhost identified by 'liujiao_redmine';
grant all privileges on redmine.* to redmine@localhost identified by 'redmine';
flush privileges;
```


## Nginx
由于nginx和ruby之间，以及passenger之间有依赖关系，查看网络上的安装配置，最后发现不能够直接apt-get install来安装，要从passenger中进行安装，步骤如下。

gem install passenger
apt-get install libcurl4-openssl-dev

使用passenger自带的一个命令来安装nginx，这句命令会自己下载最新版的nginx和编译的passenger module
	rvmsudo passenger-install-nginx-module

choose "ruby" and "auto install"

	Please specify a prefix directory [/opt/nginx]


## 配置Nginx 
 转到安装目录并使用编辑器编辑nginx.conf文件，我将在这里使用vim编辑器。

cd /opt/nginx/conf/
vim nginx.conf

将下面的配置行粘贴到文件中：

```
include vhost/*.conf;
	pay attension to the place where the command above is
```

保存并退出。

接下来，为虚拟主机配置创建一个新的“vhost”目录。

mkdir -p /opt/nginx/conf/vhost

转到vhost目录，并使用vim创建一个redmine虚拟主机配置文件：

cd /opt/nginx/conf/vhost/
vim redmine.conf

粘贴virtualhost配置如下：

    server {
        listen       80;
        server_name  www.redmine.me;

        root /var/www/redmine/public;
        passenger_enabled on;
        client_max_body_size      10m; # Max attachemnt size

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

保存并退出。 


/opt/nginx/sbin/nginx -t




systemctl daemon-reload
systemctl start nginx



## 安装Redmine
mkdir -p /var/www/

 转到'/ var / www /'目录，并使用svn命令下载redmine：

cd /var/www/
svn co https://svn.redmine.org/redmine/branches/3.2-stable redmine

输入redmine目录并复制配置文件和数据库配置文件：

cd redmine
cp config/configuration.yml.example config/configuration.yml
cp config/database.yml.example config/database.yml

然后用vim编辑database.yml文件：

vim config/database.yml

在生产线上填写数据库，数据库用户和密码的详细信息。 使用您在第3章中创建的数据库详细信息。

production:
  adapter: mysql2
  database: redmine
  host: localhost
  username: redmine
  password: "redmine"
  encoding: utf8

保存文件并退出编辑器。

在redmine目录中，创建一个新目录并将所有者更改为www-data：

mkdir -p tmp tmp/pdf public/plugin_assets
sudo chown -R www-data:www-data files log tmp public/plugin_assets
sudo chmod -R 775 files log tmp public/plugin_assets






然后安装Redmine的bundler和gem依赖项：

gem install bundler

bundle install --without development test
	**Don't run Bundler as root.**
	solution:
		su hjimi_shanghai_redmine
		vi ~/.bashrc
			export PATH=$PATH:(which ruby):(which bundle):(witch gem)...
bundle install --without development test
	Your user account isn't allowed to install to the system RubyGems.
	You can cancel this installation and run:

      	bundle install --path vendor/bundle

  	to install the gems into ./vendor/bundle/, or you can enter your password
  	and install the bundled gems to RubyGems using sudo.

	having add provileges to the dir, cannot either, solution is:
		bundle install --path vendor/bundle --without development test

		setfacl -m u:hjimi_shanghai_redmine:rwx /var/www/redmine/


现在生成秘密令牌，然后生成数据库：

bundle exec rake generate_secret_token
	ERROR: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.

	**edit the file manually**

RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake redmine:load_default_data

重新启动Nginx并使用Web浏览器访问redmine域：

systemctl restart nginx



## to solve the problem "Phusion Passenger"

一般我们的 web 应用不能使用 root 用户运行，所以我们先需要添加一个专门的部署用户

adduser rails-deploy
pass:yloped-sliar

Passenger 是一个比较好的 Rails 服务器，我们选择用它来运行 rails 并使用 Nginx 做反向代理


	When using RVM, you're always supposed to use 'rvmsudo' instead of 'sudo!'.

Reinstall this server with a normal user


