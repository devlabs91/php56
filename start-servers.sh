#!/usr/bin/env bash

service httpd stop

if [ -e /var/run/httpd/httpd.pid ]
then
	rm -f /var/run/httpd/httpd.pid
fi

service httpd start

service sshd stop

if [ -e /var/run/sshd.pid ]
then
	rm -f /var/run/sshd.pid
fi

service sshd start
