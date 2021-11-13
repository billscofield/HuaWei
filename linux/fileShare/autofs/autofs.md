
apt install -y autofs
yum install -y autofs

systemctl enable autofs
systemctl restart autofs

挂载是由访问产生的，卸载是由超时产生的



/etc/auto.master
    /rhome  /etc/auto.rhome
    监视目录    具体监视项

vi /etc/auto.rhome
    testuser -rw,sync   10.0.0.1:/working
