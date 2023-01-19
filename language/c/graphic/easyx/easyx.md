
graphics.h
    包含已经淘汰的函数
easyx.h
    只包含最新的函数



initgraph(800,600);
while(1);
closegraph();
return 0;

HWND initgraph(
    int width,
        int height,
        int flag = NULL
    );

        flat:
            SHOWCONSOLE     保留控制台的显示
            NOCLOSE         不能关闭
            NOMINIMIZE      不能最小化
            NOCLOSE | NOMINIMIZE

关闭绘图窗口。
    void closegraph();

使用当前背景色清空绘图设备。
    void cleardevice();

---

颜色设置
    
    setbkcolor(颜色)
        颜色宏： RED , F12 跳到定义处
        RGB: RGB(100,125,200)

        setbkcolor(RED);
        // 使用当前背景色清空绘图设备
        cleardevice();


---

```
void setlinecolor(COLORREF color);


void setlinestyle(
    int style,
    int thickness = 1,
    const DWORD *puserstyle = NULL,
    DWORD userstylecount = 0
);

void line(int x1, int y1, int x2, int y2)
void circle(int x, int y, int radius)
    void fillcircle(int x, int y, int radius)   //画有边框的填充圆
    void solidcircle(int x, int y, int radius)  // 画无边框的填充圆
void rectangle(int left, int top, int right, int bottom)
    setfillcolor(RED)
    void fillrectangle()
    void solidrectangle()

```

circle      圆
ellipse     椭圆
pie         扇形
polygon     多边形
rectangle   矩形
roundrect   圆角矩形
line
putpixel    点



文字
    outtextxy(int x, int y, LPCTSTR str)
        LPCTSTR
            1. L'hello'
            2. TEXT('hello')
            3. 设置多字符字符集, "hello"
    settextcolor(RED)
    settextstyle

    用于设置当前设备图案填充和**文字**输出时的背景模式 ??
        setbkmode(TRANSPARENT)

    文字居中

    fillrectangle(200,50,500,100);
    char arr[] = "文字居中";
    int txtwidth = textwidth(arr);          // 获取字符串实际占用的像素宽度。
    int txtheight = textheight(arr);
    int newx = 
    outtextxy(200,50,"文字居中");

---

贴图

    1. 原样贴图


    ```
    initgraph(900,900);
    IMAGE img;
    //.cpp 的相对路径
    // 项目 / 项目属性 / 高级 / 高级属性 / 字符集：使用多字节字符集
    loadimage(&img, "./mm.jpeg");
    putimage(0,0,&img);
    while(1);
    closegraph();
    ```


    透明贴图

    ```
    initgraph(900,900);
    IMAGE img[2];
    // 掩码图：想要显示的地方是黑色的，不显示的地方是白色的
    // 白色and任何颜色=原颜色(1&1=1,1&0=0)
    // 黑色and任何颜色=黑色（0&0=0，0&1=0）
    loadimage(img+0, "./掩码图");

    // 背景图: 不显示的地方是黑色的, 显示的地方是白色的, 之所以要填充黑色，是为了显示背景图下边的背景的颜色
    // 黑色XOR任何颜色=原颜色（0^0=0，0^1=1）
    loadimage(img+1, "./背景图");
    putimage(100,100,img+0, SRCAND)
    putimage(100,100,img+1, SRCAND)


    掩码位图机制是利用一个掩码位图来确定要透明的部分

    SRCCOPY     src             直接将源位图拷贝到目的设备上。 

    SRCAND      src AND dest    将目标文件中对应于源文件黑色区域的部分变黑，将对应于白色区域的部分留着不动。

    SRCINVERT   src XOR dest    将源插入到目标。二次使用时，将目标恢复到它原来的状态。在某种条件下可以代替SRCPAINT 操作。

    SRCPAINT    src OR dest     将源文件中的白色区域刷到目标文件中。源中的黑色区域不转换到目标中。
    ```


---

