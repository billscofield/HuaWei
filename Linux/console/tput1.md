
## Deciphering the meaning of the `sgr` variable in `tput`

https://unix.stackexchange.com/questions/659684/deciphering-the-meaning-of-the-sgr-variable-in-tput

sgr is short for "**Select Graphic Rendition**", which is also known as "Set
Attribute" (see the terminfo(5) manual; man 5 terminfo).

What you are most likely using is sgr0 though, which resets all set attributes.


完整的 capname 见 https://www.ibm.com/docs/en/aix/7.1?topic=formats-terminfo-directory
