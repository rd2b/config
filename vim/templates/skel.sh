#!/bin/bash
#########################################################
#   Filename   : <file_name>                             #
#   Description: TODO   #
#########################################################

PROGNAME="$(basename "${0:-}"})"
quiet=false

# From http://bash3boilerplate.sh/
# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

option=""

# Prints help message
function showhelp {
    cat >&2 <<- EOF
Usage: ${PROGNAME} [OPTION] ...
Options:
    -h  prints this help message.
EOF
}

# Prints log message to default output
function log {
    if ! ${quiet}
        echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@"
    done
}

# Prints log message to Error output
function err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

while getopts "o:qh" opt
do
    case "${opt}" in
        o)  option="${OPTARG}"
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

echo "${option}"
