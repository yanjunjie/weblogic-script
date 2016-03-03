#!/bin/sh

#Author:Eian

USER_MEM_ARGS="-Xms512m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m"
export USER_MEM_ARGS

JAVA_OPTION="-Djava.security.egd=file:/dev/zero -Dfile.encoding=GBK"
export JAVA_OPTION

/midware/wls10.3.6/user_projects/domains/pcs_domain/bin/startWebLogic.sh 2>&1 |/usr/local/sbin/cronolog /midware/wls10.3.6/user_projects/domains/pcs_domain/nohuplog/admin-%Y%m%d.log &
