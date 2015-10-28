#!/bin/bash
#-------------------------------------
# Description : makes mutilples hosts
#-------------------------------------

function hosts {
    local lst=$@
    for h in $lst; do
        host $h
    done
}

