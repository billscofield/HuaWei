
git submodule 更新url 操作步骤

1. .gitmodules 中submodule的url；
2. .git/config 文件中 submodule的url;
3. 删除 .git/modules目录下已有的 submodule文件夹；
4. 到这个工程的根目录下删除 submodule文件夹；
5. 执行 
    git submodule sync
    git submodule update --init
