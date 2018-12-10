#!/bin/bash -x
set -e

echo "external-ip=$KMS_STUN_IP_AUX" > /etc/turnserver.conf
echo "listening-port=3478" >> /etc/turnserver.conf
echo "fingerprint" >> /etc/turnserver.conf
echo "lt-cred-mech" >> /etc/turnserver.conf
echo "max-port=65535" >> /etc/turnserver.conf
echo "min-port=49152" >> /etc/turnserver.conf
echo "pidfile=\"/var/run/turnserver.pid\"" > /etc/turnserver.conf
echo "realm=$DB_USER" >> /etc/turnserver.conf
echo "simple-log" >> /etc/turnserver.conf
echo "redis-userdb=\"ip=$DB_HOST dbname=0 password=$DB_PASSWORD connect_timeout=30\"" >> /etc/turnserver.conf
echo "verbose" >> /etc/turnserver.conf
