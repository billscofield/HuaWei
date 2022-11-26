There's no auto completion in Vim. If you get autocompletion it means that you
have a plugin or a piece of script somewhere that does the autocompletion.

Vim does not have auto-complete; any completion must be explicitly triggered

:help new-omni-completion
:help compl-omni
    / ˈɑːmnɪ / 全方位；泛光灯



This could also be called "intellisense(智能感知)", but that is a trademark(商
标).  It is a smart kind of completion.  The text in front of the cursor is
inspected to figure out what could be following.  This may suggest struct and
class members, system functions, etc.

Use CTRL-X CTRL-O in Insert mode to start the completion.
    i_CTRL-X_CTRL-O

The 'omnifunc' option is set by filetype plugins to define the function that
figures out the completion.

Currently supported languages:
    C                                       ft-c-omni
    (X)HTML with CSS                        ft-html-omni
    JavaScript                              ft-javascript-omni
    PHP                                     ft-php-omni
    Python
    Ruby                                    ft-ruby-omni
    SQL                                     ft-sql-omni
    XML                                     ft-xml-omni
    any language with syntax highlighting   ft-syntax-omni

Omni completion using a **tags file** will complete the names of defined constants,
functions, classes and other names from included and other external files.

You can add your own omni completion scripts.

When the 'completeopt' option contains "menu" then matches for Insert mode
completion are displayed in a (rather primitive) popup menu




