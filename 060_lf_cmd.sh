#! /bin/bash

echo "#! /bin/bash" | sudo tee -a /bin/lf
echo 'exec /bin/ls -lptr ${@}' | sudo tee -a /bin/lf
sudo chmod 0755 /bin/lf


