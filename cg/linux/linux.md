[Thu May 26 19:19:24 2022] pmd_set_huge: Cannot satisfy [mem 0xf0000000-0xf0200000] with a huge-page mapping due to MTRR override.

[Thu May 26 20:31:44 2022] nvidia-uvm: Loaded the UVM driver in 8 mode, major device number 238
    
    这个好像是电源功率不足导致

---

May 26 21:17:00 niuhaibo systemd: Configuration file /etc/systemd/system/runsunloginclient.service is marked executable. Please remove executable permission bits. Proceeding anyway.



May 26 21:17:00 niuhaibo systemd: [/usr/lib/systemd/system/bolt.service:11] Unknown lvalue 'MemoryDenyWriteExecute' in section 'Service'


May 26 20:55:01 niuhaibo systemd: Created slice User Slice of pcp.

--- 

systemctl disable dbus-org.bluez.service

---
/var/log/messages

5 Aug 20 03:47:10 wangxin nslcd[14868]: [5d6e43] <passwd="wangxin"> ldap_search_ext() failed: Can't contact LDAP server: Connection reset by peer
6 Aug 20 03:47:10 wangxin nslcd[14868]: [5d6e43] <passwd="wangxin"> no available LDAP server found, sleeping 1 seconds
7 Aug 20 03:47:11 wangxin nslcd[14868]: [5d6e43] <passwd="wangxin"> connected to LDAP server ldap://pdc.wrlca.com

---

Aug 20 17:20:42 wangxin SRFeature: Error org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.ScreenSaver was not provided by any .service files

apt install -y at-spi2-core ???

---

Aug 21 14:16:58 wangxin kernel: QXcbEventReader[93249]: segfault at 7f8b14309ef9 ip 00007f8b14309ef9 sp 00007f8b07413e60 error 14

---

Aug 21 17:20:50 wangxin journal: /org/gnome/OnlineAccounts/Accounts/account_1692255419_0: Setting AttentionNeeded to TRUE because EnsureCredentials() failed with: No credenti      als found in the keyring (goa-error-quark, 4)

---

Aug 22 14:37:39 wangxin systemd: Failed to start /etc/rc.d/rc.local Compatibility.
Aug 22 14:37:39 wangxin systemd: Unit rc-local.service entered failed state.
Aug 22 14:37:39 wangxin systemd: rc-local.service failed.

---

Aug 22 14:37:39 wangxin systemd: Failed to start SYSV: Foundry License Server.
Aug 22 14:37:39 wangxin systemd: Unit foundryrlmserver.service entered failed state.
Aug 22 14:37:39 wangxin systemd: foundryrlmserver.service failed.

---

Aug 22 14:37:39 wangxin foundryflexlmserver: FLEXnet Licensing error:-1,359.  System Error: 2 "No such file or directory"
Aug 22 14:37:39 wangxin foundryflexlmserver: For further information, refer to the FLEXnet Licensing documentation

---

Aug 22 14:37:43 wangxin systemd: Failed at step EXEC spawning /mnt/usr/init.sh: No such file or directory


---

unable to open file '/etc/dconf/db/gdm': Failed to open file “/etc/dconf/db/gdm”: open() failed: No such file or directory; expect degraded performance

---

Aug 23 15:49:37 wangxin kernel: nvidia: module verification failed: signature and/or required key missing - tainting kernel

---
