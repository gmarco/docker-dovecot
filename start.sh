#!/bin/sh

if [ -f extra.sh ]
then
	. extra.sh
fi
/usr/sbin/dovecot -F
