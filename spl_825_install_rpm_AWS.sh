#!/bin/bash

UNAME=`uname`
if [ $UNAME == Linux ];then
SPLUNK=`/bin/rpm -qa | grep -i splunk`;
PROCESS=`ps -ef | grep -i splunk | grep -v grep | grep -v s_splunk`;
echo "$SPLUNK";
if [[ "$SPLUNK" == "" && "$PROCESS" == "" ]];
then
/bin/rpm -ivh splunkforwarder-8.2.5-77015bc7a462-linux-2.6-x86_64.rpm;
tar -xvf wu_aws-lz_deploymentclient_linux.tar -C /opt/splunkforwarder/etc/apps/;
chmod -R 755 /opt/splunkforwarder/etc/apps/wu_aws-lz_deploymentclient_linux/;
chown -R splunk:splunk /opt/splunkforwarder;
/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd SAMM@0rFPHWo;
/opt/splunkforwarder/bin/splunk enable boot-start; 
/opt/splunkforwarder/bin/splunk status;
else
echo "This is not Linux server or splunk is already installed - please check"
fi
fi
