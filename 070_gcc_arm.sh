#! /bin/bash

# To update:
#
# 1) GOTO:
#    https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads
#
# 2) Click & COPY the entire link to the Linux url
#
# 3) Paste it here, it *MUST* be in single quotes.
#
URL='https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2018-q2-update'

# 4 - Determine the PROPER base tar filename :-(  sadly curl and wget don't extract this.
#     This should not have the TAR.GZ suffix
#
SCRIPT_NAME=`realpath ${BASH_SOURCE[0]}`
PROPER_BASE_FILENAME=gcc-arm-none-eabi-7-2018-q2-update

OPT_GCC_ARM=/opt/gcc-arm

# 5 - Verify this is correct
PROPER_TAR_BZ_FILENAME=${PROPER_BASE_FILENAME}-linux.tar.bz2

DL_FILENAME=~/Downloads/${PROPER_TAR_BZ_FILENAME} 
# 6 - go download it.

dl=false
if [ ! -f ${DL_FILENAME} ]
then
    dl=true
else
    check=`md5sum ${DL_FILENAME} | cut -d ' ' -f1`

    if [ x"${check}" != x"299ebd3f1c2c90930d28ab82e5d8d6c0" ]
    then
	dl=true
    else
	echo "Using Cached image: ${DL_FILENAME}"
    fi
fi

if $dl
then
    echo "Downloading ${DL_FILENAME}"
    curl -L -o ${DL_FILENAME} ${URL}
fi


if [ ! -d ${OPT_GCC_ARM} ]
then
    sudo mkdir -p ${OPT_GCC_ARM}
fi

sudo chmod a+rwx ${OPT_GCC_ARM}

cd ${OPT_GCC_ARM}
rm -rf ${PROPER_BASE_FILENAME}
tar xf ${DL_FILENAME}

if [ ! -e current ]
then
    rm -f current
    ln -s ${PROPER_BASE_FILENAME} current
fi

add=true
for d in `echo $PATH | tr ':' ' '`
do
    if [ x"$d" == x"${OPT_GCC_ARM}/current/bin" ]
    then
	add=false
    fi
done

if $add
then
    echo "Adding ${OPT_GCC_ARM}/current to path"
    if [ x"${OPT_GCC_ARM}" != x"/opt/gcc-arm" ]
    then
	echo "FIX THIS CODE"
	exit 1
    fi
    echo "# added by script: ${SCRIPT_NAME}" >> ~/.bashrc
    echo "# in cwd: `pwd`" >> ~/.bashrc
    echo "# on `date`" >> ~/.bashrc
    echo "OPT_GCC_ARM=${OPT_GCC_ARM}" >> ~/.bashrc
    echo 'export PATH=${OPT_GCC_ARM}/current/bin:${PATH}' >> ~/.bashrc
else
    echo "Directory ${OPT_GCC_ARM}/current already in path"
fi
exit 0

   

    
	



