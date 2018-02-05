#!/bin/bash
#########################################################
#   Filename   : bash_history.sh                        #
#   Description: Sauvegarder le bash_history            #
#########################################################

PROGNAME="$(basename $0)"
quiet=false

set -u
set -e


BACKUP_DIR="$HOME/.bash_history.archives/$HOSTNAME/"
BACKUP="$BACKUP_DIR/bash_history-$(date +'%Y%m')"

function history_save {
    echo $BACKUP_DIR
    mkdir -p "$BACKUP_DIR"
    history -a
    cp ~/.bash_history "${BACKUP}"
}

history_save
