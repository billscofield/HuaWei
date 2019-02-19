## PDF压缩软件
Ghostscript, 非常厉害

## 安装

    sudo apt-get install ghostscript

## 使用

    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -dQUIET -sOutputFile=output.pdf input.pdf

## 不同的压缩模式 
1. -dPDFSETTINGS=/screen,压缩比最大，输出文件最小，质量最低
1. -dPDFSETTINGS=/ebook,压缩比稍小，输出文件稍大，质量稍高
1. -dPDFSETTINGS=/prepress,输出文件信息同Acrobat Distiller “Prepress Optimized”设置
1. -dPDFSETTINGS=/default,缺省的，即大多数情况使用的压缩方式
