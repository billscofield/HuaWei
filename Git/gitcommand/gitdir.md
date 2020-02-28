## .git 文件夹

git cat-file 文件   
    Provide content or type and size information for repository objects
    查看文件类型

    -t
        Instead of the content, show the object type identified by <object>.
        
        例如返回 commit, tag ...
   -s
        Instead of the content, show the object size identified by <object>.

   -p
        Pretty-print the contents of <object> based on its type.
        单独使用，不和 -t -s 连用
        
        ```
        (liujiao) ➜  heads git:(master) git cat-file -p master
        tree fa8ced73bb449547c279cba3b652781eabfd1ffb
        parent bd148332ddc3a5462073419ceaaab932a6bec1cb
        author bill <bill@bill.com> 1582847033 +0800
        committer bill <bill@bill.com> 1582847033 +0800

        ```



### HEAD

例
    ref: refs/heads/fromstylecss
    ref: refs/heads/master


指向当前工作的分支

### config 

当前git配置文件

### refs 目录

heads 目录
    各个分支的名称
    
    比如 master 里边存放的是这个master分支的最新的commit 

    
tags 目录
    或里程碑


### objects 目录

有很多2个字符的文件夹
    将这2个字母 和 里边的文件组合起来
    git cat-file -t 上面的组合
        返回 tree   有的返回 tree ,有的返回commit, 有的返回blob

        ```
        (liujiao) ➜  objects git:(master) cd 2f
        (liujiao) ➜  2f git:(master) ls
        5958f63b2b2a5a43b5d999938c2986bd7fdfb7

        (liujiao) ➜  2f git:(master) git cat-file -t 2f5958f63b2b2a5a43b5d999938c2986bd7fdfb7
        tree

        (liujiao) ➜  2f git:(master) git cat-file -p 2f5958f63b2b2a5a43b5d999938c2986bd7fdfb7
        040000 tree 5dbb024b440a1fde8b4d9f013804ac7aa769365a    one

        (liujiao) ➜  2f git:(master) git cat-file -t 5dbb024b440a1fde8b4d9f013804ac7aa769365a
        tree

        (liujiao) ➜  2f git:(master) git cat-file -p 5dbb024b440a1fde8b4d9f013804ac7aa769365a
        100644 blob 3ae7f42097249e8b8243f9d1029be1624dfcd184    index.html
        100644 blob 7b4dcb5b597195d0469fec0787c2a7b7a4656d81    js.js
        100644 blob 2eedbfe4c23d1a38cd15c7e096e42fa2895bdc25    style.css

        (liujiao) ➜  2f git:(master) git cat-file -t 3ae7f42097249e8b8243f9d1029be1624dfcd184
        blob

        (liujiao) ➜  2f git:(master) git cat-file -p 3ae7f42097249e8b8243f9d1029be1624dfcd184
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title></title>
        </head>
        <body>
            <h1>Hello Git</h1>
        </body>
        </html>
        ```

        一个 commit 有一棵 tree 
        tree 就是某个commit的快照, tree 里有blob（具体的文件,目录）
        blob 就是文件内容，只要文件内容一致，在git里就是唯一的一个blob

        
info文件夹
pack文件夹
