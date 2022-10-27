

/usr/share/terminfo

linux的终端信息放在 /usr/share/terminfo下，在这个目录的子目录v下就有许多的如vt100,vt102,vt200



## .Xdefaults

The file called .Xdefaults in your home directory is loaded into the X server
using the xrdb program when you start your X session.

In this file, each X application has a number of options which can be set, such
as reverse video, window size, window location, and many others.

You can set these options so that they are set every time you start up an
application. A line in your .Xdefaults file follows this format:

    name.class.resource: value


xrdb
    xrdb - X server resource database utility


### 1. name

name is usually the name of the program (e.g., xterm, or xclock). You can,
however, change the name a program uses to find its options in the .Xdefaults
by invoking the command with -name argument.

### 2. class

is used for grouping resources together. For example, the class Geometry would
contain all the resources which affect the geometry of any of the application's
windows. 

The names of classes conventionally start with an upper-case letter.


!!! xprop

    xprop - property displayer for X

    The xprop utility is for displaying window and font properties in an X server.

    Those classes, which are understood by each application program, are
    described in the manual entry for that program or you can use xprop.

    Simply start up the X program in question, type "xprop" at a unix prompt,
    and click in the window of the X program. This will give you the class and
    instance of the program.

    For example, using xprop on an "xterm" window gives:

```
WM_STATE(WM_STATE):
		window state: Normal
		icon window: 0xc004a2
WM_PROTOCOLS(ATOM): protocols  WM_DELETE_WINDOW
WM_CLASS(STRING) = "xterm", "XTerm"
WM_HINTS(WM_HINTS):
		Client accepts input or input focus: True
		Initial state is Normal State.
WM_NORMAL_HINTS(WM_SIZE_HINTS):
		program specified size: 899 by 412
		program specified minimum size: 30 by 21
		program specified resize increment: 11 by 17
		program specified base size: 19 by 4
WM_CLIENT_MACHINE(STRING) = "america.ecn.purdue.edu"
WM_COMMAND(STRING) = { "xterm" }
WM_ICON_NAME(STRING) = "xterm"
WM_NAME(STRING) = "xterm"


There can actually be more than one class for a given object. That is, there
can be classes of classes. A good example of this is xterm which has a major
class (or "super-class") called VT100, and several minor classes (or
"sub-classes"), such as Font, Geometry, so on. Generally, if you're not sure of
how many classes and sub-classes there are, you can use the "*" character to
specify "match anything".
```


### 3. resource

indicates the name of some resource whose value can be changed. Some resources
include foreground (the foreground color), background (the background color),
geometry (the size and location of the window), ScrollBar, (indicate whether or
not scrollbars should be used) and so on.

The names of resources conventionally start with a lower-case letter. 

Each application program has a different set of resources which you can modify;
they are described in the manual entry for the program.


Note on class and resource names: Capitalization is used to distinguish class
names from resource names.

Class names always begin with a capital letter, while resource names always
begin with a lowercase letter.

Note however that if a resource name is a compound word (such as cursorColor),
the second word is capitalized.


### 4. value

can be set to three types:
integer (a whole number)
Boolean (on/off, yes/no)
string (sequence of characters, e.g., a pathname or window title).



### Changing the Foreground and Background Colors

To change the foreground color for an application, use the -fg command line
option or the foreground resource.

For example, suppose you have a color display and want the text in your xterm
windows to be blue instead of black:

```
xterm -fg blue &

---
.Xdefaults
    XTerm*foreground:blue

```

To change the background color, use the -bg command line option or the
background resource.

For example, suppose you want the same xterm window on your color display to
have a yellow background instead of white:

```
xterm -bg yellow &

---

.Xdefaults
    XTerm*background:yellow
```


### Reverse-video Option

The -rv (reverse-video) command line option specifies that a client be started
with its foreground and background colors swapped.

In many cases, this means that a window will be white on black, rather than
black on white.
