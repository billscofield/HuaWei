## 起源和发展
Linux -> Linux -> no svn -> bitKeeper -> git

git - the stupid content tracker


## 安装
https://git-scm.com

sudo apt-get install git

## 配置
/etc/gitconfig
~/.gitconfig
.git/config

git config --system/global/local --list
  如果没有找到配置文件，会进行提示

git config --system/global/local -e
git config --system/global/local user.name 姓名
git config --gloal --unset user.name

    --system:这台计算机上的所有用户
        对应 /etc/gitconfig

    --global:当前用户的所有仓库
        对应 /r
dpkg -i you 
a
apt update
pt install -f
y
aot/.gitconfig

    --local :仅当前用户的当前仓库
          对应 .git/config

user.name
user.email
color.ui
push.default
commit.template
core.editor

## Init
git init
git init [path]
git clone -o [自定义远程主机名] [地址] [本地名字]
    -o <name>, --origin <name>
        Instead of using the remote name origin to keep track of the upstream repository, use <name>.


## zone

1. start a working area (see also: git help tutorial) 工作区
   clone             Clone a repository into a new directory
   init              Create an empty Git repository or reinitialize an existing one


2. stage/index area 暂存区

work on the current change (see also: git help everyday)
    add               Add file contents to the index
    mv                Move or rename a file, a directory, or a symlink
    restore(恢复)     Restore working tree files and index tree files
        --staged [file]
            将在index/stage 中的文件恢复到 worktree

        --worktree(默认) [file]
            将文件在worktree中做的修改恢复，

        将一个已经被跟踪的文件，在worktree中修改，git add 添加到 stage中，然后在worktree 中再次对其修改    
        此时先 git restore --stage [file], 这是 file 文件中保留着两次的修改
        如果两次的修改是针对同一处的，则最后一次的修改生效
        

    rm                Remove files from the working tree and from the index

        **git rm 与 git restore 的关系**

                untracked
                -------------------------------------
                |       tracked                     |
        --------|--------- ------------- --------   |
        | work  | work   | |stage/index| |commit|   |
        --------|--------- ------------- --------   |
                -------------------------------------

        删除工作区文件，
        并且将这次删除放入暂存区。
        要删除的文件是没有修改过的，就是说和当前版本库文件的内容相同。
        然后提交, 成功地删除了版本库文件

        文件已经在版本库，
        将文件在worktree中修改，
        ! add到stage/index  或者 没有这个步骤
        git rm 文件 
            报错 
            error: the following file has changes staged in the index:
            one/style.css
            (use --cached to keep the file, or -f to force removal)

            git rm --cached : 删除暂存区文件，但保留工作区的文件，并且将这次删除放入暂存区, 等待提交.




        ---
        git rm -f 命令

        1. 作用： 删除工作区和暂存区文件，并且将这次删除放入暂存区。
        2. 注意： 要删除的文件已经修改过，就是说和当前版本库文件的内容不同。
            
    sparse-checkout   Initialize and modify the sparse-checkout

3. worktree
    已经被跟踪的文件
    git restore --worktree [file]

4. stage/index

5. examine the history and state (see also: git help revisions) 版本库（commit History）：存放已经提交的数据。
   bisect            Use binary search to find the commit that introduced a bug
   diff              Show changes between commits, commit and working tree, etc
   grep              Print lines matching a pattern
   log               Show commit logs
   show              Show various types of objects
   status            Show the working tree status




git add/rm <file>..." to update what will be committed"
    就是放到暂存区(index)
    没有添加到index 的就用 add
    暂存区index中有的就用 rm

git-rm - Remove files from the working tree and from the index
git rm 


git add -u 
    -u, --update
        Update the index just where it already has an entry matching <pathspec>. This removes as well as modifies index entries to match the working tree, but adds no new files.

        If no <pathspec> is given when -u option is used, all tracked files in the entire working tree are updated (old versions of Git used to limit the update to the current directory and its subdirectories).

        更新已经跟踪过的




* git add -p(--patch) . //交互式

* git mv [file]

