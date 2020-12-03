
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


git commit --amend --reset-auther   // gitconfig user.xxx 后运行


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


## git config 

git config push.default 
    simple
    matching


•   simple - in centralized workflow, work like upstream with an added safety to refuse to push if the
    upstream branch’s name is different from the local one.

    When pushing to a remote that is different from the remote you normally pull from, work as
    current. This is the safest option and is suited for beginners.

    This mode has become the default in Git 2.0.

•   matching - push all branches having the same name on both ends. This makes the repository you are
    pushing to remember the set of branches that will be pushed out (e.g. if you always push maint and
    master there and no other branches, the repository you push to will have these two branches, and
    your local maint and master will be pushed there).

    To use this mode effectively, you have to make sure all the branches you would push out are ready
    to be pushed out before running git push, as the whole point of this mode is to allow you to push
    all of the branches in one go. If you usually finish work on only one branch and push out the
    result, while other branches are unfinished, this mode is not for you. Also this mode is not
    suitable for pushing into a shared central repository, as other people may add new branches there,
    or update the tip of existing branches outside your control.

    This used to be the default, but not since Git 2.0 (simple is the new default).



## 分支 branch

显示所有分支
    git branch -a

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

撤销 merge
    git merge --abort


查看所有分支的最后一次提交
    git branch -av


HEAD 指向当前分支
    .git/HEAD

    cat .git/HEAD
    ref: refs/heads/master

    git checkout dev
    cat .git/HEAD
    ref: refs/heads/dev

## git diff

工作区和暂存区文件的 diff
    git diff
    git diff <file>

暂存区和 commit 文件的 diff

    git diff --cached <file>                //默认 commit-id HEAD
    git diff --cached  <commit-id> <file>


## git push 

    git push -u origin master       // u 表示本地的master和远程的master进行关联

    -u, --set-upstream
        For every branch that is up to date or successfully pushed, **add upstream (tracking) reference**, used by
        argument-less git-pull(1) and other commands. For more information, see branch.<name>.merge in git-config(1).

## git remote 

git remote show

git remote show origin      // 会去仓库抓取信息

    ```
    ➜  console git:(master) ✗ git remote show origin
    * remote origin
    Fetch URL: https://github.com/billscofield/huawei.git
    Push  URL: https://github.com/billscofield/huawei.git
    HEAD branch: master
    Remote branch:
    master tracked
    Local branch configured for 'git pull':
    master merges with remote master
    Local ref configured for 'git push':
    master pushes to master (up to date)        // 如果落后了，会显示 local out of date

    ```


## 冲突合并

    修改了同一份文件，一定会产生冲突，一定需要 merge



    张三和李四同时 pull 远程仓库，对同一个文件同一行进行编辑, 造成冲突

    张三首先提交commit 到远程仓库

    李四提交commit, 并 pull 远程仓库, 提示进行人工合并




    ``` 张三提交commit, push 到远程仓库
    commit 4f2232cfdf698134dc34ce5a132739834c9585e2 (HEAD -> master, origin/master)
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 21:00:23 2020 +0800

    append by zhangsan

    commit 0dbdac5f422efcb9535b75848165b581f4dc34e8
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 20:56:29 2020 +0800

    initial
    ```


    ``` 李四提交commit, 
    commit 4c3524f859fc76eab1dc391d9cb2030547dd434b (HEAD -> master)
    Author: lisi <lisi@b.com>
    Date:   Thu Dec 3 20:59:20 2020 +0800

    append by lisi

    commit 0dbdac5f422efcb9535b75848165b581f4dc34e8
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 20:56:29 2020 +0800

    initial
    ```



    ```李四 pull 远程仓库
    * master                5c3524f [ahead 1, behind 1] append by lisi
    remotes/origin/HEAD   -> origin/master
    remotes/origin/master 4f2232c append by zhangsan

    ```


    ```李四合并commit后
    commit d57b21042adb4df1841cd8c75ae981abbe268401 (HEAD -> master)
    Merge: 4c3524f 4f2232c
    Author: lisi <lisi@b.com>
    Date:   Thu Dec 3 21:10:58 2020 +0800

    merge conf

    commit 4f2232cfdf698134dc34ce5a132739834c9585e2 (origin/master, origin/HEAD)
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 21:00:23 2020 +0800

    append by zhangsan

    commit 4c3524f859fc76eab1dc391d9cb2030547dd434b
    Author: lisi <lisi@b.com>
    Date:   Thu Dec 3 20:59:20 2020 +0800

    append by lisi

    commit 0dbdac5f422efcb9535b75848165b581f4dc34e8
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 20:56:29 2020 +0800

    initial

    ---

    ➜  two git:(master) git status
    On branch master
    Your branch is ahead of 'origin/master' by 2 commits.
      (use "git push" to publish your local commits)

      nothing to commit, working tree clean

    ```

      a(1 < -a)
       /    \
      /      \
     /        \
    a          \
     \          \
      \          \
       \          \
      b(1 <- b)   1<-b<-a --------- 1 <- b <- a <- merge

    origin/master 指向的是 a, 本地多了 b 和 merge 两个 commit, 这就是 "Your branch is ahead of 'origin/master' by 2 commits." 的含义吧





#### 

张三创建 zhangsan.txt 

张三提交commit， 并 push 到远程仓库

    ```
    commit da7d89ae655af84ceb1c894daa9e439bd956c255 (HEAD -> main, origin/main, origin/HEAD)
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 21:49:22 2020 +0800

        zhangsan

    commit ccb22724e84f49a3f2b2a77e27ccb6682de88939
    Author: Bill <billscofield@users.noreply.github.com>
    Date:   Thu Dec 3 21:47:12 2020 +0800

        Initial commit

    ```

李四创建 lisi.txt, 并提交 commit

李四 pull 远程仓库, 直接就进到 commit 文本

    ```
    commit e4ccc803e861c9151c476f0431012939e7e6aebc (HEAD -> main)
    Merge: 88d4ebd da7d89a
    Author: lisi <lisi@a.com>
    Date:   Thu Dec 3 21:50:08 2020 +0800

        Merge branch 'main' of https://github.com/billscofield/test into main

    commit 88d4ebd1a9a01fc6b12cf467bfbc3f9dfa8ba205
    Author: lisi <lisi@a.com>
    Date:   Thu Dec 3 21:49:31 2020 +0800

        lisi

    commit da7d89ae655af84ceb1c894daa9e439bd956c255 (origin/main, origin/HEAD)
    Author: zhangsan <zhangsan@a.com>
    Date:   Thu Dec 3 21:49:22 2020 +0800

        zhangsan

    commit ccb22724e84f49a3f2b2a77e27ccb6682de88939
    Author: Bill <billscofield@users.noreply.github.com>
    Date:   Thu Dec 3 21:47:12 2020 +0800

        Initial commit



    ---

    ➜  two git:(main) git status
    On branch main
    Your branch is ahead of 'origin/main' by 2 commits.
      (use "git push" to publish your local commits)

    nothing to commit, working tree clean

    ```









