[Thu May 26 19:19:24 2022] pmd_set_huge: Cannot satisfy [mem 0xf0000000-0xf0200000] with a huge-page mapping due to MTRR override.

[Thu May 26 20:31:44 2022] nvidia-uvm: Loaded the UVM driver in 8 mode, major device number 238
    
    这个好像是电源功率不足导致

---

May 26 21:17:00 niuhaibo systemd: Configuration file /etc/systemd/system/runsunloginclient.service is marked executable. Please remove executable permission bits. Proceeding anyway.



May 26 21:17:00 niuhaibo systemd: [/usr/lib/systemd/system/bolt.service:11] Unknown lvalue 'MemoryDenyWriteExecute' in section 'Service'


May 26 20:55:01 niuhaibo systemd: Created slice User Slice of pcp.
