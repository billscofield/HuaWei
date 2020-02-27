
## git rm 

### git rm --cached


文件已经被追踪
修改工作区文件(此时工作区文件和暂存区不一致)
git rm 文件
提示使用--cached 还是 -f
git rm --cached 文件 (删除暂存区文件，保留工作区文件)
git add 文件 (将文件添加到暂存区，git识别为修改)

    ```

    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js

    (liujiao) ➜  one git:(master) ✗ ls
    index.html  js.js  style.css
    (liujiao) ➜  one git:(master) ✗ vi style.css
    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   style.css

    (liujiao) ➜  one git:(master) ✗ git rm style.css
    error: the following file has local modifications:
        one/style.css
    (use --cached to keep the file, or -f to force removal)
    (liujiao) ➜  one git:(master) ✗ git rm --cached style.css
    rm 'one/style.css'
    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js
            deleted:    style.css

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            style.css

    (liujiao) ➜  one git:(master) ✗ git add style.css
    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js
            modified:   style.css
    ```



### git rm -f

删除工作区和暂存区文件，并且将这次删除放入暂存区。

文件已经被追踪
修改工作区文件(此时工作区文件和暂存区不一致)
git rm 文件
提示使用--cached 还是 -f
git rm -f 文件 (删除暂存区文件，删除工作区文件, 并且将这次删除放入暂存区)

    ```

    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   style.css

    (liujiao) ➜  one git:(master) ✗ ls
    index.html  js.js  style.css
    (liujiao) ➜  one git:(master) ✗ git rm style.css
    error: the following file has local modifications:
        one/style.css
    (use --cached to keep the file, or -f to force removal)
    (liujiao) ➜  one git:(master) ✗ git rm -f style.css
    rm 'one/style.css'
    (liujiao) ➜  one git:(master) ✗ git status
    On branch master
    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
            new file:   js.js
            deleted:    style.css


    ```