* git rm --cached [file]
* git checkout -- [file]
    Updates files in the working tree to match the version in the index or the specified tree. 
    If no pathspec was given, git checkout will also update HEAD to set the specified branch as the current branch.

    * 另一种删除修改的方式,同时适用于index
    * git stash save [msg]
    * git stash drop [stash]

* git reset HEAD [file]

* git commit 
    * -m 
    * -v

* git cat-file -p [commit]
* git rev-parse [短commit]

## branch


git-checkout
    Switch branches or restore working tree files

    git checkout [<branch>]
           To prepare for working on <branch>, switch to it by updating the index and the files in the working tree, and by pointing HEAD at the branch. Local modifications to the files in the working tree are kept, so that they can
           be committed to the <branch>.


    git checkout -b|-B <new_branch> [<start point>]
        Specifying -b causes a new branch to be created as if git-branch(1) were called and then checked out. 
        In this case you can use the --track or --no-track options, which will be passed to git branch. As a convenience, --track without -b implies branch creation; see the description of --track below.
         
        If -B is given, <new_branch> is created if it doesn’t exist; otherwise, it is reset. This is the transactional equivalent of
            -B 会覆盖

            $ git branch -f <branch> [<start point>]
            $ git checkout <branch>
            
        that is to say, the branch is not reset/created unless "git checkout" is successful.

        都会自动切换到新的branch



git checkout -b [new branch] [branch-base]
git checkout -b [new branch] [commit]
git checkout -b [new branch] -t [origin/master]

**git branch --track [new branch] [origin/master]  // 与远程主机建立了联系**

git checkout -

git branch --set-upstream-to=origin/master master

git branch -d
git branch -D //强制删除

git push origin --delete [branch name] //删除远程主机上的 branch name
git push origin :master
git branch -dr origin/master

git cherry-pick [commit]

别人删除了某个分支，你自己运行 git branch -r 显示还在，此时可以运行
    * git remote prune [origin] --dry-run 查看本地数据库中，哪些分支将会删除
    * 确认无误后 git remote prune origin 进行同步本地的远程分支和remote

git branch -vv 后,远程端显示为gone的也是应该在本地进行删除的

## 思考

  * git fetch 下来的remote分支如何删除？
  * git prune, git remote prune, git fetch --prune 三者异同？
stash
 对当前的暂存区和工作区状态进行保存

git stash 'msg'

git stash save 'msg'

git stash list

git stash drop
  * 如果没有写 具体的stash ,则删除最后一个
  * 删除了就不能恢复了

git stash pop 

git stash apply

**git stash pop/apply --index **: 同时恢复工作区 和 暂存区;
  * 没有--index,stash之前在暂存区中的内容也会恢复到工作区

**git stash show [stash]**
  * show the changes recorded in the stash as a diff between the stashed state and it's original parent(最近一次提交)
  * 不论是 工作区 还是 暂存区 ，将两个区域合在一起和HEAD作diff

**git stash save --all/--include--untracked msg**
  * --all : 会把.ignore中的文件也包含进来，且包含未被追踪的文件
  * --include-untracked : 包含未被跟踪的文件

git stash clear

*git stash branch [branch name] [stash]* 基于进度创建分支,并进入该分支

## remote

git remote 

git remote -v

git remote show

git remote add

git remote remove

git remote rename

git remote set-url 
git remote set-url --add [origin] [新地址]

git push origin master:master
git push -u origin master:master //同时track远程分支
git push origin --force

git pull origin master:master
git pull --rebase origin master
git fetch origin master

git merge origin/master
git rebase origin/master

git remote update [origin]

## revert
* git revert -m 撤销这个 commit
* 区别于 git reset 恢复至这个 commit

## ssh
* cd ~/.ssh
* ssh-keygen -t rsa -C "email"
* ssh add id_rsa
* cat id_rsa.pub
* ssh -T git@gitee.com

## tag
* git tag --list/-l
* git tag [tag name]
* git tag -a [tag name] -m [msg]
* git tag -d [tag name]
* git push origin [tag name]
* git push origin --tags
* **git show [tag name]**
* **git push origin --delete tag <tagname>**
* git fetch origin tag [tagname]
* 注意

