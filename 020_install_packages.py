#! /usr/bin/env python
import os
import sys

with open( '020_install_packages_list.txt', 'r' ) as f:
   lines = f.readlines()

for ln,line in enumerate( lines ):
    line = line.strip()
    if (len(line)==0) or (line[0]=='#'):
        continue

    print("Processing: %d of %d" % (ln+1, len(lines)))
    cmd = 'sudo apt-get install -y ' + line 

    r = os.system( cmd )
    if r != 0:
        print("ERROR: %d installing: %s" % (r,cmd))

print("Done\n")

