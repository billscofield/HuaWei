


## install

sh install.sh  --katana-path /opt/liujiao/katana --no-3delight --accept-eula

    You may wish to create a start-up script that sets the DEFAULT_RENDERER and
    KATANA_RESOURCES environment variables as appropriate before invoking
    /opt/liujiao/katana/katana.

    Please consult your renderer plug-in's documentation for further information.

    Launch Katana by running: /opt/liujiao/katana/katana



    Extended Info: None Provided
    Host : liujiao
    System ID(s): 989096b8a2bc , be68ae7b435b , 0242b86d351d
    RLM Environment Info: /root/FoundryLicensing/989096b8a2bc:/usr/local/foundry/RLM:/root/FoundryLicensing

    [INFO MAIN]: Launching Katana 7.0v1.010017a UI...
    [INFO MAIN]: Attempting to acquire Interactive license...
    [INFO LicenseCheck]: Interactive License OK
    [INFO ServiceProviderRegistry]: Started registry (listening on 40089)
    [INFO python.Main]: KATANA_RENDER_TILE_SIZE defaulting to 256x256.
    [INFO python.Main]: KATANA_IMAGE_MEMORY defaulting to 45060 MB.
    [INFO python.Main]: KATANA_IMAGE_DISK_MEMORY defaulting to 210556 MB.
    [INFO python.Main]: KATANA_SPEC_CACHE_ENABLED defaulting to 1.
    [WARN python.Main]: There are no valid Renderer plug-ins available.

---

```
[root@localhost katana]# ./katana
[INFO MAIN]: Launching Katana 7.0v1.010017a UI...
[INFO MAIN]: Attempting to acquire Interactive license...
[INFO LicenseCheck]: Interactive License failed.
[INFO LicenseCheck]: FOUNDRY LICENSE ERROR REPORT
----------------------------
Timestamp: Wed Aug  2 16:10:07 2023
License(s) Requested:
katana 2023.0719 interactive with options all
Extended Info: None Provided
Host : katana7
System ID(s) : 7486e237654a
RLM Environment Info: /root/FoundryLicensing/7486e237654a:/usr/local/foundry/RLM:/root/FoundryLicensing


Reason for failure: A suitable license does not exist.

RLM LICENSE DIAGNOSTICS
---------------------------
katana_i : No license for product (-1)
License Path:
/root/FoundryLicensing/7486e237654a:/usr/local/foundry/RLM:/root/FoundryLicensing:/usr/local/foundry/RLM/

qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "" even though it was found.
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: linuxfb, minimal, offscreen, vnc, xcb.

qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "" even though it was found.
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: linuxfb, minimal, offscreen, vnc, xcb.

[ERROR Katana.CrashHandler]: Unexpected return value by Crash Reporter: 6
```

//yum install -y libxcb-devel

https://forum.qt.io/topic/122538/centos-8-qt-dependancy-install-issue/3

dnf install xcb-util-wm
dnf install xcb-util-image
dnf install xcb-util-keysyms
dnf install xcb-util-renderutil

## 启动

katanaBin


## 激活

5053@10.0.8.250
