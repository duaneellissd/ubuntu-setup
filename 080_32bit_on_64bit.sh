#! /bin/bash

M=`uname -m`
case $M in
    x86_64)
	echo "Linux64"
	;;
    i[3456]86)
	echo "Linux32 - 32bit support is not required"
	exit 0
	;;
    *)
	echo "Unknown build host: $M"
	exit 1
	;;
esac

echo ""
echo "Adding 32bit support"
echo ""
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

echo ""
echo "Done"
echo ""
exit 0
