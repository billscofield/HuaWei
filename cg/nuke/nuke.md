# nuke

## Download

[Downloading a previous version of Nuke](https://support.foundry.com/hc/en-us/articles/360019296599-Q100600-Downloading-a-previous-version-of-Nuke)

## Install

./NukeXXX.run --prefix=/opt/nuke --accept-foundry-eula
    - --prefix=/opt/nuke    默认是当前文件夹
        /opt/nuke : nuke 后边不要加 slash
    - --exclude-subdir  Exclude the Nuke14.0v3 subdirectory
    - --accept-foundry-eula

## Crack

```

[root@maya2024-rocky88 FLT_7.1v1_linux-x86-release-64RH]# ./install.sh 

Please note : The Foundry Licensing Tools are only for installation on the license server machine.
It should not be installed on any of the client-side machines.

Do you wish to continue? <yes/no> yes
Installing The Foundry Licensing Tools 7.1
/usr/local/foundry/LicensingTools7.1/bin/RLM
/usr/local/foundry/LicensingTools7.1/bin/FLEXlm
Setting foundry rlm license server to run at startup
grep: /usr/local/foundry/RLM/log: Is a directory
Default descriptor limit 1024 insufficient, increasing to 28000
Successfully increased descriptor limit to 28000 
Starting RLM Server
08/26 22:58 (rlm) 
08/26 22:58 (rlm) WARNING: No license file for this host (maya2024-rocky88)
08/26 22:58 (rlm)          The hostname in the license file(s)
08/26 22:58 (rlm)          may be incorrect
08/26 22:58 (rlm) 
08/26 22:58 (rlm) License files:
08/26 22:58 (rlm) 
Setting foundry flexlm license server to run at startup
grep: /usr/local/foundry/FLEXlm/log: Is a directory
Default descriptor limit 1024 insufficient, increasing to 10240
Successfully increased descriptor limit to 10240 
Starting lmgrd Server
license manager: can't initialize: Cannot find license file.
 The license files (or license server system network addresses) attempted are 
listed below.  Use LM_LICENSE_FILE to use a different license file,
 or contact your software provider for a license file.
Filename:      /usr/local/flexlm/licenses/license.dat
License path:  /usr/local/flexlm/licenses/license.dat:
FLEXnet Licensing error:-1,359.  System Error: 2 "No such file or directory"
For further information, refer to the FLEXnet Licensing documentation,
available at "www.acresso.com".
Done.

```



执行 Nuke 

```
[liujiao@maya2024-rocky88 Nuke14.0v3]$ ./Nuke14.0 
Nuke 14.0v3, 64 bit, built Feb 16 2023.
Copyright (c) 2023 The Foundry Visionmongers Ltd.  All Rights Reserved.
A license for nuke was not found

FOUNDRY LICENSE ERROR REPORT
----------------------------
Timestamp: Sat Aug 26 23:18:51 2023
License(s) Requested:
nuke 2023.0216 interactive with options all 
Extended Info: 
Host : maya2024-rocky88
System ID(s) : 84a93e7de0ef , 84a93e7de0ec , 5254006ce592       (其实就是网卡 MAC 地址)
RLM Environment Info : /home/liujiao/FoundryLicensing/foundry_client.lic:/usr/local/foundry/RLM
Login Environment Info : /home/liujiao/.local/share/Foundry/Tokens

RLM LICENSE DIAGNOSTICS
nuke : Communications error with license server ENT_STATUS_RLM_LICENSE_COMM_ERROR
License Paths(s) : /home/liujiao/FoundryLicensing/foundry_client.lic:/usr/local/foundry/RLM

LOGIN LICENSE DIAGNOSTICS
nuke : No tokens found for product ENT_STATUS_TEND_TOKEN_NO_PRODUCT
License Paths(s) : /home/liujiao/.local/share/Foundry/Tokens
[liujiao@maya2024-rocky88 Nuke14.0v3]$ ./Nuke14.0 
Nuke 14.0v3, 64 bit, built Feb 16 2023.
Copyright (c) 2023 The Foundry Visionmongers Ltd.  All Rights Reserved.

Disk cache /var/tmp/nuke-u1000/ViewerCache/??: 0MB (0% of 10240MB) used in 0 files.
Disk cache /var/tmp/nuke-u1000/ViewerCache/??: created 256 directories
ERROR 23:20:02.391:frameserver.worker-0(49878) worker.py:270 startApplication(): Could not start render application
```

---

执行 Nuke14.1 Beta

```
root@maya2024-rocky88 Nuke14.1v1-Beta.2]# ./Nuke14.1 
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
Nuke 14.1v1.111044b, 64 bit, built Aug  3 2023.
Copyright (c) 2023 The Foundry Visionmongers Ltd.  All Rights Reserved.
Using "nuke" licence.  Beta expires on: 2023/11/1

Unable to read VR Path Registry from /root/.config/openvr/openvrpaths.vrpath
Disk cache /var/tmp/nuke-u0/ViewerCache/??: 0MB (0% of 10240MB) used in 0 files.
```
