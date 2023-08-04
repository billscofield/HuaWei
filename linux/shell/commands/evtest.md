# evtest

pacman -Sy evtest

The evtest command is used to monitor and query input devices in Linux. Its
output depends on the type of invocation(调用) and options used, but in general
it provides information about the input device and the events that it supports.

When used in "capture mode" with the command sudo evtest, evtest displays
information about the specified input device , including the device name,
driver version, and supported event types and codes. It then monitors the
device and displays all the events layer events generated , including the event
type, code, value, and timestamp. For example, an output for a key press event
on a keyboard might look like this:

```
Event: time 1690786611.107837, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7000e
Event: time 1690786611.107837, type 1 (EV_KEY), code 37 (KEY_K), value 1                    按下时
Event: time 1690786611.107837, -------------- SYN_REPORT ------------
Event: time 1690786611.207854, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7000e
Event: time 1690786611.207854, type 1 (EV_KEY), code 37 (KEY_K), value 0                    松开时
Event: time 1690786611.207854, -------------- SYN_REPORT ------------
```

EV_MSC: 应该是 scancode
EV_KEY: 应该是 keycode

Event: time 1690786611.107837, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7000e              scancode 是 7000e
Event: time 1690786611.107837, type 1 (EV_KEY), code 37 (KEY_K), value 1                    keycode 是 37


The second field (type) indicates the **type of event **(e.g., EV_KEY for a keyboard event)

the third field (code) indicates the specific **event code** (e.g., KEY_LEFTCTRL for a left control key press event).

The fourth field (value) indicates **the value associated with the event**. For example, for a key press event the value is typically 1, and for a key release event it is typically 0.


