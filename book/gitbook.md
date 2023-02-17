# gitbook

node : v12.22.1
npm : v6.14.12

npm i -g gitbook-cli
cd /usr/local/lib/node_modules/gitbook-cli
npm i graceful-fs@4.1.4 --save
cd /usr/local/lib/node_modules/gitbook-cli/node_modules/npm
npm i graceful-fs@4.1.4 --save
cd {your gitbook directory}
gitbook init
gitbook serve

node 版本太高也不行

[参考](https://github.com/GitbookIO/gitbook-cli/issues/110)


