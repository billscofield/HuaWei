# gtk

visual c++ (Visual Studio) 是微软提供的一个集成了 Microsoft C/C++ 编译器的可视
化开发工具，主要进行 Windows 下的程序开发

跨平台的纯 C

Windows: MinGW


## 开发环境搭建

安装
    apt-get install libgtk-3-dev

确认版本

    pkg-config --modversion gtk+-3.0
    
    或者

    pkg-config --cflags --libs gtk+-3.0

代码编辑器

    // to achive gtk syntax highlighting
    apt install vim-gtk

    为了在编写代码时不出现一些报错信息，将下列信息包含在了 .zshrc 中， 也是通过 pkg --cflags 得到的

    ```
    export C_INCLUDE_PATH=/usr/include/gtk-3.0:/usr/include/at-spi2-atk/2.0:/usr/include/at-spi-2.0:/usr/include/dbus-1.0:/usr/lib/x86_64-linux-gnu/dbus-1.0/include:/usr/include/gtk-3.0:/usr/include/gio-unix-2.0:/usr/include/cairo:/usr/include/pango-1.0:/usr/include/fribidi:/usr/include/harfbuzz:/usr/include/atk-1.0:/usr/include/cairo:/usr/include/pixman-1:/usr/include/uuid:/usr/include/freetype2:/usr/include/libpng16:/usr/include/gdk-pixbuf-2.0:/usr/include/libmount:/usr/include/blkid:/usr/include/glib-2.0:/usr/lib/x86_64-linux-gnu/glib-2.0/include
    ```

图形界面

    apt-get install glad

一些gtk官方的例子来

    apt-get install gtk-3-examples

gcc `pkg-config --libs --cflags gtk+-3.0` main.c


gtk3-demo

gcc main.c `pkg-config --cflags gtk+-3.0` `pkg-config --libs gtk+-3.0`

    必须分开写

### 关于头文件

vim 编写时，没有找到 glib.h 头文件


pkg-config --libs --cflags gtk+-3.0

```
-pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
```

不是递归的???

```
    export C_INCLUDE_PATH=/usr/include/gtk-3.0:/usr/include/at-spi2-atk/2.0:/usr/include/at-spi-2.0:/usr/include/dbus-1.0:/usr/lib/x86_64-linux-gnu/dbus-1.0/include:/usr/include/gtk-3.0:/usr/include/gio-unix-2.0:/usr/include/cairo:/usr/include/pango-1.0:/usr/include/fribidi:/usr/include/harfbuzz:/usr/include/atk-1.0:/usr/include/cairo:/usr/include/pixman-1:/usr/include/uuid:/usr/include/freetype2:/usr/include/libpng16:/usr/include/gdk-pixbuf-2.0:/usr/include/libmount:/usr/include/blkid:/usr/include/glib-2.0:/usr/lib/x86_64-linux-gnu/glib-2.0/include:$C_INCLUDE_PATH

```

再次运行 pkg-config --libs --cflags gtk+-3.0

```
-pthread -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
```



## 程序

第一个 gtk 程序

```
#include <stdio.h>
#include <stdlib.h>
#include <gtk/gtk.h>

int main(int argc, char* argv[]){
    gtk_init(&argc, &argv);

    GtkWidget * window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window),"HelloWorld");
    g_signal_connect(window,"destroy",G_CALLBACK(gtk_main_quit),NULL);
    gtk_widget_show_all(window);
    gtk_main();
    exit(0);
}
```

### 控件 widget

Widget
    Entry 文本框
    Label 普通文本
    Container
        Box
        Grid
        Fixed
        Bin
            NoteBook
            ScrolledWindow
            Button
            Window
                Dialog

方法

1. Widget

    void gtk_widget_show(GtkWidget* widget)
        
        If you want to show all the widgets in a container, it’s easier to
        call gtk_widget_show_all() on the container, instead of
        individually showing the widgets.

    void gtk_widget_hide(GtkWidget* widget)

    void gtk_widget_set_sensitive ( GtkWidget* widget, gboolean sensitive)
        
        Sets the sensitivity of a widget. A widget is sensitive if the user
        can interact with it. Insensitive widgets are “grayed out” and the
        user can’t interact with them. Insensitive widgets are known as
        “inactive”, “disabled”, or “ghosted” in some other toolkits.

    void gtk_widget_set_size_request ( GtkWidget* widget, gint width, gint height)
        
        Sets the minimum size of a widget; that is, the widget’s size
        request will be at least width by height. You can use this function
        to force a widget to be larger than it normally would be.
        
        In most cases, gtk_window_set_default_size() is a better choice for
        toplevel windows than this function; setting the default size will
        still allow users to shrink the window. Setting the size request
        will force them to leave the window at least as large as the size
        request. When dealing with window sizes,
        gtk_window_set_geometry_hints() can be a useful function as well.

    void gtk_widget_destroy ( GtkWidget* widget)
        
        Destroys a widget.
        
        When a widget is destroyed all references it holds on other objects
        will be released:

    void gtk_window_set_resizable ( GtkWindow* window, gboolean resizable)

    void gtk_window_set_position ( GtkWindow* window, GtkWindowPosition position)

        enum Gtk.WindowPosition
        
        Name                            Description
        GTK_WIN_POS_NONE                No influence is made on placement.
        GTK_WIN_POS_CENTER              Windows should be placed in the center of the screen.
        GTK_WIN_POS_MOUSE               Windows should be placed at the current mouse position.
        GTK_WIN_POS_CENTER_ALWAYS       Keep window centered as it changes size, etc.
        GTK_WIN_POS_CENTER_ON_PARENT    Center the window on its transient parent (see gtk_window_set_transient_for()).
    
    void gtk_window_maximize ( GtkWindow* window)

        Asks to maximize window, so that it becomes full-screen.

    void gtk_container_add ( GtkContainer* container, GtkWidget* widget)

    gtk_xxx_new
        GtkWidget* gtk_window_new ( GtkWindowType type)
        GtkWidget* gtk_label_new ( const gchar* str)

    gtk_AAA_get_BBB 从AAA 控件获得BBB属性的值
    gtk_AAA_set_BBB

Entry
    
    添加文本框/输入框(GtkEntry)

    GtkWidget* entry1 = gtk_entry_new();
    gtk_widget_show(entry1);
    gtk_container_add(window,entry1);

