#!/bin/bash
#########################################################
#   Filename   : bash_history.sh                        #
#   Description: Sauvegarder le bash_history            #
#########################################################

BACKUP_DIR="${HOME}/.bash_history.archives/${HOSTNAME}/"
BACKUP="${BACKUP_DIR/}bash_history-$(date +'%Y%m')"

function history_save {
    mkdir -p "${BACKUP_DIR}"
    cp ~/.bash_history "${BACKUP}"
}

history_save
