
## 

npm install -g cnpm

cnpm -v

npm install -g hexo-cli

hexo -v

mkdir /hexo-blog && cd /hexo-blog

hexo init


hexo server
    会在 localhost:4000 端口启动


create a new post
    hexo new '文章'

    路径是：/hexo-blog/source/_posts/xxx.md

Generate static files

    hexo generate


Run server
    hexo server

    虽然显示的是localhost:4000, 但是看 hexo server --help 发现

    -i, --ip            Override the default server IP. Bind to all IP address by default.

    默认是0.0.0.0的


cnpm install --save hexo-deployer-git


```vi _config.yml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
 deploy:
   type: 'git'
   repo: https://github.com/billscofield/billscofiel.io.git
   branch: master

```

Deploy to remote sites 部署到github

    hexo deploy

换主题
    git clone https://github.com/litten/hexo-theme-yilia.git theme/yilia

    vi _config.yml
        theme: yilia




