#!/bin/sh

#Author:Eian

USER_MEM_ARGS="-Xms2048m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=512m"
export USER_MEM_ARGS

JAVA_OPTION="-Djava.security.egd=file:/dev/zero -Dfile.encoding=GBK"
export JAVA_OPTION

/midware/wls10.3.6/user_projects/domains/pcs_domain/bin/startManagedWebLogic.sh pcsoutwebsrv02 http://68.168.134.111:7003 2>&1 |/usr/local/sbin/cronolog /midware/wls10.3.6/user_projects/domains/pcs_domain/nohuplog/pcsoutwebsrv02-%Y%m%d.log &
