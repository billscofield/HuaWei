## git branch


### 查看分支

-a, --all
    List both remote-tracking branches and local branches. Combine with --list to match optional pattern(s).

-v, -vv, --verbose
    When in list mode, show sha1 and **commit subject line for each head**, along with relationship to upstream branch (if any).
    If given twice, print the path of the linked worktree (if any) and the name of the upstream branch,
    as well (see also git remote show <remote>). Note that the current worktree’s HEAD will not have its path printed (it will always be your current directory).

-l, --list
    List branches. With optional <pattern>..., e.g.  git branch --list 'maint-*', list only the branches that match the pattern(s).


    git branch --list       (list branches)
    git branch --list -v    (show commit subject line for each head)

### 创建分支

git branch [new branch] [head commit]
    仍然工作在之前的分支，并没有自动切到新创建的分支



### 删除分支

git branch (-d | -D) [-r] <branchname>...

    -d, --delete
        Delete a branch. The branch must be fully merged in its upstream branch, or in HEAD if no upstream was set with --track or --set-upstream-to.

    -D
        Shortcut for --delete --force.

    -r, --remotes
        List or delete (if used with -d) the remote-tracking branches. Combine with --list to match the optional pattern(s).



### 切换分支

git checkout [<branch>]
           To prepare for working on <branch>, switch to it by updating the index and the files in the working tree, and by pointing HEAD at the branch. Local modifications to the files in the working tree are kept, so that they can
           be committed to the <branch>.



### 创建并切换分支

git checkout -b|-B <new_branch> [<start point>]
    Specifying -b causes a new branch to be created as if git-branch(1) were called and then checked out.
    In this case you can use the --track or --no-track options, which will be passed to git branch. As a convenience, --track without -b implies branch creation; see the description of --track below.

    If -B is given, <new_branch> is created if it doesn’t exist; otherwise, it is reset. This is the transactional equivalent of
        -B 会覆盖已经存在的分支

        $ git branch -f <branch> [<start point>]
        $ git checkout <branch>

    that is to say, the branch is not reset/created unless "git checkout" is successful.

    都会自动切换到新的branch





### 修改分支

-f, --force
    Reset <branchname> to <startpoint>, even if <branchname> exists already. Without -f, git branch refuses to change an existing branch. In combination with -d (or --delete), allow deleting the branch irrespective of its
    merged status. In combination with -m (or --move), allow renaming the branch even if the new branch name already exists, the same applies for -c (or --copy).


