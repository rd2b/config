#!/bin/bash

function updaterepository {
    local defaultrepos="$HOME/repositories"

    if [ -d $defaultrepos ]
    then
        for dir in `ls $defaultrepos`
        do
            echo "Handling $defaultrepos/$dir"
            cd $defaultrepos/$dir
            [ -d $defaultrepos/$dir/.svn ] && svn up
            [ -d $defaultrepos/$dir/.git ] && git pull
            cd $defaultrepos
        done
    fi
}