## log
* git rebase -i 
* git rebase --continue
* git rebase --abort
* git commit --amend
    * git commit --amend --date="$(date -R)" 
* git shortlog -sn




* git log
    * --decorate
    * --committer=
        * format
            * %H	提交对象（commit）的完整哈希字串
            * %h	提交对象的简短哈希字串
            * %T	树对象（tree）的完整哈希字串
            * %t	树对象的简短哈希字串
            * %P	父对象（parent）的完整哈希字串
            * %p	父对象的简短哈希字串
            * %an	作者（author）的名字
            * %ae	作者的电子邮件地址
            * %ad	作者修订日期（可以用 -date= 选项定制格式）
            * %ar	作者修订日期，按多久以前的方式显示
            * %cn	提交者(committer)的名字
                * fork -> pull request -> accept & merge -> 重新从项目所有者那里clone -> git log --pretty=format:"%h %an %cn"
            * %ce	提交者的电子邮件地址
            * %cd	提交日期
            * %cr	提交日期，按多久以前的方式显示
            * %s	提交说明
    * --grep=
        * --all-match:Limit the commits output to ones that match all given --grep, instead of ones that match at least one.
        * -i / --regexp-ignore-case:不区分大小写
    * -S [string]
        * 根据源代码中某些字符串的 增加 和 删除 来搜索提交。
    * -p(--patch)
        * Generate patch 
    * --shortstat 只显示 --stat 中最后的行数修改添加移除统计。
    * --name-only 仅在提交信息后显示已修改的文件清单。
    * --name-status 显示新增、修改、删除的文件清单。
    * --pretty 使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。

### 推荐用法
* **git log -p --follow -- [file]**
* git blame [file]
     
## diff
* git diff [file]
* git diff [commit] [file]
* git diff --cached [file]
* git diff [commit1] [commit2]
* git diff [branch1] [branch2]

## Reset
* git reset --soft [commit]
    * doesn't touch the WORKING AREA && the INDEX, changes after the [commit] is pushed into the INDEX
* git reset --mixed [commit]
    * doesn't touch the WORKING AREA , the INDEX is set to the same state as [commit] ,and changes after [commit] is pushed into the WORKING AREA
* git reset --hard [commit]
    * touch the WORKING AREA && INDEX, the changes after [commit] is regarded as garbase and throwed.

git reset --hard
    Resets the index and working tree. Any changes to tracked files in the working tree since <commit> are discarded.


* 改动的部分都会同步至[commit]
* 注意^与~之间的区别，当存在多个分支时，^可以用来选择分支，HEAD~i永远只选择第i级父节点的第一个分支，HEAD~i^2选择第i级父节点的第二个分支，以此类推；HEAD^=HEAD^1=HEAD~1；如果没有分支，只有一条主线，则HEAD^^^=HEAD^1^1^1=HEAD~3，如果该级几点有第二个分支，则表示为：HEAD^^^2 = HEAD~2^2. 

## show
* git show --name-only [commit]

## :
* git push origin master:master
* git pull origin master:master
* git pull --rebase origin master

## /
* git branch --set-upstream-to=origin/master master
* git merge origin/master
* git rebase origin/master
* git branch -dr origin/master
* git branch [new branch] origin/master

## Github
* 如果你想要参与某个项目,但是并没有推送权限,这时可以对这个项目进行“派生”。 派生的意思是指,GitHub 将在你的空间中创建一个完全属于你的项目副本,且你对其具有推送权限。
* 人们可以派生这个项目,将修改推送到派生出的项目副本中,并通过创建合并请求(Pull Request)来让他们的改动进入源版本库

* GitHub常用的开发协同流程为
    1. 将别人的仓库fork成自己的origin仓库 
    1. git clone origin仓库到本地 
    1. 本地添加fork源仓库  
    1. 工作前先git remote update下fork源保持代码较新 
    1. coding 
    1. push回自己 
    1. github上提出Push Request即可
