
## history

The GTK+ library is also called the GIMP toolkit. Originally, the library was
created while developing the GIMP image manipulation program.

The GTK+ is an object-oriented application programming interface. The
object-oriented system is created with the Glib Object system, which is a base
for the GTK+ library. GObject also enables to create language bindings for
various other programming languages. Language bindings exist for C++, Python,
Perl, Java, C#, and other programming languages. 

 The GTK+ itself depends on the following libraries:

    Glib
    Pango
    ATK
    GDK
    GdkPixbuf
    Cairo

1. The Glib is a general purpose utility library. It provides various data
   types, string utilities, enables error reporting, message logging, working
   with threads, and other useful programming features.

2. Pango is a library which enables internationalisation.

3. ATK is the accessibility toolkit; it provides tools which help physically
   challenged people work with computers.

4. GDK is a wrapper around the low-level drawing and windowing functions
   provided by the underlying graphics system. On Linux, GDK lies between the X
   Server and the GTK+ library. It handles basic rendering such as drawing
   primitives, raster graphics, cursors, fonts, as well as window events, and
   drag-and-drop functionality. 

5. The GdkPixbuf library is a toolkit for image loading and pixel buffer
   manipulation. 

6. Cairo is a library for creating 2D vector graphics. It has been included in
   GTK+ since version 2.8.


Gnome and XFce desktop environments have been created using the GTK+ library.
SWT and wxWidgets are well known programming frameworks that use GTK+.
Prominent software applications that use GTK+ include Firefox or Inkscape.

This line compiles a basic program. The source code consists of one file—simple.c.

```
gcc -o simple simple.c `pkg-config --libs --cflags gtk+-2.0`
```


The --cflags parameter prints pre-processor and compile flags required to
compile GTK+ programs, including flags for all their dependencies.

```
pkg-config --cflags gtk+-2.0 | xargs -n3
-pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include
-I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0
-I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/freetype2
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1
-I/usr/include/libpng12 -I/usr/include/harfbuzz
```


The --libs parameter lists the necessary libraries.

```
$ pkg-config --libs gtk+-2.0 | xargs -n5
-lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
-lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfontconfig
-lgobject-2.0 -lglib-2.0 -lfreetype

```


## gtk and gtk+

gtk(gimp toolkit)是一个库，用来写图形用户界面程序的。这样的库太多了，windows平
台上有mfc、vcl等等，linux平台上更是层出不穷，而且好多都具备跨平台功能，比如Qt、
wxWidgets、FLTK等等。gtk与这些库的不同点在于其完全使用C语言开发的。

上面只是说了gtk，但我要学习的是gtk+。它们之间有什么关系呢？gtk+的作者之一
Perter Mattis说他原来开发的gtk包含了三套函数库,　libglib、libgdk，和libgtk，这
些库没有采用面向对象机制，因而无法实现构件的复用，

    gtk 消息机制是使用标准的回调机制实现的，
    gtk+ 消息机制使用信号机制

    “＋”是用来区分原始版本和新版本的。

gtk+依然是完全使用C语言开发的，但在设计上灵活运用了面向对象设计（OOD）思想（谁
说只有C++、java、C#这样的语言可以OOD呢？）

gtk+包含了许多常用的窗口部件，如文件选择、颜色选择部件等。另外，gtk+也提供了一
些独具特色的部件，譬如不包含标签而包含子部件的按钮，几乎可以在这样的按钮上放置
任何窗口部件，看设计者的需求了，类似这样的弹性充斥在整个库中。

gtk+允许软件开发人员用简单的方式说出自己想要的东西，不会用所谓的正规方式给开发
人员带来负担。

gtk+为应用程序的国际化（i18n,internationalization）、本地化（l10n,Localization）
提供了很好的处理工具，能够让编写的程序可以不加修改，只需要切换不同语种所需要的
语言数据文件，就可以为不同语种的人们所使用。现在，许多自由软件再也不需像从前那
样进行艰苦地“汉化”了。

