
## unique

report or omit repeated lines

With no options, matching lines are merged to the first occurrence.

```
1
2
2
2
3
1

uniq a
    1
    2
    3
    1
```

-c, --count
    prefix lines by the number of occurrences

    uniq -c a.txt

    次数 内容