按键交互

    阻塞
    非阻塞


    ```
    struct Ball {
        int x;
        int y;
        int r;
        int speed;
    };

    struct Ball ball = { 0,0,15,5 };

    void drawBall() {
        setfillcolor(RED);
        solidcircle(ball.x, ball.y, ball.r);
    }

    void moveBall() {
        ball.x += 1;
        ball.y += 1;
    }

    int main() {
        initgraph(800, 600);

        while (1) {
            cleardevice();
            drawBall();
            moveBall();
            Sleep(1);
        }

        closegraph();
        return 0;
    }
    ```



    ```
    struct Ball {
        int x;
        int y;
        int r;
        int speed;
    };

    struct Ball ball = { 0,0,15,5 };

    void drawBall() {
        setfillcolor(RED);
        solidcircle(ball.x, ball.y, ball.r);
    }

    void moveBall() {
        ball.x += 1;
        ball.y += 1;
    }

    int main() {
        initgraph(800, 600);

        while (1) {
            cleardevice();
            drawBall();
            moveBall();
            Sleep(1);
        }

        closegraph();
        return 0;
    }
    ```



    ```
    #include <stdio.h>
    #include <graphics.h>
    #include <math.h>

    int  X = 900;
    int  Y = 1900;

    struct Ball {
        int x;
        int y;
        int r;
        int speedx;
        int speedy;
    };

    struct Ball ball = { 0,0,15,5,1 };

    void drawBall() {
        setfillcolor(RED);
        solidcircle(ball.x, ball.y, ball.r);
        line(450, 0, 450, 900);
    }

    void moveBall() {
        int speedxfu = - abs( ball.speedx);
        int speedxzheng = abs(ball.speedx);

        int speedyfu = -abs(ball.speedy);
        int speedyzheng = abs(ball.speedy);

        if (ball.x + ball.r > 450) {
            ball.speedx = speedxfu;
        }
        else if(ball.x - ball.r < 0) {
            ball.speedx = speedxzheng;
        }

        if (ball.y + ball.r > 900) {
            ball.speedy = speedyfu;
        }
        else if (ball.y - ball.r < 0) {
            ball.speedy = speedyzheng;
        }

        ball.x += ball.speedx;
        ball.y += ball.speedy;
    }

    int main() {
        initgraph(900, 900);

        solidcircle(100, 100, 30);
        while (1) {
            cleardevice();
            drawBall();
            moveBall();
            Sleep(2);
        }

        closegraph();
        return 0;
    }
    ```



    ```
    #include <stdio.h>
    #include <graphics.h>
    #include <math.h>
    #include <conio.h>
    //getchar() 

    int  X = 900;
    int  Y = 1900;

    struct Ball {
        int x;
        int y;
        int r;
        int speedx;
        int speedy;
    };

    struct Ball ball = { 0,0,15,5,1 };

    struct Ball ball2 = { 100,100,20,5,5 };


    void keyDown() {
        char keydown1 = _getch();
        printf("%c-%d\n", keydown1, keydown1);
        switch (keydown1) {
        case 72:
        case 'w':
        case 'W':
            ball2.y -= 5;
            break;
        case 'd':
        case 'D':
        case 77:
            ball2.x += 5;
            break;
        case 80:
        case 's':
        case 'S':
            ball2.y += 5;
            break;
        case 'a':
        case 'A':
        case 75:
            ball2.x -= 5;
            break;
        }
    }


    void drawBall(struct Ball ball) {
        setfillcolor(RED);
        solidcircle(ball.x, ball.y, ball.r);
        line(450, 0, 450, 900);
    }

    void moveBall() {
        int speedxfu = - abs( ball.speedx);
        int speedxzheng = abs(ball.speedx);

        int speedyfu = -abs(ball.speedy);
        int speedyzheng = abs(ball.speedy);

        if (ball.x + ball.r > 450) {
            ball.speedx = speedxfu;
        }
        else if(ball.x - ball.r < 0) {
            ball.speedx = speedxzheng;
        }

        if (ball.y + ball.r > 900) {
            ball.speedy = speedyfu;
        }
        else if (ball.y - ball.r < 0) {
            ball.speedy = speedyzheng;
        }

        ball.x += ball.speedx;
        ball.y += ball.speedy;

    }

    int main() {
        initgraph(900, 900);

        solidcircle(100, 100, 30);
        while (1) {
            cleardevice();
            drawBall(ball);
            drawBall(ball2);

            moveBall();

            if (_kbhit()) {
                keyDown();
            }

            Sleep(1);
        }

        closegraph();
        return 0;
    }
    ```

定时器

```

```




