
# LMTOOLS Utility

http://www.taodudu.cc/news/show-74996.html?action=onClick

## Config Services

1. Service Name : AdskNLM

2. Path to the lmgrd.exe Files

    C:\Program Files (x86)\Common Files\Autodesk Shared\Network License Manager\lmgrd.exe

3. Path to the license file

    C:\Program Files (x86)\Common Files\Autodesk Shared\Network License Manager\licenses.lic

    ```
    SERVER localhost 047C162C4132
    USE_SERVER port=2080
    VENDOR adskflex

    # Autodesk 2024 Products
    FEATURE 87918INVTOL_2024_0F adskflex 1.000 permanent 100 VENDOR_STRING=commercial:permanent SUPERSEDE DUP_GROUP=UH ISSUED=01-janv-2021 SN=111-11111111 TS_OK SIGN="1745 D487 C07B 1B0D 10C0 555A B147 1372 8DBF 1E14 ECFC 870D FC59 5ECC 9156 1814 B16F 2E7B 4760 2A4C 745E 732E 5A7D 9A3C E3D4 0359 562E 9B90 713D 3708" SIGN2="100D 7553 E295 6170 A0C2 9567 8124 C44F 22C3 81B1 E629 EA7D 21A5 E308 1BD3 1D1F 0650 B3DC E78C 2AB0 C055 DB08 A9DE 12DB FA5C 3AF6 FFC3 A3EA A323 4699"

    # Autodesk 2023 Products
    ...
    # Autodesk 2022 Products
    ...
    ```

4. Path to the debug log file

    C:\ProgramData\FLEXlm\lmgrd\debug.log


若要配置 macOS 或 Linux 服务器，请按照以下说明继续操作：将许可文件重命名为
adsk_server.lic 并将其保存在桌面上。

将 adsk_server.lic 文件从桌面移动到此隐藏文件夹：
    对于 macOS：/usr/local/flexnetserver
    对于 Linux：/opt/flexnetserver