有些用户视力不佳，有些人可能不能用键盘或鼠标，有些人可能只能移动他的眼睛，要剥
夺这类用户使用计算机的权利么？有爱心的程序开发人员是不会这样做的。gtk+可以通过
一个完善的、预先存在的ally框架，几乎什么工作都不用做，就可以将应用程序带给各类
用户。

gtk+是采用软件开发中的最新技术开发的，只要发现缺陷，开发人员会在下一版本中尽力
修补；提出反馈意见，他们会积极地分析、采纳，他们让我们不会陷在过时的工作中，而
且让我们每个人都拥有影响gtk+未来发展方向的能力。gtk+是GNU组织开发的，我记不住它
的开发者的名字（老外的名字我很少能记得住），但这并不剥夺你获取、使用、改写、分
发它的权利。最重要的是，gtk+采用了LGPL协议，允许任何人免费使用它的全部功能，且
不像GPL协议那样要求用户必须其编写的应用程序代码。使用LGPL协议，你既可以是开源社
区的好伙伴，也可以是好公民。

gtk+是可移植的，而且具有多种语言前端，譬如C++、Perl、Python、TOM、Ada95、Free
Pascal、Eiffel、JAVA，以及C#等等。在选定gtk+以前，我考虑很长时间是不是在下个项
目的GUI程序开发中应该用大名鼎鼎的Qt，比较了好久，我放弃了Qt。虽然目前Qt的可移植
性与易用性都优于gtk+，但C＋＋的实现，让它过于笨重了，而且它的主要开发工作是在03
年C++标准颁布之前进行的，与标准C＋＋的兼容性实在是个问题。gtk+是C语言开发的，而
C语言标准长期以来几乎没有变化，Qt要适应C++标准，应该要大动了。举个简单的例子吧，
我们使用标准C＋＋所提供的字串类型呢，还是去用Qt自己实现的？另外，与gtk+所遵循的
版权协议相比，Qt要开发商业程序依然价格不菲。我觉得Qt的缺点就是过于大而全了。




## action

https://zetcode.com/gui/gtk2/firstprograms/


g_print


makefile

```
.PHONY = clean
CC = gcc
MAINC = demo01.c
EXEC = demo01_elf

CFLAGS = `pkg-config --cflags --libs gtk+-3.0`  // 不能用 $() 这种方式

main:
    $(CC) -o $(EXEC) $(MAINC) $(CFLAGS)

clean:
    rm -rf $(EXEC)

```

### First programs in GTK+

Our first example shows a basic window.

``` simple.c

#include <gtk/gtk.h>

int main(int argc, char *argv[]) {

    GtkWidget *window;

    gtk_init(&argc, &argv);

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_widget_show(window);

    g_signal_connect(window, "destroy",
      G_CALLBACK(gtk_main_quit), NULL);

    gtk_main();

    return 0;
}

```

1. GtkWidget is the base class that all widgets in GTK+ derive from. It manages
   the widget lifecycle, states, and style.

` GtkWidget *window;

2. The gtk_init function initializes GTK+ and parses some standard command line
   options. This function must be called before using any other GTK+ functions. 

` gtk_init(&argc, &argv);

3. The gtk_window_new function creates a new GtkWindow, which is a toplevel
   window that can contain other widgets.

   The window type is GTK_WINDOW_TOPLEVEL;

   toplevel windows have a titlebar and a border. They are managed by the
   window manager. 

` window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

4. The get_widget_show flags a widget to be displayed. Any widget that is not
   shown will not appear on the screen. 

` gtk_widget_show(window);

5. The g_signal_connect function connects a callback function to a signal for a
   particular object.

   The window does not react to the destroy signal by default.

   We must explicitly terminate the application by connecting the destroy
   signal to the built-in gtk_main_quit function, which terminates the
   application. 

`g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

6. This code enters the GTK+ main loop. From this point, the application sits
   and waits for events to happen.

` gtk_main();


### Centering the window

If we do not position the window ourselves, the **window manager** will
position it for us. In the next example, we will center the window.

The gtk_window_set_title function sets a window title. If we do not set a title
ourselves, the GTK+ will use a name of a source file as a title.


### The application icon

