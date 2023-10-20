

[Maya 所需的其他 Linux 库](https://help.autodesk.com/view/MAYAUL/2024/CHS/?guid=GUID-D2B5433C-E0D2-421B-9BD8-24FED217FD7F)

[使用 rpm 软件包在 Linux 上安装 Maya](https://help.autodesk.com/view/MAYAUL/2024/CHS/?guid=GUID-E7E054E1-0E32-4B3C-88F9-BF820EB45BE5)

[crack](https://www.cybermania.ws/apps/autodesk-2024-products-license-server/)

dnf install redhat-lsb-core
dnf install pcre pcre-devel

dnf install libnsl

dnf install xcb-util
dnf install xcb-util-wm
dnf install xcb-util-image
dnf install xcb-util-keysyms
dnf install xcb-util-renderutil

dnf install libXp libXp-devel
dnf install -y libXScrnSaver libXScrnSaver-devel
dnf install -y xorg-x11-fonts-ISO8859-1-75dpi
dnf install -y xorg-x11-fonts-ISO8859-1-100dpi
dnf install -y liberation-sans-fonts
dnf install -y liberation-serif-fonts

yum install -y libGLU


/opt/Autodesk/AdskLicensing/<version_number>/helper/AdskLicensingInstHelper list
```
[
  {
    "feature_id": "MAYA",
    "def_prod_key": "657P1",
    "def_prod_ver": "2024.0.0.F",
    "sel_prod_key": "657P1",
    "sel_prod_ver": "2024.0.0.F",
    "supported_lic_methods": [
      2,
      1,
      4
    ],
    "serial_number_sa": "000-00000000",
    "serial_number_nw": "000-00000000",
    "def_prod_code": "MAYA",
    "sel_prod_code": "MAYA"
  }
]
```
