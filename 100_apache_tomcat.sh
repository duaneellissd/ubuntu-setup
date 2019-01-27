#! /bin/bash

HERE=`pwd`

TOMCAT_INSTALL_ROOT_DIR=${TOMCAT_INSTALL_DIR}

if [ -d ${TOMCAT_INSTALL_ROOT_DIR} ]
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

sudo useradd -r -m -U -d ${TOMCAT_INSTALL_ROOT_DIR} -s /bin/false tomcat


wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz -P /tmp

TOMCAT_LATEST=${TOMCAT_LATEST}

sudo ln -s ${TOMCAT_INSTALL_ROOT_DIR}/apache-tomcat-9.0.14 ${TOMCAT_LATEST}

sudo chown -RH tomcat.tomcat ${TOMCAT_LATEST}

sudo chmod o+x ${TOMCAT_LATEST}/bin/

sudo cp ./misc_files/ubuntu18_tomcat_service /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl enable tomcat

LOGDIR=${TOMCAT_LATEST}/logs

if [ ! -d ${LOGDIR} ]
then
	mkdir -p ${LOGDIR}
fi
sudo chown -R tomcat.tomcat ${LOGDIR}
# make the logdir enterable
sudo chmod  a+x ${LOGDIR}
sudo chmod -R a+r ${LOGDIR}


cd ${HERE}/misc-files

#
# this installs with username: "admin", password: "password"
#
F=_opt_tomcat_latest_webapps_manager_META-INF_context.xml
T=${TOMCAT_LATEST}/webapps/manager/META-INF/context.xml
sudo cp $F $T

# this installs with username: "admin", password: "password"
F=_opt_tomcat_latest_webapps_host-manager_META-INF_context.xml
T=${TOMCAT_LATEST}/webapps/host-manager/META-INF/context.xml
sudo cp $F $T

cd ..
echo "DONE"

