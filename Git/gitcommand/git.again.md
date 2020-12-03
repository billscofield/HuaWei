
##

约定：
    已经被tracked的文件: 已经commit过的文件，已经被加入到仓库的文件


---

工作区
    working directory
暂存区
    index, cache
仓库
    repository




工作区    ->       暂存区
    git add <file>

工作区    <-       暂存区
    **如果一个仓库从未commit过**，并且
    未加入到仓库的文件，刚刚add到stage的文件，拽回到 working directory
    git rm --cached <file>  //未加入到repository中的文件

    git add readme.md
    git rm --cached readme.md

---

    已加入到仓库的文件，做了修改，添加到了 stage, 拽回到 working directory
    即将该文件的 stage区 恢复到上次仓库提交时的状态

    git reset HEAD <file>
    这个也能用于未加入到仓库的文件, 只要是这个仓库进行过哪怕一次commit



工作区    <-       工作区
    已经被tracked的文件进行了修改, 现在想要摒弃这个修改

    git checkout -- <文件>




仓库      ->       之前某一次commit完成
    git reset <commit-id>
    git reset HEAD          // HEAD 最近的一次commit

    <commit-id>之后的操作会放到工作区


### git reset HEAD -- 文件 和 git rm --cached 文件 的区别

git reset HEAD -- 文件: 必须至少 commit 过一次
git rm --cached 文件  : 都可以
    不过当执行的是删除操作时，因为这个文件在工作区已经不存在了，就只能用 git reset HEAD -- <文件> 了
    如 git mv 的恢复



## git rm

原理是 rm , 然后 git add <文件>

恢复的方法:
    1. git reset HEAD <文件>        //暂存区恢复到HEAD状态
        也可以使用 git rm --cached <文件>
    1. git checkout -- <文件>       //工作区撤销修改

类似的还有 git mv, 


## git commit 

修复上次错误的提交信息

git commit --amend -m "修正过的提交信息"



## git log

最近的n次提交log
    git log -n

git log --pretty=oneline
git log --pretty=format:

    •   %H: commit hash
    •   %h: abbreviated commit hash
    •   %T: tree hash
    •   %t: abbreviated tree hash
    •   %P: parent hashes
    •   %p: abbreviated parent hashes
    •   %an: author name
    •   %aN: author name (respecting .mailmap, see git-
        shortlog(1) or git-blame(1))
    •   %ae: author email
    •   %aE: author email (respecting .mailmap, see git-
        shortlog(1) or git-blame(1))
    •   %ad: author date (format respects --date= option)
    •   %aD: author date, RFC2822 style
    •   %ar: author date, relative
    •   %at: author date, UNIX timestamp
    •   %ai: author date, ISO 8601-like format
    •   %aI: author date, strict ISO 8601 format
    •   %cn: committer name
    •   %cN: committer name (respecting .mailmap, see git-
        shortlog(1) or git-blame(1))

    •   %ce: committer email
    •   %cE: committer email (respecting .mailmap, see git-
        shortlog(1) or git-blame(1))
    •   %cd: committer date (format respects --date= option)
    •   %cD: committer date, RFC2822 style
    •   %cr: committer date, relative
    •   %ct: committer date, UNIX timestamp
    •   %ci: committer date, ISO 8601-like format
    •   %cI: committer date, strict ISO 8601 format
    •   %d: ref names, like the --decorate option of git-log(1)
    •   %D: ref names without the " (", ")" wrapping.
    •   %e: encoding
    •   %s: subject
    •   %f: sanitized subject line, suitable for a filename
    •   %b: body
    •   %B: raw body (unwrapped subject and body)
    •   %N: commit notes
    •   %GG: raw verification message from GPG for a signedcommit
    •   %G?: show "G" for a good (valid) signature, "B" for a bad
        signature, "U" for a good signature with unknown
        validity, "X" for a good signature that has expired, "Y"
        for a good signature made by an expired key, "R" for a
        good signature made by a revoked key, "E" if the
        signature cannot be checked (e.g. missing key) and "N"
        for no signature


## .gitignore

这个文件也需要 commit

```
*.b
!a.b        a.b文件除外,仍然会被追踪


/a.b        仅项目根目录下的a.b文件
/*/a.b      根目录下某个文件夹下的a.b文件
/**/a.b     根目录下所有文件和文件夹下的a.b文件

build/      build 目录下的所有文件

#           注释
```

对于空目录，忽略


## 分支 branch

显示所有分支
    git branch

创建分支
    git branch <branch-name>

    创建分支并切换到新建的那个分支

        git checkout -b <branch-name>

切换分支
    git checkout <branch-name>

    git checkout -              //轮换分支间切换

删除分支
    git branch -d <branch-name>

    可能出现的分支
        1. 不能删除所处的分支

        2. 支分支未被合并(merge), 可以使用 git branch -D <分支名>



支分支中所有未 commit 的操作会同步到其它分支

在另一个分支工作区中的文件，暂存区中的文件，在其它分支中也可以看到
但是commit之后，其它分支就看不到了


分支合并
    git merge <branch-name>
    将<branch-name>合并到当前分支

    1. 支分支增加了master的文件中的内容
        Fast-forward

    1. 支分支修改了master的文件的内容
        Fast-forward

    1. 支分支删除了master的文件的内容
        Fast-forward
        
    1. 支分支增加了新的文件
        Fast-forward

    1. 支分支删除了文件
        Fast-forward

撤销merge
    git merge --abort


查看所有分支的最后一次提交
    git branch -v


HEAD 指向当前分支
    .git/HEAD

    cat .git/HEAD
    ref: refs/heads/master

    git checkout dev
    cat .git/HEAD
    ref: refs/heads/dev


