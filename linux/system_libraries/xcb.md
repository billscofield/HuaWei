# xcb

在 centos stream 9 上安装 katana7 时遇到的问题


xcb-util-wm, xcb-util-image, xcb-util-keysym, and xcb-util-renderutil are four
separate libraries in the XCB (X C Binding) project. XCB is a replacement for
the Xlib library, used to communicate with the X Window System.

    1. xcb-util-wm:

    `xcb-util-wm` is a utility library that provides several functions and data
    structures for window manager related tasks in the X Window System. It aids
    in creating and managing window managers and provides convenience functions
    for working with window properties, events, and other window
    manager-specific tasks.

    2. xcb-util-image:

    `xcb-util-image` is a utility library that provides support for image
    handling in the X Window System. It includes functions to encode, decode,
    and manipulate images used in X applications.

    3. xcb-util-keysym:

    `xcb-util-keysym` is a utility library that provides functions for working
    with X11 keysyms. Keysyms are symbolic representations of keys on the
    keyboard and are used to abstract the actual keycodes, making it easier to
    work with keyboard events in X applications.

    4. xcb-util-renderutil:

    `xcb-util-renderutil` is a utility library that provides convenience
    functions for handling various rendering tasks in the X Window System. It
    includes functions for working with colors, pictures, and other
    rendering-related tasks.

These libraries are part of the XCB project, which aims to provide a more
efficient and modern **replacement for the traditional Xlib library**, making it
easier to develop X Window System applications. They are used by various X
applications and window managers to interact with the X server.
