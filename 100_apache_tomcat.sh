#! /bin/bash

if [ -d /opt/tomcat ]
then
    echo "========================================"
    echo "TOMCAT seems to be installed - this script cannot be run a 2nd time"
    echo "You'll have to do that manually if needed please read the source"
    echo "of this script ..."
    echo "========================================"
    exit 1
fi


# Taken from: https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-18-04/

# NOTE somethings (java, ctags) are installed by other means earlier

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat


wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz -P /tmp

sudo ln -s /opt/tomcat/apache-tomcat-9.0.14 /opt/tomcat/latest

sudo chown -RH tomcat: /opt/tomcat/latest

sudo chmod o+x /opt/tomcat/latest/bin/

sudo cp ./misc_files/ubuntu18_tomcat_service /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl enable tomcat

cd misc-files

#
# this installs with username: "admin", password: "password"
#
F=_opt_tomcat_latest_webapps_manager_META-INF_context.xml
T=/opt/tomcat/latest/webapps/manager/META-INF/context.xml
sudo cp $F $T

# this installs with username: "admin", password: "password"
F=_opt_tomcat_latest_webapps_host-manager_META-INF_context.xml
T=/opt/tomcat/latest/webapps/host-manager/META-INF/context.xml
sudo cp $F $T

cd ..
echo "DONE"
