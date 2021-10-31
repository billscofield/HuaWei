

apt-get install vim
apt-get install texlive-full


此处最好不要使用pdflatex，否则后续可能会报texlive2015:Critical ctex error:
"fontset-unavailable"! CTeX fontset fandol' is unavailable in current mode. }的
错误。


\documentclass[]{article}
    Article 是文档类型格式, 还有 Book, Letter(书信), Report()

\usepackage[UTF8]{ctex}
    \usepackage[选项]{package}, ctex 是中文包

\title{}
\author{}

\begin{document}
\maketitle      

\begin{abstract}
    abstract: 摘要
\end{abstract}

\section{}

\end{document}


\documentclass[]{article}
\usepackage[UTF8]{ctex}
\usepackage{graphicx}       // 插入图片

\title{hello}
\author{}

\begin{document}
\maketitle
\thispagestyle{empty}   // 不要页码
\clearpage              // 类似其它内容到下一页


\setcounter{page}{1}    // 页码
\pagenumbering{roman}
    arabic  阿拉伯数字
    roman   罗马数字
    alph    英文字母

\begin{abstract}
    hello this is a abstract
\end{abstract}
\clearpage

\tableofcontents
    目录
\clearpage

\setcounter{page}{1}
\pagenumbering{arabic}

\section{节名}
\label{sec.intro}       // 自定义的label名




见节\ref{sec.intro}所示

\subsection{子节名}

\paragraph{如何使用?}

\begin{itemize}
    \item 第一个
    \item 第一个
    \item 第一个
\end{itemize}


\begin{enumerate}
    \item ai
    \item ab
    \item ac
\end{enumerate}

\clearpage


\section{如何插入图片}
需要引用功能包 usepackage graphicx

\begin{figure}[htbp]        // h:here    t:top    b:bottom   p:place
    \centering
    \includegraphics[width=0.7\linewidth]{路径}
\end{figure}


\begin{figure}[htbp]
    \centering
    \subfigure[子图\#1]
    {
        \label{fig:sub1}
        \includegraphics[width=0.45\textwidth]{路径}
    }

\end{figure}

\section{如何插入表格}
可以使用excel 自动生成, 使用 convert table to latex 插件





\section{公式的输入}
\begin{equation}

\end{equation}


\end{document}
