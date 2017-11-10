#!/bin/bash
#-------------------------------------------------
# Description : Opens ssh agent and add keys in it
#-------------------------------------------------

[ -d "$HOME/.ssh" ] || mkdir -p "$HOME/.ssh"
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    if ! /usr/bin/ssh-add -l ; then
        pkill -f /usr/bin/ssh-agent
        echo "Initialising new SSH agent..."
        if [ -f "$HOME/.ssh/id_rsa" ]; then
            /usr/bin/ssh-agent -t 54000 | sed 's/^echo/#echo/' > "${SSH_ENV}"
            echo succeeded
            chmod 600 "${SSH_ENV}"
            . "${SSH_ENV}" > /dev/null
            /usr/bin/ssh-add
            /usr/bin/ssh-add ~/.ssh/id_*.priv
        else
            echo "No sshkey"
        fi
    else
        echo "Key already loaded"
    fi
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
fi

