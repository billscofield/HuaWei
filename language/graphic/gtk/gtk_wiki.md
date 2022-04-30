
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


g_print

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
