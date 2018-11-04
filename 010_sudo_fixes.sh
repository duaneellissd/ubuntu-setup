#! /bin/bash

FILE=/etc/sudoers.d/duane-ubuntu

if [ ! -f ${FILE} ]
then
    echo "# Created `date`" | sudo tee -a ${FILE}
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a ${FILE}
    echo "Defaults timestamp_timeout=1000000" | sudo tee -a ${FILE}
else
    echo "File: ${FILE} already exists - skip"
fi

