#!/bin/sh
cd /tmp
if [ ! -x "cronolog-1.6.2.tar.gz" ];then
cp /setup/cronolog-1.6.2.tar.gz .
fi
tar -zxvf cronolog-1.6.2.tar.gz
cd cronolog-1.6.2
./configure
make && make install
