cat <<EOF >file

```
"EOF" is known as a "Here Tag". Basically <<Here tells the shell that you are going to enter a multiline string until the "tag" Here. You can name this tag as you want, it is often EOF or STOP.

Some rules about the Here tags:

The tag can be any string, uppercase or lowercase, though most people use uppercase by convention.
The tag will not be considered as a Here tag if there are other words in that line. In this case, it will merely be considered part of the string. The tag should be by itself on a separate line, to be considered a tag.
The tag should have no leading or trailing spaces in that line to be considered a tag. Otherwise it will be considered as part of the string.
example:

$ cat >> test <<HEREs
> Hello world HERE                                               // Not by itself on a separate line
> Hello world HERE                                               // not considered end of string
> This is a test
>  HERE <-- Leading space, so not considered end of string
> and a new line
> HERE                                                           // Now we have the end of the string
```


---


``` 
The cat <<EOF syntax is very useful when working with multi-line text in
Bash, eg. when assigning multi-line string to a shell variable, file or a pipe.

Examples of cat <<EOF syntax usage in Bash:

1. Assign multi-line string to a shell variable

$ sql=$(cat <<EOF
SELECT foo, bar FROM db
WHERE foo='baz'
EOF
)
The $sql variable now holds the new-line characters too. You can verify with echo -e "$sql".

测试 echo -e $sql 还是在一行显示，并没有预想的那样


2. Pass multi-line string to a file in Bash

$ cat <<EOF > print.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF
The print.sh file now contains:

#!/bin/bash
echo $PWD
echo /home/user


3. Pass multi-line string to a pipe in Bash

$ cat <<EOF | grep 'b' | tee b.txt
foo
bar
baz
EOF
The b.txt file contains bar and baz lines. The same output is printed to stdout.
```



## options

-A, --show-all
    equivalent to -vET

-v, --show-nonprinting
    use ^ and M- notation, except for LFD and TAB

-n, --number
    number all output lines

-s, --squeeze-blank
    suppress repeated empty output lines

-T, --show-tabs
    display TAB characters as ^I

-b, --number-nonblank
    number nonempty output lines, overrides -n

-E, --show-ends
    display $ at end of each line




