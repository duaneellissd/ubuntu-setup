#! /bin/bash

set -e
set -x

HERE=`pwd`
VER_GITVERSION=v4.0.0
ZIP_FILENAME=GitVersion-bin-net40-${VER_GITVERSION}.zip
URL_GITVERSION_ZIP=https://github.com/GitTools/GitVersion/releases/download/${VER_GITVERSION}/${ZIP_FILENAME}

sudo -H apt-get install -y mono-complete

HIDING_PLACE=/usr/local/lib/git_version_hides_here

sudo mkdir -p ${HIDING_PLACE}
sudo chmod +0755 ${HIDING_PLACE}

FIXED_DIR=${HIDING_PLACE}/gitversion-${VER_GITVERSION}
if [ -e ${FIXED_DIR} ]
then
    sudo rm -rf ${FIXED_DIR}
fi
sudo mkdir -p ${FIXED_DIR}
sudo chmod 0755 ${FIXED_DIR}

cd ${FIXED_DIR}
sudo wget ${URL_GITVERSION_ZIP}

if [ $? -ne 0 ]
then
    echo "Cannot fetch git version"
    exit 1
fi

sudo unzip ${ZIP_FILENAME}
sudo cp  ${HERE}/gitversion-fix/libcurl.so.4  ${FIXED_DIR}
cat ${HERE}/gitversion-fix/git_version_wrapper.sh |  \
    sed -e s@__INSTALL_LOC__@${FIXED_DIR}@ | sudo tee -a ${FIXED_DIR}/git_version_wrapper.sh > /dev/null
sudo chmod 0555 ${FIXED_DIR}/*.sh
sudo chmod 0555 ${FIXED_DIR}/libcurl*

LINK_TARGET=${FIXED_DIR}/git_version_wrapper.sh
LINK_SRC=/usr/local/bin/gitversion

sudo rm -f ${LINK_SRC}
sudo ln -s ${LINK_TARGET} ${LINK_SRC}

if [ -x gitversion ]
then
    echo "Success"
else
    echo "Failure"
fi


