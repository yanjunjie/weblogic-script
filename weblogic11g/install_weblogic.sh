#!/bin/sh
echo '==============start the installation of weblogici====================='
if [ ! -f "config.ini" ];then
   echo "config.ini is not found!"
   exit
fi
java_home=`cat config.ini  |grep JAVA_HOME |cut -d "=" -f 2`
bea_home=`cat config.ini  |grep BEA_HOME |cut -d "=" -f 2`
$java_home/bin/java -jar -d64 ../wls1036_generic.jar -mode=silent -silent_xml=silent.xml -log=../wls_install.log -Dpython.cachedir=/tmp/wlstTemp

echo ' ==============start to create pcs_domain============================='
sh $bea_home/wlserver_10.3/common/bin/wlst.sh -i createdomain.py

#echo ' ==============start to create managerServer============================='
#sh $WLS_HOME/wlserver_10.3/common/bin/wlst.sh -i createServer.py

