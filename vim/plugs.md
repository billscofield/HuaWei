# vim plugins

## AI

Github Copilot
    non-free

codeium
    free for individual
    https://github.com/codeium/copilot

    :Codeium Auth  Disable  DisableBuffer  Enable  EnableBuffer

cursor 编辑器


## devhelp

https://wiki.gnome.org/Apps/Devhelp

Devhelp is an API documentation browser for GTK+ and GNOME developers. It
allows you to quickly search and browse through API documentation for various
libraries.

Devhelp is a developer tool for browsing and searching API documentation.
It provides an easy way to navigate through libraries and to search by
function, struct, or macro.

The documentation must be installed locally, so an internet connection is
not needed to use Devhelp.

Devhelp works natively with GTK-Doc, so the GTK+ and GNOME libraries are
well supported. But other development platforms can be supported as well,
as long as the API documentation is available in HTML and a *.devhelp2
index file is generated.

Devhelp integrates with other applications such as Glade, Builder or
Anjuta, and plugins are available for different text editors (gedit, Vim,
Emacs, Geany, …).

```
let g:devhelpSearch=1
let g:devhelpAssistant=1
```

## polyglot

Vim-polyglot is a popular plugin for the Vim text editor that provides
extensive language support and syntax highlighting for a wide variety of
programming languages and file formats. It is a language pack that bundles
together many syntax and indentation plugins, making it easy to have support
for multiple languages in one package.

The main benefits of using Vim-polyglot are:

    - Ease of use:

        You don't have to search for and install individual plugins for each
        language you work with. Vim-polyglot has support for many languages out
        of the box, so you just need to install and configure it once.

    - Optimization:

        Vim-polyglot is optimized for performance, meaning it should have
        minimal impact on Vim's startup time and responsiveness. It only loads
        the necessary plugins for the current file type, keeping the memory
        footprint low.

    - Regular updates:

        Vim-polyglot is actively maintained and regularly updated, ensuring
        that you always have the latest language support and syntax
        highlighting improvements.

    - Customization:

        You can easily enable or disable specific languages or choose to use
        your own custom syntax plugins alongside Vim-polyglot.

To install Vim-polyglot, you can use a plugin manager like Vim-Plug, Vundle, or
Pathogen. Once installed, Vim-polyglot should automatically start working and
provide syntax highlighting and indentation support for the supported
languages.

Vim-polyglot 是 Vim 文本编辑器的一个流行插件，为各种编程语言和文件格式提供广泛
的语言支持和语法高亮。它是一个语言包，将许多语法和缩进插件捆绑在一起，使得在一
个软件包中轻松支持多种语言。

使用 Vim-polyglot 的主要优点有：

    - 易用性：
        您无需为所使用的每种语言搜索并安装单独的插件。Vim-polyglot 开箱即用地支
        持许多语言，因此您只需安装和配置一次。

    - 优化：
        Vim-polyglot 针对性能进行了优化，这意味着它对 Vim 的启动时间和响应速度影响
        很小。它仅加载当前文件类型所需的插件，保持较低的内存占用。

    - 定期更新：
        Vim-polyglot 得到了积极维护和定期更新，确保您始终拥有最新的语言支持和语法高
        亮改进。

    - 定制性：
        您可以轻松启用或禁用特定语言，或者选择与 Vim-polyglot 一起使用您自己的
        自定义语法插件。

要安装 Vim-polyglot，您可以使用像 Vim-Plug、Vundle 或 Pathogen 这样的插件管理器。
安装后，Vim-polyglot 应该会自动开始工作，并为受支持的语言提供语法高亮和缩进支持。


"polyglot" is not an abbreviation or short for something. It is a standalone
word derived from Greek, where "poly" means "many" and "glot" means "tongue" or
"language." In general use, a polyglot is a person who is fluent in or can
speak, write, or understand multiple languages.

In the context of the Vim-polyglot plugin, the name "polyglot" is used
metaphorically to convey the idea that the plugin supports many programming
languages and file formats, functioning as a single package that can "speak" or
understand a multitude of languages. The plugin brings together syntax and
indentation support for numerous languages, making it easier to work with
different types of code in Vim.


## prettier

