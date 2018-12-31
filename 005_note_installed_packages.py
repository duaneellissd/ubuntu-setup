#! /usr/bin/env python
import os
import sys
import datetime

def create_installed_list():
   fn = datetime.datetime.now().strftime("package_list_%Y%m%d_%H%M%S.txt")
   print("Creating Installed package file: %s" % fn )
   cmd = 'apt list --installed > %s' % fn
   os.system( cmd )

create_installed_list()
sys.exit(1)
