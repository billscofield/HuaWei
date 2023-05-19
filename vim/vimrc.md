## listchars

listchars is a Vim option that determines how certain non-printable characters
are displayed in the buffer. It takes a string argument that specifies the
characters to be displayed, along with their corresponding display characters.

Here is a list of some of the characters that can be specified in listchars:

    - eol: Specifies the character to be displayed at the end of a line. The
      default is $.
    - tab: Specifies the character to be displayed for a tab. The default is
      ^I.
    - trail: Specifies the character to be displayed for trailing white spaces
      at the end of a line. The default is ·.
    - extends: Specifies the character to be displayed for a line that extends
      past the right edge of the window. The default is >.
    - precedes: Specifies the character to be displayed for a line that
      continues from the previous line. The default is <.  To set listchars in
      Vim, you can add the following line to your .vimrc file:

    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

This will display end-of-line characters as $, tabs as >-, trailing white
spaces as ~, lines that extend past the right edge of the window as >, and
lines that continue from the previous line as <.

## updatetime

The updatetime option in Vim sets the time (in milliseconds) that Vim waits
after a keystroke in insert or normal mode before triggering an InsertLeave or
CursorHold event.


## Jumping Between Files

When in Normal mode, typing gf over text that refers to a file name will cause
Vim to attempt to open that file. This is great when working with programming
languages that include or require files relative to the current working
directory.

By default, however, `gf` needs a little bit of assistance to find files. Let's
say you're working on a project that's written with Node. In Node, files are
referred to like this:

```
var textile = require('stextile')
  , existsSync = require('./utils').existsSync
  , exists = require('./utils').exists
  , fs = require('./graceful')
  , path = require('path')
  , jade = require('jade')
;
```

The files that start with ./ are relative to the current file. If I move the
cursor over ./utils and type `gf`, it should open ./utils.js, ***but it doesn't
because Vim isn't aware that .js needs to be added***. To help Vim figure out the
file name, suffixesadd (abbreviation: sua, help: :help 'suffixesadd') can be
used:

          :set suffixesadd+=.js
          Now if I type gf over require('./utils'), Vim will open ./utils.js as expected.
