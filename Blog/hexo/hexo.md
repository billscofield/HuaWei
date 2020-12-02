## what is hexo

a fast, simple & powderful blog framework

## install 

1. node.js
    apt install nodejs    
    apt install npm
        如果出现npm不支持的情况，请升级npm
        npm install npm@latest -g
    npm 更换taobao源
        npm config get registry 或者 npm config list   //查看源 
            https://registry.npmjs.org
            **npm config list 比较全面，上面有配置文件的路径**
        npm config set registry https://registry.npm.taobao.org
        临时改的话
            npm --registry=https://registry.npm.taobao.org

1. git

1. hexo
    npm install -g hexo-cli


## create project

方式一:
    mkdir project_one
    cd project_one
    hexo init

方式二:
    或者 直接 hexo 项目  //会在当前文件夹创建"项目"文件夹


升级 Yarn(非必须)
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash


cd project_one
npm install    //安装依赖
hexo serve

hexo generate   //hexo g 缩写形式  生成静态网站站点,生成好的public文件夹直接当成静态网站进行部署即可


## hexo 命令

Usage: hexo <command>

Commands:
    clean     Remove generated files and cache.
    config    Get or set configurations.
    deploy    Deploy your website.
    generate  Generate static files.
    help      Get help on a command.
    init      Create a new Hexo folder.
    list      List the information of the site
    migrate   Migrate your site from other system to Hexo.
    new       Create a new post.
    publish   Moves a draft post from _drafts to _posts folder.
    render    Render files with renderer plugins.
    server    Start the server.
    version   Display version information.

Global Options:
    --config  Specify config file instead of using _config.yml
    --cwd     Specify the CWD
    --debug   Display all verbose messages in the terminal
    --draft   Display draft posts
    --safe    Disable all plugins and scripts
    --silent  Hide output on console

### hexo 目录结构

    ```
    ➜  blog tree -L 1
    .
    ├── _config.yml
    ├── node_modules
    ├── package.json
    ├── scaffolds
    ├── source
    ├── themes
    └── yarn.lock

    ```



### github操作

和用户名同名的项目

```

vi _config.yml


    deploy:
        type: git
        repo: git地址
        branch: master

hexo g -d   //部署到github上，修改后重新部署也是这条命令

source / _post: 博客内容目录

```

## 主题修改

hexo官网 / themes

重新部署 hexo g -d 

### next主题


#### Installation

The simplest way to install is to clone the entire repository:

$ cd hexo
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
Or you can see detailed installation instructions if you want any other variant.


#### Plugins

NexT supports a large number of third-party plugins, which can be easily configured.

For example, if you want to enable pjax on your site, just set pjax to true in NexT config file:

```
# Easily enable fast Ajax navigation on your website.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: true
```

Then visit the «Dependencies» link to get the installation instructions of this module.



#### Configure CDN

If you want to specify a CDN link for any plugins, you need to set / update the CDN link.

For example, if you want to use mediumzoom and load the plugin via CDN, go to NexT config and see:

```
vendors:
    # ...
    # Some contents...
    # ...
    mediumzoom: # Set or update mediumzoom CDN URL.

```


#### Update

NexT releases new versions every month. You can update to latest master branch by the following command:

    ```
    $ cd themes/next
    $ git pull
    ```

And if you see any error message during update (something like «Commit your changes or stash them before you can merge»), recommended to learn Hexo data files feature.
However, you can bypass update errors by using the Commit, Stash or Reset commands for local changes. See here how to do it.

If you want to update from v5.1.x to the latest version, read this


#### 配置

更换 next 中的主体scheme

    cd themes/next
    vi _config.yml
    定位 scheme, 选择一个取消注释


1. LeanCloud
    通知：
    我们对中国华北节点的云引擎服务中已不再提供服务的公网 IP 做了一次清理，如果你的云引擎自定义域名以前是通过 A 记录解析到这些不再使用的 IP 上的话，请参考博客中"云引擎服务"章节来使用独立 IP 入口或加速节点入口。


https://blog.csdn.net/qq_40930491/article/details/87902310
https://blog.csdn.net/sinat_37781304/article/details/82729029

https://tholman.com/github-corners/



## 图床

七牛



## 第三方评论
来必力
畅言-貌似要做备案






