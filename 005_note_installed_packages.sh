#! /bin/sh

app_list=`date +apt_packages_installed_%Y%m%d_%H%M%S.txt`
pip2_list=`date +pip2_packages_installed_%Y%m%d_%H%M%S.txt`
pip3_list=`date +pip3_packages_installed_%Y%m%d_%H%M%S.txt`

echo "Capturing installed packages to: $app_list"
apt list --installed > $app_list

echo "Capturing installed python2 packages to: $pip2_list"
pip2 list > $pip2_list

echo "Capturing installed python3 packages to: $pip3_list"
pip3 list > $pip3_list

