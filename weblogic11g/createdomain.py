
if __name__ == '__main__': 
    from wlstModule import *#@UnusedWildImport
    
import os
import ConfigParser
#=======================================================================================
# This is an example of a simple WLST offline configuration script. The script creates 
# a simple WebLogic domain using the Basic WebLogic Server Domain template. The script 
# demonstrates how to open a domain template, create and edit configuration objects, 
# and write the domain configuration information to the specified directory.
#
# This sample uses the demo Pointbase Server that is installed with your product.
# Before starting the Administration Server, you should start the demo Pointbase server
# by issuing one of the following commands:
#
# Windows: WL_HOME\common\eval\pointbase\tools\startPointBase.cmd
# UNIX: WL_HOME/common/eval/pointbase/tools/startPointBase.sh
#
# (WL_HOME refers to the top-level installation directory for WebLogic Server.)
#
# The sample consists of a single server, representing a typical development environment. 
# This type of configuration is not recommended for production environments.
#
# Please note that some of the values used in this script are subject to change based on 
# your WebLogic installation and the template you are using.
#
# Usage: 
#      java weblogic.WLST <WLST_script> 
#
# Where: 
#      <WLST_script> specifies the full path to the WLST script.
#=======================================================================================

#=======================================================================================
# Open a domain template.
#=======================================================================================


config=ConfigParser.ConfigParser()
config.read("config.ini")
wlHome = config.get("AdminServer","WLS_HOME")
domainHome = config.get("AdminServer","DOMAIN_HOME")
adminPort = config.get("AdminServer","ADMIN_PORT")
adminIP = config.get("AdminServer","ADMIN_IP")
password = config.get("AdminServer","PASSWORD")

print "wlHome="+wlHome
print "adminPort="+adminPort
print "adminIP="+adminIP
print "adminPASS="+password
print "domainHome="+domainHome

readTemplate(wlHome + "/common/templates/domains/wls.jar")

#=======================================================================================
# Configure the Administration Server and SSL port.
#
# To enable access by both local and remote processes, you should not set the 
# listen address for the server instance (that is, it should be left blank or not set). 
# In this case, the server instance will determine the address of the machine and 
# listen on it. 
#=======================================================================================

cd('Servers/AdminServer')
set('ListenAddress', adminIP)
set('ListenPort', 7001)

create('AdminServer','SSL')
cd('SSL/AdminServer')
set('Enabled', 'false')

#=======================================================================================
# Define the user password for weblogic.
#=======================================================================================

cd('/')
cmo=cd('Security/base_domain/User/weblogic')
# Please set password here before using this script, e.g. cmo.setPassword('value')
cmo.setPassword(password)
#set('StagingMode','Production')
#=======================================================================================
# Write the domain and close the domain template.
#=======================================================================================
#Boolean value,whether to allow an existing domain to be overwritten,defaults to false
setOption('OverwriteDomain', 'true')
#Used in the mode ,dev or prod,the option defaults to dev
setOption('ServerStartMode', 'prod')


#writeDomain(beaHome + '/user_projects/domains/pcs_domain')
writeDomain(domainHome)
closeTemplate()
print "script returns SUCCESS"   

#=======================================================================================
# Exit WLST.
#=======================================================================================

exit()


