#!/bin/bash

#Create the staging directory
mkdir -p staging

#
./configure --prefix=`pwd`/staging
make
make install

cat << EOF > staging/start.sh
#!/bin/bash -e
sbin/asterisk -vvvf
EOF
chmod +x staging/start.sh