Most window managers display the icon in the left corner of the titlebar and
also on the taskbar.

```
#include <gtk/gtk.h>

GdkPixbuf *create_pixbuf(const gchar * filename) {

    GdkPixbuf *pixbuf;
    GError *error = NULL;
    pixbuf = gdk_pixbuf_new_from_file(filename, &error);

    if (!pixbuf) {
        fprintf(stderr, "%s\n", error->message);
        g_error_free(error);
    }

    return pixbuf;
}

int main(int argc, char *argv[]) {

    GtkWidget *window;
    GdkPixbuf *icon;

    gtk_init(&argc, &argv);

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Icon");
    gtk_window_set_default_size(GTK_WINDOW(window), 230, 150);
    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);

    icon = create_pixbuf("web.png");  
    gtk_window_set_icon(GTK_WINDOW(window), icon);

    gtk_widget_show(window);

    g_signal_connect(G_OBJECT(window), "destroy",
            G_CALLBACK(gtk_main_quit), NULL);

    g_object_unref(icon);    

    gtk_main();

    return 0;
}
```

1. The gdk_pixbuf_new_from_file function creates a new pixbuf by loading an
   image from a file. The file format is detected automatically. If NULL is
   returned, then an error will be set.

2. The gtk_window_set_icon displays the icon for the window. The create_pixbuf
   creates a GdkPixbuf from a PNG file.

   ```
   icon = create_pixbuf("web.png");
   gtk_window_set_icon(GTK_WINDOW(window), icon);
   ```

3. The g_object_unref decreases the reference count of the pixbuf object. When
   its reference count drops to 0, the object is finalized (i.e. its memory is
   freed).

   ` g_object_unref(icon);

### 窗口大小

1. gtk_widget_set_size_request

```
gtk_widget_set_size_request(
    GtkWidget* widget,
    gint width,
    gint height
)
```

    Sets the minimum size of a widget; that is, the widget’s size request will
    be at least width by height. You can use this function to force a widget to
    be larger than it normally would be.

    In most cases, gtk_window_set_default_size() is a better choice for
    toplevel windows than this function; setting the default size will still
    allow users to shrink the window. Setting the size request will force them
    to leave the window at least as large as the size request. When dealing
    with window sizes, gtk_window_set_geometry_hints() can be a useful function
    as well.

2. gtk_window_set_default_size

```
void
gtk_window_set_default_size (
    GtkWindow* window,
    gint width,
    gint height
)
```

    The default size of a window only affects the first time a window is shown;
    if a window is hidden and re-shown, it will remember the size it had prior
    to hiding, rather than using the default size.

    Windows can’t actually be 0x0 in size, they must be at least 1x1, but
    passing 0 for width and height is OK, resulting in a 1x1 default size.

3.  gtk_window_set_resizable

```
void
gtk_window_set_resizable (
    GtkWindow* window,
    gboolean resizable
)
```

Windows are user resizable by default.

4. gtk_window_resize

```
void
gtk_window_resize (
    GtkWindow* window,
    gint width,
    gint height
)

```

    gtk_window_resize() always affects the window itself, not the geometry
    widget.


5. gtk_window_set_geometry_hints    // [dʒiˈɑːmətri] 几何; [hɪnt] 提示
6. gtk_window_set_default_geometry


7.  gtk_window_set_position

```
void
gtk_window_set_position (
    GtkWindow* window,
    GtkWindowPosition position
)

