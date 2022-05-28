# 数据结构

[视频链接](https://www.bilibili.com/video/BV1X541187ra?spm_id_from=333.999.0.0)

数据结构包含三个方面的内容

1. 逻辑结构
    1. 线性表
        可以插队
    2. 栈
    3. 队列
        不可以插队
    4. 二叉树

2. 存储结构
    1. 顺序存储
    2. 链式存储
        不需要成片的空间
    3. 哈希存储

3. 算法
    1. 初始化
    2. 插入
    3. 删除
    4. 查询
    5. 旋转

## 线性表 顺序存储 初始化，插入，删除，查询

判断是否为空或满，销毁

线性表 + 顺序存储 = 线性表

组成
    数组
    最后元素的下表

```
#include <stdio.h>
#include <string.h>
#include <errno.h>

typedef int datatype;

#define SIZE 10

struct sequence_list
{
    datatype data[SIZE];
    int last;
};

struct sequence_list *init_list(void){
    struct sequence_list *sl = mallow(sizeof(struct sequence_list));
    if(sl != NULL)
        sl->last = -1;
    return sl;
}

int main(int argc, char const * argv[]){
    stuct sequence_list *sl = NULL;
    sl = init_list();
    if(sl == NULL){
        printf("init list failed: %s\n",strerror(errno));
        exit(1);
    }
}
```


```
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <stdbool.h>

typedef int datatype;

#define SIZE 10

typedef struct sequence_list
{
    datatype data[SIZE];
    int last;
}*list;

struct sequence_list *init_list(void){
    struct sequence_list *sl = mallow(sizeof(struct sequence_list));
    if(sl != NULL)
        sl->last = -1;
    return sl;
}


# 判断是否满
bool is_full(list sl){
    return sl->last >= SIZE - 1;
}


# show
void show_list(list sl){
    //if(is_empty(sl)){
        //return;
    //}
    int i;
    for(i=0; i<=sl->last; i++){
        printf("%d\t",sl->data[i]);
    }
    printf("\n");
}


# 增加
bool insert_list(datatype n, list sl){
    if(is_full(sl)){
        return false;
    }

    int pos;
    for(pos=0; pos < sl->last; pos++){
        if(sl->data[pos] > n)
            break;
    }

    int j;
    for(j=sl->last; j>=pos; j--){
        sl->data[j+1] = sl->data[j];
    }

    sl->data[j+1] = n;
    sl->last++;
}


bool is_empty(list sl){
    return sl->last == -1;
}


bool remove_list(datatype n, list sl){
    if(is_empty(sl)){
        return false;
    }

    int pos;
    for(pos=0; pos<=sl->last; pos++){
        if(sl->data[pos] == n){
            break;
        }
    }

    if(pos > sl->last){
        return false;
    }

    int i;
    for(i=pos+1; i<=sl->last; i++){
        sl->data[i-1] = sl->data[i];
    }
    sl->last--;
    return true;
}




int main(int argc, char const * argv[]){
    list sl = init_list();
    if(sl == NULL){
        printf("init list failed: %s\n",strerror(errno));
        exit(1);
    }

    int n;
    while(1){
        scanf("%d", &n);
        
        if(n > 0){
            if(insert_list(n,sl)){
                show_list(sl);
            }else{
                printf("insert failed\n");
                exit(2);
            }
        }else if(n < 0){
            if(remove_list(-n,sl)){
                show_list(sl);
            }else{
                printf("remove failed\n");
                exit(3);
            }
        }else{
            break;
        }
    }
}
```

## 链表: 链式存储的线性表

单向链表(单链表)

+------+--------------+
| data | next pointer |
+------+--------------+

只存放一个指针，指向下一个 data

算法:
    1. 初始化
    2. 插入
    3. 删除
    4. 遍历
    5. 判断是否为空(没有满的概念,除非物理极限)
    6. 移动
    7. 销毁

1. 设计节点

    ```
    struct node{
        datatype data;
        struct node *p;
    };
    ```

2. 空链表

    头指针，指向第一个节点
        H - > 头节点, 头节点的 next 指向 NULL
        头节点没有有效数据
    
    最后一个节点指向

例子:
用单链表实现数据逆转, 要求如下:

1. 设计一个空的单链表, 以证书作为节点
2. 向单链表中不断插入节点
3. 输入非数字，完成链表的建立
4. 逆转链表中的节点。（比如原有节点是 4、2、8、6、1 逆转后变成 1、6、8、2、4）

原理

    插入
        new->next = p->next
        p->next = new;
        顺序不可以更换

    删除
        tmp = pre-next
        pre->next = del->next
        tmp->next = NULL



    ```
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    typedef int datatype;

    struct node{
        datatype data;
        struct node *next;
    }node, *list;

    list init_list(void){
        list head = malloc(sizefof(struct node));
        if(head != NULL){
            head->next = NULL;
        }

        return head;
    }


    list new_node(datatype n){
        list new = malloc(sizeof(node));
        if(new != NULL){
            new->data = n;
            new->next = NULL;
        }
        
        return new;
    }


    void show_list(list head){
        list tmp = head->next;
        while(tmp){
            printf("%d\t",tmp->data);
            tmp = tmp->next;
        }
        printf("\n");
    }


    void insert_list(list new, list head){
        if(new = NULL)
            return;
        
        list p = head;
        
        while(p->next != NULL){
            p = p->next;
        }
        
        new->next = p->next;
        p->next = new;
    }



    int main(void){
        list head = init_list();
        if(head == NULL){
            printf("init failed\n");
            exit(1);
        }
    }

    int n;
    while(1){
        int ret = scanf("%d",&n);
        if(ret != 1)
            break;

        list new = new_node(n);

        insert_list(new,head);
    }

```





## float

https://www.jb51.net/article/57217.htm

```
### 其他特殊表示

1. 当指数部分和小数部分全为0时,表示0值,有+0和-0之分(符号位决定),0x00000000表示正0,0x8000 0000表示负0. 

2. 指数部分全1,小数部分全0时,表示无穷大,有正无穷和负无穷,0x7f800000表示正无穷,0xff800000表示负无穷. 

3. 指数部分全1,小数部分不全0时,表示NaN,分为QNaN和SNaN,Java中都是NaN. 

结论: 可以看出浮点数的取值范围是:2^(-149)~~(2-2^(-23))*2^127,也就是Float.MIN_VALUE和Float.MAX_VALUE.

精度

float和double的精度是由尾数的位数来决定的。浮点数在内存中是按科学计数法来存储的，其整数部分始终是一个隐含着的“1”，由于它是不变的，故不能对精度造成影响。

float：2^23 = 8388608，一共七位，这意味着最多能有7位有效数字，但绝对能保证的为6位，也即float的精度为6~7位有效数字；
```
