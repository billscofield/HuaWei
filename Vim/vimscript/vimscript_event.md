## FileType 事件

## Reading

BufNewFile              starting to edit a file that doesn't exist
BufReadPre              starting to edit a new buffer, before reading the file
BufRead                 starting to edit a new buffer, after reading the file
BufReadPost             starting to edit a new buffer, after reading the file
BufReadCmd              before starting to edit a new buffer Cmd-event

FileReadPre             before reading a file with a ":read" command
FileReadPost            after reading a file with a ":read" command
FileReadCmd             before reading a file with a ":read" command Cmd-event

FilterReadPre           before reading a file from a filter command
FilterReadPost          after reading a file from a filter command

StdinReadPre            before reading from stdin into the buffer
StdinReadPost           After reading from the stdin into the buffer

## Writing

BufWrite                starting to write the whole buffer to a file
BufWritePre             starting to write the whole buffer to a file
BufWritePost            after writing the whole buffer to a file
BufWriteCmd             before writing the whole buffer to a file Cmd-event

FileWritePre            starting to write part of a buffer to a file
FileWritePost           after writing part of a buffer to a file
FileWriteCmd            before writing part of a buffer to a file Cmd-event

FileAppendPre           starting to append to a file
FileAppendPost          after appending to a file
FileAppendCmd           before appending to a file Cmd-event

FilterWritePre          starting to write a file for a filter command or diff
FilterWritePost         after writing a file for a filter command or diff

## Buffers

BufAdd                  just after adding a buffer to the buffer list
BufCreate               just after adding a buffer to the buffer list
BufDelete               before deleting a buffer from the buffer list
BufWipeout              before completely deleting a buffer

BufFilePre              before changing the name of the current buffer
BufFilePost             after changing the name of the current buffer

BufEnter                after entering a buffer
BufLeave                before leaving to another buffer
BufWinEnter             after a buffer is displayed in a window
BufWinLeave             before a buffer is removed from a window

BufUnload               before unloading a buffer
BufHidden               just after a buffer has become hidden
BufNew                  just after creating a new buffer

SwapExists              detected an existing swap file


## Options

FileType                when the 'filetype' option has been set
Syntax                  when the 'syntax' option has been set
EncodingChanged         after the 'encoding' option has been changed
TermChanged             after the value of 'term' has changed
OptionSet               after setting any option

## Startup and exit

VimEnter                after doing all the startup stuff
GUIEnter                after starting the GUI successfully
GUIFailed               after starting the GUI failed
TermResponse            after the terminal response to t_RV is received

QuitPre                 when using :quit, before deciding whether to exit
ExitPre                 when using a command that may make Vim exit
VimLeavePre             before exiting Vim, before writing the viminfo file
VimLeave                before exiting Vim, after writing the viminfo file

## Terminal

TerminalOpen            after a terminal buffer was created
TerminalWinOpen         after a terminal buffer was created in a new window

## Various
FileChangedShell        Vim notices that a file changed since editing started
FileChangedShellPost    After handling a file changed since editing started
FileChangedRO           before making the first change to a read-only file

DiffUpdated             after diffs have been updated
DirChanged              after the working directory has changed

ShellCmdPost            after executing a shell command
ShellFilterPost         after filtering with a shell command

CmdUndefined            a user command is used but it isn't defined
FuncUndefined           a user function is used but it isn't defined
SpellFileMissing        a spell file is used but it can't be found
SourcePre               before sourcing a Vim script
SourcePost              after sourcing a Vim script
SourceCmd               before sourcing a Vim script Cmd-event

VimResized              after the Vim window size changed
FocusGained             Vim got input focus
FocusLost               Vim lost input focus
CursorHold              the user doesn't press a key for a while
CursorHoldI             the user doesn't press a key for a while in Insert mode
CursorMoved             the cursor was moved in Normal mode
CursorMovedI            the cursor was moved in Insert mode

WinNew                  after creating a new window
TabNew                  after creating a new tab page
TabClosed               after closing a tab page
WinEnter                after entering another window
WinLeave                before leaving a window
TabEnter                after entering another tab page
TabLeave                before leaving a tab page
CmdwinEnter             after entering the command-line window
CmdwinLeave             before leaving the command-line window

CmdlineChanged          after a change was made to the command-line text
CmdlineEnter            after the cursor moves to the command line
CmdlineLeave            before the cursor leaves the command line

InsertEnter             starting Insert mode
InsertChange            when typing <Insert> while in Insert or Replace mode
InsertLeave             when leaving Insert mode
InsertCharPre           when a character was typed in Insert mode, before
                        inserting it

TextChanged             after a change was made to the text in Normal mode
TextChangedI            after a change was made to the text in Insert mode


