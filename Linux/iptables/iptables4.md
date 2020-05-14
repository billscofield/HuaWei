/var/log/messages 出现 nf_conntrack: table full, dropping packet


查看netfilter 相关的内核参数：
    sysctl -a | grep conntrack

sysctl net.netfilter.nf_conntrack_max  查看限制             //65536

sysctl net.netfilter.nf_conntrack_count 查看当前是否超限

sysctl net.netfilter.nf_conntrack_tcp_timeout_established   //432000

sysctl net.netfilter.nf_conntrack_tcp_timeout_time_wait     //120

sysctl net.netfilter.nf_conntrack_tcp_timeout_close_wait    //60

sysctl net.netfilter.nf_conntrack_tcp_timeout_fin_wait      //120




重新编译内核的话也可以支持7层控制   


(squid代理+iptables)


iptables    不支持区域划分
firewalld   支持区域划分


redhat 6 / centos 6 以及之前的系统 默认的是 iptables
redhat 7 / centos 7 以及之后的系统 默认的是 firewalld

POSTROUTING : 路由判断之后的, SNAT
PREROUTING  : 路由判断之前的，DNAT

centos 上的 service iptables stop 就是清空规则, 好像也不是100%可以


-N 只能和内置的5个链配合
