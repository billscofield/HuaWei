## 项目管理

节省编译时间




## 伪目标文件

.PHONY:clean
clean:
    rm -f ./*.o


main:say.o eat.o main.o ./inc/include.h
    gcc -o main main.o say.o eat.o


一般每个 .c 文件会有一个 .h 文件
