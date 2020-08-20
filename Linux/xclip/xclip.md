
apt install xclip

### 终端输出保存到 xclip

    ls | xclip

    echo "helo" | xclip

    xclip -i /etc/passwd

    xclip /etc/passwd

### xclip 中内容输出

    xclip -o

    xclip -o > demo.txt
