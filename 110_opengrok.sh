#! /bin/bash

if [ -d /opt/opengrok ]
then
    echo "opengrok is already installed?"
    echo "If not, please read this script and walk through by hand."
    echo
    echo "This script cannot be run a second time"
    exit 1
fi


if [ ! -d /opt/opengrok ]
then
    sudo mkdir /opt/opengrok
    sudo chmod a+rwx /opt/opengrok
fi
cd /opt/opengrok

if [ ! -d opengrok-1.1 ]
then
    wget https://github.com/oracle/opengrok/releases/download/1.1/opengrok-1.1.tar.gz
    tar xf opengrok-1.1.tar.gz
fi
ln -s opengrok-1.1 latest

cd /opt/opengrok/latest/tools/

sudo python3 -m pip install opengrok-tools.tar.gz

OPENGROK_WEBAPP=/opt/tomcat/latest/webapps/opengrok
if [ -d ${OPENGROK_WEBAPP} ]
then
    echo 'OPENGROK is already present?'
    echo "HERE: ${OPENGROK_WEBAPP}"
    exit 1
fi

sudo mkdir -p ${OPENGROK_WEBAPP}

cd ${OPENGROK_WEBAPP}

sudo unzip /opt/opengrok/latest/lib/source.war

cd ..
sudo chown -R tomcat.tomcat ${OPENGROK_WEBAPP}

sudo systemctl stop tomcat

echo "Waiting for tomcat to stop..."
for x in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
    sleep 1
    echo -n "$x "
done
sudo systemctl start tomcat
# if this does not work reboot machine

# Now make initial directory for dat
sudo mkdir -m 777 -p /var/opengrok/src/
sudo mkdir -m 777 -p /var/opengrok/etc/
sudo mkdir -m 777 -p /var/opengrok/data/

