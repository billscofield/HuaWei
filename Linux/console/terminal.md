
https://en.wikipedia.org/wiki/Teleprinter

A teleprinter (teletypewriter, teletype or TTY) is an electromechanical device
that can be used to send and receive typed messages through various
communications channels, in both point-to-point and point-to-multipoint
configurations.


---

https://en.wikipedia.org/wiki/Computer_terminal#cite_note-3

A computer terminal is an electronic or electromechanical([ɪˌlektroʊməˈkænɪkəl]
电动机械的) hardware device that can be used for entering data into, and
transcribing([trænˈskraɪb] 转录;抄写) data from, a computer or a computing
system. The teletype was an example of an early day hardcopy terminal, and
predated(在日期上早于（先于）) the use of a computer screen by decades.

Early terminals were inexpensive devices but very slow compared to **punched
cards** or **paper tape** for input, but as the technology improved and **video
displays** were introduced, terminals pushed these older forms of interaction
from the industry. A related development was **timesharing systems**, which
evolved in parallel and made up for any inefficiencies([ˌɪnɪˈfɪʃnsi]效率低;无效
率;) of the user's typing ability with the ability to support multiple users on
the same machine, each at their own terminal/terminals.

The function of a terminal is typically confined to transcription(抄写；抄本)
and input of data; a device with significant local programmable data processing
capability may be called a "**smart terminal**" or **fat client**. A terminal
that depends on the host computer for its processing power is called a
"**dumb([dʌm]哑的) terminal**" or a **thin client**. A personal computer can
run terminal emulator software that replicates functions of a real-world
terminal, sometimes allowing concurrent(并发的) use of local programs and
access to a distant terminal host system.

## 1. Hard-copy terminals

Early user terminals connected to computers were, like the FlexoWriter,
electromechanical teleprinters/teletypewriters (TeleTYpewriter, TTY), such as
the Teletype Model 33, originally used for telegraphy;

The DECwriter was the last major printing-terminal product. It faded away after
1980 under pressure from VDUs, with the last revision (the DECwriter IV of
1982) abandoning the classic teletypewriter form for one more resembling a
desktop printer. 


### DECwriter

https://en.wikipedia.org/wiki/DECwriter

The DECwriter series was a family of computer terminals from Digital Equipment
Corporation (DEC). They were typically used in a fashion similar to a teletype,
with a computer output being printed to paper and the user inputting
information on the keyboard. In contrast to teletypes, the DECwriters were
based on dot matrix printer technology, one of the first examples of such a
system to be introduced. Versions lacking a keyboard were also available for
use as computer printers, which eventually became the only models as smart
terminals became the main way to interact with mainframes and minicomputers in
the 1980s.

There were four series of machines, starting with the original DECwriter in
1970, the DECwriter II in 1974, DECwriter III in 1978, and the final DECwriter
IV in 1982. The first three were physically similar, large machines mounted on
a stand normally positioned above a box of fanfold paper. They differed
primarily in speed and the selection of computer interfaces. The IV was
significantly different, intended for desktop use and looking more like an IBM
Selectric typewriter than a traditional printer. Most models were available
without a keyboard for print-only usage, in which case they were later known as
DECprinters.


## 2. VDUs

A Video Display Unit (VDU) displays information on a screen rather than
printing text to paper and typically uses a cathode-ray tube (CRT). Due to that
technology these devices were often called "CRTs". VDUs in the 1950s were
typically designed for displaying graphical data rather than just text. CRT
displays in that time frame were used in, e.g., experimental computers at MIT;
Commercial computer from, e.g., DEC, ERA, IBM, UNIVAC; military computers for,
e.g., BMEWS, BUIC, SAGE. 

Important early products were the ADM-3A, VT52, and VT100. These devices used
no CPU, instead relying on individual logic gates or very primitive LSI chips.
This made them inexpensive and they quickly became extremely popular
Input-Output devices on many different types of computer system, often
replacing earlier and more expensive printing terminals.

The great variations in the control codes between makers gave rise to software
that identified and grouped terminal types so the system software would
correctly display input forms using the appropriate control codes; 

In Unix-like systems the **termcap** or **terminfo files**, the **stty
utility**, and the **TERM** environment variable would be used;

VDUs were eventually displaced from most applications by networked personal
computers, at first slowly after 1985 and with increasing speed in the 1990s.
However, they had a lasting influence on PCs. The keyboard layout of the VT220
terminal strongly influenced the Model M shipped on IBM PCs from 1985, and
**through it all later(历经这一切)** computer keyboards.

By the time cathode-ray tubes were replaced by flatscreens after the year 2000,
the hardware computer terminal was obsolete.

### Terminal modes

https://www.ibm.com/docs/en/linux-on-systems?topic=wysk-terminal-modes

The Linux terminals that are provided by the console device drivers include
line-mode terminals, block-mode terminals, and full-screen mode terminals.

1. On a full-screen mode terminal, pressing any key immediately results in data
being sent to the terminal. Also, terminal output can be positioned anywhere on
the screen. This feature facilitates advanced interactive capability for
terminal-based applications like the vi editor.

1. On a line-mode terminal, the user first types a full line, and then presses
Enter to indicate that the line is complete. The device driver then issues a
read to get the completed line, adds a new line, and hands over the input to
the generic TTY routines.

1. The terminal that is provided by the 3270 terminal device driver is a
traditional IBM® mainframe block-mode terminal. Block-mode terminals provide
full-screen output support and users can type input in predefined fields on the
screen. Other than on typical full-screen mode terminals, no input is passed on
until the user presses Enter. The terminal that is provided by the 3270
terminal device driver provides limited support for full-screen applications.
For example, the ned editor is supported, but not vi.



## 3. "Intelligent" terminals

An "intelligent" terminal[13] does its own processing, usually implying a
microprocessor is built in, but not all terminals with microprocessors did any
real processing of input: the main computer to which it was attached would have
to respond quickly to each keystroke. 

**The term "intelligent" in this context dates from 1969.**

the single factor that classed a terminal as "intelligent" was its ability to
process user-input within the terminal

    not interrupting the main computer at each keystroke

    and send a block of data at a time (for example: when the user has finished
    a whole field or form).  





escape sequence

the VT52, VT100 or ANSI escape sequences

## 显卡的 character mode 和 graphics mode

https://www.webopedia.com/definitions/character-mode/

Many video adapters support several different modes of resolution. All such
modes are divided into two general categories: character mode (also called text
mode) and graphics mode. In character mode, the display screen is treated as an
array of blocks, each of which can hold one ASCII character. In graphics mode,
the display screen is treated as an array of pixels, with characters and other
shapes formed by turning on combinations of pixels.

Of the two modes, character mode is much simpler. Programs that run in
character mode generally run much faster than those that run in graphics mode,
but they are limited in the variety of fonts and shapes they can display.
Programs that run entirely in character mode are called character-based
programs.
