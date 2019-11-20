#!/bin/sh

mkdir /tmp/images

/usr/sbin/nginx

crontab /etc/crontab && \
/usr/sbin/cron -f