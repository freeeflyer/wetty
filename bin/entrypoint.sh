#!/bin/sh

# sets right password

adduser -S -h /home/${WETTY_USER} -s /bin/bash ${WETTY_USER}
echo ${WETTY_USER}:${WETTY_HASH} | chpasswd -e

unset WETTY_USER
unset WETTY_HASH

/usr/local/bin/node app.js -p 3000 
