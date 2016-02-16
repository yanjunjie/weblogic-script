Install:
###########################################
#./createCentralInventory.sh

#./jdk1.7.0_79/bin/java -jar weblogic/fmw_12.1.3.0.0_wls.jar -silent -invPtrLoc oraInst.loc -responseFile weblogic12c_silent.xml -logFile wls_install.log

createDomain:
###########################################
wls12.1.3/wlserver/common/bin/wlst.sh -i createdomain.py
