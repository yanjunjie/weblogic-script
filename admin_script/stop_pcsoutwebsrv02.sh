#!/bin/sh

#Author:Eian

SERVERNAME=pcsoutwebsrv02

ps -ef | grep java | grep ${SERVERNAME} | grep -v grep | awk '{print $2}' | while read pid
do
        kill -9 ${pid} 2>&1 > /dev/null
        echo "$SERVERNAME(Process ID:) Shutdown Successfully!"
done