GTK_WIN_POS_NONE                No influence is made on placement.
GTK_WIN_POS_CENTER              Windows should be placed in the center of the screen.
GTK_WIN_POS_MOUSE               Windows should be placed at the current mouse position.
GTK_WIN_POS_CENTER_ALWAYS       Keep window centered as it changes size, etc.
GTK_WIN_POS_CENTER_ON_PARENT    Center the window on its transient(短暂的) parent (see gtk_window_set_transient_for()).
```



### widget show

1.  gtk_widget_show_all (

```
void
gtk_widget_show_all (
    GtkWidget* widget
)
```

    Recursively shows a widget, and any child widgets (if the widget is a
    container) .

2.  gtk_widget_show

```
void
gtk_widget_show (
    GtkWidget* widget
)
```

3. gtk_widget_hide

5. 




### Tooltip

A tooltip is a small rectangular window, which gives a brief information about
an object. It is usually a GUI component; it is part of the help system of the
application.



### 数据类型

1. 整数类型
    
    gint8, guint8, gint16, guint16, gint32, guint32, gint64, guint64

2. gshort， glone, gint 和 short, long, int 相同

3. gboolean: TRUE/FALSE

4. gchar 和 char 相同

5. gfloat, gdouble 和 float,double 完全相同

6. 指针 gpointer 和 void * 相同
    
    const gpointer == const void *



### 控件

容器控件
    只能容纳一个控件
        如窗口,按钮

    能容纳多个控件
        如布局控件

非容器控件
    如标签，行编辑


### 按钮

1. gtk_button_new_with_label

2. gtk_check_button_new_with_label

3. gtk_radio_button_new_with_label

4. gtk_toggle_button_new_with_label

5. gtk_button_get_label

    Fetches the text from the label of the button, as set by
    gtk_button_set_label(). If the label text has not been set the return value
    will be NULL. This will be the case if you create an empty button with
    gtk_button_new() to use as a container.


6. gtk_container_add


使能

```
void gtk_widget_set_sensitive (
    GtkWidget* widget,
    gboolean sensitive
)
```

Sets the sensitivity of a widget. A widget is sensitive if the user can
interact with it. Insensitive widgets are “grayed out” and the user can’t
interact with them. Insensitive widgets are known as “inactive”, “disabled”, or
“ghosted” in some other toolkits.


```
void
gtk_container_add (
    GtkContainer* container,
    GtkWidget* widget
)
```

    Adds widget to container.

    Typically used for simple containers such as GtkWindow, GtkFrame, or
    GtkButton;

    for more complicated layout containers such as GtkBox or GtkGrid, this
    function will pick default packing parameters that may not be correct.  So
    consider functions such as gtk_box_pack_start() and gtk_grid_attach() as an
    alternative to gtk_container_add() in those cases.

    A widget may be added to only one container at a time; you can’t place the
    same widget inside two different containers.

    Note that some containers, such as GtkScrolledWindow or GtkListBox, may add
    intermediate children between the added widget and the container.



### 信号与回调

窗口关闭时触发的常用信号
    destroy
    delete_event

按钮常用信号
    clicked
    pressed
    released


1. g_signal_connect (

```
gulong g_signal_connect (
    gpointer instance,
    const gchar *detailed_signal,
    GCallback c_handler,
    gpointer data
)
```

instance            - The instance to connect to.
detailed_signal     - A string of the form “signal-name::detail”.
c_handler           - The GCallback to connect.
data                - Data to pass to c_handler calls. 传给回调函数的数据


```
g_signal_connect(
    window,
    "destroy",
    GCallback(gtk_main_quit),
    NULL
)


#include <gtk/gtk.h>

void sayHello(GtkButton* button,int * argv){
    printf("hello %d\n",*argv);
    
}

int main(int argc, char* argv[]){
    GtkWidget * window;
    GtkWidget * button;

    gtk_init(&argc, &argv);

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

    button = gtk_button_new_with_label("hello world");
    gtk_container_add((GtkContainer*)window, button);

    int a = 3;

    g_signal_connect(window,"destroy",G_CALLBACK(gtk_main_quit),NULL);
    g_signal_connect(button,"clicked",G_CALLBACK(sayHello),&a);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}
```


## 布局

1. 水平布局 GtkHBox

2. 垂直布局 GtkVBox

3. 表格布局 GtkTable

4. 固定布局 GtkFixed

5. GtkBox


### 1. GtkHBox

```
GtkWidget* gtk_hbox_new (
    gboolean homogeneous,   // [ˌhoʊməˈdʒiːniəs]  同性质的, 大小一致
    gint spacing            // 控件之间的间隔
)

---

GtkWidget * hbox = gtk_hbox_new(TRUE,5);
gtk_container_add((GtkContainer *)window,hbox);
gtk_container_add((GtkContainer *)hbox,button1);
gtk_container_add((GtkContainer *)hbox,button2);

