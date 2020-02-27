## git restore

## git restore --staged

撤销对暂存区的删除

文件已经被追踪到commit


## git restore --worktree (默认)

撤销对工作区的删除

文件已经被追踪到commit


(liujiao) ➜  one git:(master) ✗ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   js.js
        deleted:    style.css


--- 撤销在暂存区的删除
(liujiao) ➜  one git:(master) ✗ git restore --staged style.css
(liujiao) ➜  one git:(master) ✗ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   js.js

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    style.css


--- 撤销在工作区中的删除
(liujiao) ➜  one git:(master) ✗ git restore --worktree style.css
(liujiao) ➜  one git:(master) ✗ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   js.js


