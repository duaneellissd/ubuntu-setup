#! /bin/bash

SCRIPT_DIR=__INSTALL_LOC__

if [ x"${LD_PRELOAD}" == x"" ]
then
    LD_PRELOAD=${SCRIPT_DIR}/libcurl.so.4
else
    LD_PRELOAD=${SCRIPT_DIR}/libcurl.so.4:${LD_PRELOAD}
fi

MONO=`which mono`
if [ x"${MONO}" == x"" ]
then
    echo "Missing mon.."
fi

export LD_PRELOAD
exec ${MONO} ${SCRIPT_DIR}/GitVersion.exe "${@}"