```

### 2. GtkVBox

```
GtkWidget* gtk_vbox_new (
    gboolean homogeneous,
    gint spacing
)

```


### 3. GtkTab

```
GtkWidget* gtk_table_new (
    guint rows,
    guint columns,
    gboolean homogeneous
)

GtkTab 不用 gtk_container_add

void gtk_table_attach_defaults (
    GtkTable* table,                    //
    GtkWidget* widget,                  //
    guint left_attach,                  //
    guint right_attach,                 //
    guint top_attach,                   //
    guint bottom_attach                 //
)



  0      1    2
    +----+----+
    | A  | B  |
  1 +----+----+
    | C  | D  |
  2 +----+----+
    |    E    |
  3 +----+----+


    用的是边界, 例如

        A:  0,1,0,1 (先左右，后上下)
        B:  1,2,0,1
        C:  0,1,1,2
        D:  1,2,1,2
        E:  0,2,2,3


```



### 4. GtkFixed

```
GtkWidget* gtk_fixed_new ( void)


void gtk_fixed_put (
    GtkFixed* fixed,
    GtkWidget* widget,
    gint x,
    gint y
)

```


widget  GtkWidget

    The widget to add.

    The data is owned by the caller of the function.

x   gint
    The horizontal position to place the widget at.

y   gint
    The vertical position to place the widget at.

### 5. GtkBox

```
GtkWidget* gtk_box_new (
    GtkOrientation orientation,
    gint spacing
)



void gtk_box_pack_start (
    GtkBox* box,
    GtkWidget* child,
    gboolean expand,
    gboolean fill,
    guint padding
)

```

### 6. 网格布局 GtkGrid

```
GtkWidget* gtk_grid_new (
    void
)

void gtk_grid_attach (
    GtkGrid* grid,
    GtkWidget* child,
    gint left,
    gint top,
    gint width,
    gint height
)
```


### 6. 综合布局

行编辑(文本框)

```
GtkWidget* gtk_entry_new ( void)
```

显示模式

```
void gtk_entry_set_visibility (
    GtkEntry* entry,
    gboolean visible                // FALSE 为密码模式
)
```

you probably want to set GtkEntry:input-purpose to GTK_INPUT_PURPOSE_PASSWORD
or GTK_INPUT_PURPOSE_PIN to inform input methods about the purpose of this
entry, in addition to setting visibility to FALSE.


```
void gtk_entry_set_text (
    GtkEntry* entry,
    const gchar* text
)

Sets the text in the widget to the given value, replacing the current contents.

