## sort

sort lines of text files

-u, --unique
    with  -c,  check for strict ordering; 
    without -c, output only the first of an equal run

-r, --reverse
    reverse the result of comparisons

-o, --output=FILE
    write result to FILE instead of standard output

-n, --numeric-sort
    compare accordin

-t, --field-separator=SEP
    use SEP instead of non-blank to blank transition

-k, --key=KEYDEF
    sort via a key; KEYDEF gives location and type  

-b, --ignore-leading-blanks
    ignore leading blanks

-R, --random-sort
    shuffle, but group identical keys.  See shuf(1)


KEYDEF is F[.C][OPTS][,F[.C][OPTS]] for start  and  stop  posi‐
tion,  where  F is a field number and C a character position in
the field; both are origin 1, and the stop position defaults to
the  line's end.  If neither -t nor -b is in effect, characters
in a field are counted from  the  beginning  of  the  preceding
whitespace.  OPTS is one or more single-letter ordering options
[bdfgiMhnRrV], which override global ordering options for  that
key.   If no key is given, use the entire line as the key.  Use
--debug to diagnose incorrect key usage.

SIZE may be followed by the following multiplicative  suffixes:
%  1%  of memory, b 1, K 1024 (default), and so on for M, G, T,
P, E, Z, Y.

*** WARNING *** The locale specified by the environment affects
sort  order.   Set  LC_ALL=C  to get the traditional sort order
that uses native byte values.


### 练习

sort -n -t: -k3 /etc/passwd

sort -nr -t: -k3 /etc/passwd

```
➜  diff sort -k2 a -n
111                 当key没有时是最小的，然后比较不是数字的, 最后比较有数字的
hello wo 222
xian 2
you 3
qun 9
liu 11

➜  diff sort -k2 a
111                 当key没有时是最小的，然后按照ascii比较
liu 11
xian 2
you 3
qun 9
hello wo 222

```
