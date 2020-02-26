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

mkdir project_one
cd project_one
hexo init

或者 直接 hexo 项目  //会在当前文件夹创建"项目"文件夹

cd project_one
npm install    //安装依赖
hexo serve

hexo generate   //hexo g 缩写形式  生成静态网站站点,生成好的public文件夹直接当成静态网站进行部署即可

### github操作
和用户名同名的项目

vi _config.yml

    ```
    deploy:
        type: git
        repo: git地址
        branch: master
    ```
hexo g -d   //部署到github上，修改后重新部署也是这条命令

source / _post: 博客内容目录

## 主题修改
hexo官网 / themes

重新部署 hexo g -d 


## 图床
七牛



## 第三方评论
来必力
畅言-貌似要做备案