```




void gtk_entry_buffer_set_text (
    GtkEntryBuffer* buffer,
    const gchar* chars,
    gint n_chars
)

Sets the text in the buffer.

This is roughly equivalent to calling gtk_entry_buffer_delete_text() and
gtk_entry_buffer_insert_text().

Note that n_chars is in characters, not in bytes.




guint gtk_entry_buffer_delete_text (
    GtkEntryBuffer* buffer,
    guint position,
    gint n_chars
)

Deletes a sequence of characters from the buffer. n_chars characters are
deleted starting at position. If n_chars is negative, then all characters until
the end of the text are deleted.

If position or n_chars are out of bounds, then they are coerced to sane values.

Note that the positions are specified in characters, not bytes.





guint gtk_entry_buffer_insert_text (
    GtkEntryBuffer* buffer,
    guint position,
    const gchar* chars,
    gint n_chars
)

Inserts n_chars characters of chars into the contents of the buffer, at
position position.

If n_chars is negative, then characters from chars will be inserted until a
null-terminator is found. If position or n_chars are out of bounds, or the
maximum buffer text length is exceeded, then they are coerced to sane values.

Note that the position and length are in characters, not in bytes.


信号
    activate 回车触发


## 图片按钮

图片控件

    0. gtk_button_new();

        button 也是一个控件， gtk_button_new_with_label 已经有了

    1. gtk_image_new_from_file

        ```
        GtkWidget* gtk_image_new_from_file (
            const gchar* filename
        )
        ```
        
        Creates a new GtkImage displaying the file filename. If the file isn’t
        found or can’t be loaded, the resulting GtkImage will display a “broken
        image” icon. This function never returns NULL, it always returns a
        valid GtkImage widget.

    2. gtk_button_set_image

        ```
        void gtk_button_set_image (
            GtkButton* button,
            GtkWidget* image
        )
        ```
        
        Set the image of button to the given widget. The image will be
        displayed if the label text is NULL or if GtkButton:always-show-image
        is TRUE. You don’t have to call gtk_widget_show() on image yourself.
        
        会有一个边界线，设置透明可以使消失


设置按钮透明背景色

    gtk_button_set_relief

    ```
    void gtk_button_set_relief (
        GtkButton* button,
        GtkReliefStyle relief
    )
    ```


### 图片资源对象 GdkPixbuf

1. 图片资源对象的创建

```
GdkPixbuf * gdk_pixbuf_new_from_file(
    const gchar *filename,
    GError **error
)
```
2. 设置图片的大小

```
GdkPixbuf *gdk_pixbuf_scale_simple(
    const GdkPixbuf *src,
    int dest_width,
    int dest_height,
    GdkInterpType interp_type
)
```

    GdkInterpType 是一个枚举变量，标志图片的加载速度和质量，常用 GDK_INTERP_BILINEAR

3. gtk_image_new_from_pixbuf(A,B)


4. 释放资源

    void g_object_unref(GtkObject *object);

5. 重新设置一张图片

```
void gtk_image_set_from_pixbuf(
    GtkImage *image,
    GdkPixbuf *pixbuf
)
```

6. gtk_image_new_from_pixbuf(A,B)



### 进度条

```
GtkWidget* gtk_progress_bar_new (
    void
)


void gtk_progress_bar_set_fraction (
    GtkProgressBar* pbar,
    double fraction                     // 分数，小数
)

Causes the progress bar to “fill in” the given fraction of the bar.

The fraction should be between 0.0 and 1.0, inclusive.
```


### 滚动窗口 GtkScrolledWindow


1. Creates a new scrolled window.

```
GtkWidget* gtk_scrolled_window_new (
    GtkAdjustment* hadjustment,
    GtkAdjustment* vadjustment
)
```



1. Sets the scrollbar policy for the horizontal and vertical scrollbars.

```
void gtk_scrolled_window_set_policy (
    GtkScrolledWindow* scrolled_window,
    GtkPolicyType hscrollbar_policy,
    GtkPolicyType vscrollbar_policy
        GTK_POLICY_ALWAYS               the scrollbar is always present;
        GTK_POLICY_NEVER                the scrollbar is never present;
        GTK_POLICY_AUTOMATIC            the scrollbar is present only if needed
)
```


Sets the border width of the container.

```
void gtk_container_set_border_width (
    GtkContainer* container,
    guint border_width
)

```

The border width of a container is the amount of space to leave around the
outside of the container. The only exception to this is GtkWindow; because
toplevel windows can’t leave space outside, they leave the space inside. The
border is added on all sides of the container. To add space to only one side,
use a specific GtkWidget:margin property on the child widget, for example
GtkWidget:margin-top.




### 分栏列表

### 定时器

Sets a function to be called at regular intervals, with the default priority,
G_PRIORITY_DEFAULT

```
guint g_timeout_add (
    guint interval,             // milliseconds
    GSourceFunc function,       // Function to call.
    gpointer data               // Data to pass to function.
                                   The argument can be NULL.
                                   The data is owned by the caller of the function.
)
```


移除计时器

Removes the source with the given ID from the default main context. You must
use g_source_destroy() for sources added to a non-default main context.

The ID of a GSource is given by g_source_get_id(), or will be returned by the
functions g_source_attach(), g_idle_add(), g_idle_add_full(), g_timeout_add(),
g_timeout_add_full(), g_child_watch_add(), g_child_watch_add_full(),
g_io_add_watch(), and g_io_add_watch_full().



```
gboolean g_source_remove (
    guint tag
)
```

