#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-02-22
# Description:	

apt update
apt install software-properties-common apt-transport-https curl

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
dd-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

apt update
apt install code -y

echo "alias='code  --no-sandbox  --user-data-dir=/root/code'" >>~/.zshrc

export JAVA_HOME=/opt/jdk1.8.0_321/
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
