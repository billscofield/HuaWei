
## git checkout 

git checkout 历史提交点

git add . 
git commit -m "..."

git branch 分支名 提交点    //创建分支

## git stash

情景如下： 
1、在dev分支，创建一个新文件test6.txt。并add它，让它stage。

2、这时切回master分支，你会看到这个test6.txt居然也在master分支里。但它实际上是属于dev分支的。怎么办？

3、git stash就有作用了。切回dev分支，执行git stach。这时git bash会告诉你： 
“Saved working directory and index state WIP on newF2: b63fbcb add test6.txt 
HEAD is now at b63fbcb add test6.txt”。 
它已经把test6.txt的现场保存好了。

4、这时你在切回master分支，test6.txt就消失了。 


另外：没有被stage或者head的文件，是无法被 stash的。而且会显示在各个分支里。让你迷惑它到底该属于哪个分支。 

所以stash起作用的全是stage 或者 head 的文件。

理论来自官网，“也就是你修改过的被追踪的文件和暂存的变更——并将它保存到一个未完结变更的堆栈中，随时可以重新应用。” 
