#!/bin/bash
#########################################################
#   Filename   : monitoringh.sh                             #
#   Description: TODO   #
#########################################################

PROGNAME="$(basename $0)"
quiet=false

set -u

plugins="/usr/lib/nagios/plugins"
CHECK_FROMP01="$plugins/check_by_ssh -H p01.wxz.fr -u root -n p01.wxz.fr -t 30 "
CHECK_FROMP02="$plugins/check_by_ssh -H p02.wxz.fr -u root -n p02.wxz.fr -t 30 "


# All
$plugins/check_apt

$plugins/check_disk -w 20% -c 10% -p / -e
$plugins/check_disk -w 20% -c 10% -p /boot -e
$plugins/check_disk -w 20% -c 10% -p /home -e
$plugins/check_disk -w 20% -c 10% -p /usr -e
$plugins/check_disk -w 20% -c 10% -p /var -e
$plugins/check_disk -w 20% -c 10% -p /var/log -e


# sur *.wxz.fr
sudo $plugins/check_host p01.wxz.fr
sudo $plugins/check_host p02.wxz.fr
sudo $plugins/check_host home.wxz.fr
sudo $plugins/check_host rss.wxz.fr

$plugins/check_load  -w 2,2,2 -c 4,4,4 -r
/usr/lib/nagios/plugins/check_http -H home.wxz.fr -f ok
/usr/lib/nagios/plugins/check_http -H home.wxz.fr -S -k jeedom -C 30
/usr/lib/nagios/plugins/check_http -H home.wxz.fr -S -C 30
/usr/lib/nagios/plugins/check_http -H rss.wxz.fr -f ok
/usr/lib/nagios/plugins/check_http -H rss.wxz.fr -S -k rss -C 30


echo ""
echo "p01.wxz.fr:"
$CHECK_FROMP01 \
-C "$plugins/check_host 192.168.0.20" \
-C "$plugins/check_host 192.168.0.25" \
-C "$plugins/check_host 192.168.0.154" \
-C "$plugins/check_host 192.168.0.254" \
-C "$plugins/check_apt" \
-C "$plugins/check_procs" \
-C "$plugins/check_procs -c 1:1 -a /usr/bin/rslsync" \
-C "$plugins/check_procs -c 1:2 -a transmission-daemon" \
-C "$plugins/check_disk -w 20% -c 10% -p / -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /boot -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /home -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /data -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /usr -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /var -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /var/log -e" \
-C "$plugins/check_load  -w 2,2,2 -c 4,4,4 -r" \
| grep -v "^STATUS"


echo ""
echo "p02.wxz.fr:"
$CHECK_FROMP02 \
-C "$plugins/check_host 192.168.0.20" \
-C "$plugins/check_host 192.168.0.25" \
-C "$plugins/check_host 192.168.0.154" \
-C "$plugins/check_host 192.168.0.254" \
-C "$plugins/check_apt" \
-C "$plugins/check_procs" \
-C "$plugins/check_procs -c 1:1 -a /usr/bin/rslsync" \
-C "$plugins/check_disk -w 20% -c 10% -p / -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /boot -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /home -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /data -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /usr -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /var -e" \
-C "$plugins/check_disk -w 20% -c 10% -p /var/log -e" \
-C "$plugins/check_load  -w 2,2,2 -c 4,4,4 -r" \
| grep -v "^STATUS"
