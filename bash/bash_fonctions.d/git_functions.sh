#!/bin/bash
#########################################################
#   Filename   : git_functions.sh                       #
#   Description: Liste de fonctions pour git            #
#########################################################

quiet=false

set -u
set -e

function git_branch_clean {
    git branch --merged |grep -v "master" |xargs  git branch -d
    git gc
}