[vim-prettier](https://prettier.io/docs/en/vim.html)



## what are the differences between coc.nvim and ale

coc.nvim and ALE are both popular Vim and Neovim plugins, but they have
different goals and offer distinct features. Here's a comparison of the two:

1. coc.nvim (Conquer of Completion):

    - Focuses on providing intelligent code completion, powered by the Language
        Server Protocol (LSP).

    - Offers a wide range of language features such as diagnostics, formatting,
        code actions, go-to-definition, and more.

    - Supports various programming languages and file formats by installing the
        appropriate coc.nvim extensions.

    - Built-in support for snippets and snippet expansion.

    - Tends to be more resource-intensive compared to ALE, as it relies on
        language servers for its features.

2. ALE (Asynchronous Lint Engine):

    - Primarily a linting and syntax checking plugin, which can check your code
        for errors, warnings, and style issues.

    - Asynchronous by design, meaning it doesn't block the editor while linting,
        resulting in a smoother user experience.

    - Supports a variety of linters and fixers for different programming
        languages and file formats.

    - Can be extended with custom linters and fixers.

    - Does not provide advanced language features like code completion,
        formatting, or code actions.

    - Usually lighter on resources compared to coc.nvim, as it only focuses on
        linting and syntax checking.

In summary, if you need a full-featured language server client that provides
code completion, diagnostics, formatting, and other language features, coc.nvim
is the better choice. On the other hand, if you're looking for a lightweight
plugin focused on linting and syntax checking, ALE is a suitable option. You
can also use both plugins together, with coc.nvim handling language features
and ALE handling linting, but you might need to adjust some settings to avoid
conflicts or duplicate diagnostics.




## settings

1. hi MatchParen cterm=none ctermbg=green

    - cterm:

        This stands for "color term" or "color terminal." It is used to set the
        text style attributes (e.g., bold, underline, italic) of the syntax
        element in a terminal. In your example, it is set to none, which means
        that no specific text style attributes will be applied to the matching
        parentheses.

    - ctermbg:

        This stands for "color terminal background." It is used to set the
        background color of the syntax element in a terminal. In your example,
        the background color for matching parentheses is set to green.

2. 



### suffix 

#### 1. hint, what is hint in programing?

In programming, a "hint" typically refers to a piece of information or metadata
that you provide to the compiler, interpreter, or runtime system to help
optimize the code, guide the execution, or improve performance. Hints can also
be used to provide additional information to other developers, making the code
more readable and maintainable.

Hints can come in various forms, such as:

Type hints: These are used in statically-typed languages or languages that
support optional typing, like Python or TypeScript. Type hints inform the
compiler or interpreter about the expected type of a variable, function
argument, or return value. This can help catch potential type-related issues
during development and improve code readability.

Compiler hints: These are directives or annotations that you can add to your
code to provide specific instructions to the compiler. For example, in C and
C++, you can use #pragma directives to give the compiler optimization hints or
control the compilation process.

Cache hints: These are hints provided to the CPU or memory management system to
optimize cache usage. For example, in C and C++, you can use the register
keyword to suggest that a variable should be stored in a CPU register for
faster access, although modern compilers often handle this optimization
automatically.

Inlining hints: Some languages and compilers allow you to provide hints for
function inlining. For example, in C++, you can use the inline keyword to
suggest that a function should be inlined, which means that the function's code
is inserted directly into the calling code, potentially improving performance.

Code comments: While not strictly hints in the sense of providing optimization
or execution guidance, code comments can provide valuable context and
explanations for other developers who read or maintain the code. Comments can
clarify the purpose of a piece of code, explain complex algorithms, or provide
usage examples.

It's essential to understand that hints are generally suggestions and not
strict rules. The compiler, interpreter, or runtime system might choose to
ignore the hint if it determines that it is not beneficial or not applicable in
a specific context.

在编程中，“提示”通常是指您提供给编译器、解释器或运行时系统的一些信息或元数据，
以帮助优化代码、指导执行或提高性能。提示还可以用于向其他开发人员提供额外的信息，
使代码更易于阅读和维护。

提示有多种形式，例如：

类型提示：这些在静态类型语言或支持可选类型的语言中使用，如 Python 或 TypeScript。
类型提示通知编译器或解释器有关变量、函数参数或返回值的预期类型。这有助于在开发
过程中捕获潜在的类型相关问题并提高代码可读性。

编译器提示：这些是可以添加到代码中以提供特定指令给编译器的指令或注释。例如，在
C 和 C++ 中，您可以使用 #pragma 指令为编译器提供优化提示或控制编译过程。

缓存提示：这些是提供给 CPU 或内存管理系统以优化缓存使用的提示。例如，在 C 和
C++ 中，您可以使用 register 关键字建议将变量存储在 CPU 寄存器中以加快访问速度，
尽管现代编译器通常会自动处理此优化。

内联提示：一些语言和编译器允许您为函数内联提供提示。例如，在 C++ 中，您可以使用
inline 关键字建议一个函数应该被内联，这意味着将函数的代码直接插入到调用代码中，
可能提高性能。

代码注释：尽管代码注释并非严格意义上的提示，它们在提供优化或执行指导方面并不是
严格的规定。但代码注释可以为阅读或维护代码的其他开发人员提供宝贵的上下文和解释。
注释可以澄清代码的目的、解释复杂的算法或提供使用示例。

理解提示通常是建议而不是严格规则非常重要。编译器、解释器或运行时系统可能会选择
忽略提示，如果它确定在特定上下文中提示不是有益的或不适用。

#### 2. 


