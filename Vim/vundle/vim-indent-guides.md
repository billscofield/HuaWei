
## Installation

### Vundle

Plugin 'nathanaelkane/vim-indent-guides'


## Usage

The default mapping to toggle the plugin is <Leader>ig.

You can also use the following commands inside Vim:

:IndentGuidesEnable
:IndentGuidesDisable
:IndentGuidesToggle

If you would like to have indent guides enabled by default, you can add the following to your ~/.vimrc:

    let g:indent_guides_enable_on_vim_startup = 1

## Setting custom indent colors

Here's an example of how to define custom colors instead of using the ones the plugin automatically generates for you. Add this to your .vimrc file:

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
Alternatively you can add the following lines to your colorscheme file.

    hi IndentGuidesOdd  guibg=red   ctermbg=3
    hi IndentGuidesEven guibg=green ctermbg=4

### Terminal Vim

At the moment Terminal Vim only has basic support. This means is that colors won't be automatically calculated based on your colorscheme. Instead, some preset colors are used depending on whether background is set to dark or light.

When set background=dark is used, the following highlight colors will be defined:

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
Alternatively, when set background=light is used, the following highlight colors will be defined:

    hi IndentGuidesOdd  ctermbg=white
    hi IndentGuidesEven ctermbg=lightgrey

If for some reason it's incorrectly defining light highlight colors instead of dark ones or vice versa, the first thing you should check is that the background value is being set correctly for your colorscheme. Sometimes it's best to manually set the background value in your .vimrc, for example:

    colorscheme desert256
    set background=dark

Alternatively you can manually setup the highlight colors yourself, see :help indent_guides_auto_colors for an example.

## Help
    :help indent-guides
