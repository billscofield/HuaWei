# kplayer

curl -fsSL get.kplayer.net | bash

```bash
#!/bin/bash

set -e
curl --fail  http://download.bytelang.cn/kplayer-v0.5.7-$(uname -s | sed s/Linux/linux/)_$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/amd64/).tar.gz -o kplayer.tar.gz
tar zxvf kplayer.tar.gz
rm -rf kplayer.tar.gz


#wget  http://download.bytelang.cn/kplayer-v0.5.7-$(uname -s | sed s/Linux/linux/)_$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/amd64/).tar.gz
```

./kplayer play start --daemon (官方自带后台运行，自己nohup也可)
./kplayer play stop
