#!/bin/sh
output=`id`
UserID=`echo $output | cut -f1 -d ' ' | cut -f2 -d '=' | cut -f1 -d '('`
if [ "$UserID" != "0" ]; then
   echo "This script must be executed as root" 
   exit 1 
fi
#user
egrep "^mw" /etc/group >& /dev/null
if [ $? -ne 0 ];then
groupadd -g 1001 mw
fi

egrep "^weblogic" /etc/passwd >& /dev/null
if [ $? -ne 0 ];then
useradd -G mw -g mw -d /home/weblogic -p weblogic -u 1001 weblogic
echo "weblogic" | passwd --stdin weblogic
fi
#jdk
if [ ! -d "/midware" ]; then
 mkdir -p /midware;
fi
chown -R weblogic:mw /midware
cd /midware
if [ ! -f "jdk-7u80-linux-x64.gz" ];then
echo "jdk-7u80-linux-x64.gz not found!"
exit 1
fi
tar -zxvf jdk-7u80-linux-x64.gz
#cronolog
if [ ! -f "cronolog-1.6.2.tar.gz" ];then
echo "cronolog-1.6.2.tar.gz not found!"
exit 
fi
tar -zxvf cronolog-1.6.2.tar.gz
cd cronolog-1.6.2
./configure --prefix=/usr/local/cronolog
make && make install
