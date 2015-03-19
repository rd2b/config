#!/bin/bash
#########################################################
#   Filename   : enabled.sh                             #
#   Description: TODO   #
#########################################################

before=$(pwd)
cd ~/.myconfig/bash/bash_fonctions.d/

. hosts.sh
. handlesshagent.sh
. updaterepository.sh

cd $before
