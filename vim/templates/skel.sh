#!/bin/bash
#########################################################
#   Filename   : <file_name>                             #
#   Description: TODO   #
#########################################################

PROGNAME="$(basename $0)"
quiet=false

set -u
set -e

option=""

# Prints help message
function showhelp {
    cat >&2 <<- EOF
Usage: $PROGNAME [OPTION] ...
Options:
    -h  prints this help message.
EOF
}

# Prints log message to default output
function log {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@"
}

# Prints log message to Error output
function err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

while getopts "o:qh" opt
do
    case $opt in
        o)  option=$OPTARG
            ;;
        q)  quiet=true
            ;;
        h)  showhelp
            exit 1
            ;;
        *)  showhelp
            exit 1
            ;;
    esac
done

echo $option
