#!/bin/bash
#########################################################
#   Filename   : test.sh                             #
#   Description: TODO   #
####################################################
function todo-add {
    tododir="$HOME/repositories/TODOList-gist/"
    todofile="$tododir/todolist.md"
    if ! test -e "$todofile"; then
        echo "File $todofile doesn't exist, please create"
        return 1
    fi

    task="${1:-new task}"

    cd $tododir
    git fetch
    echo "- [ ] $task" >> $todofile

    git status -s
    git add $todofile
    git commit -m "Add New Task: $task"
    git push origin master
    cd -

}
