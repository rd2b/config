Config Files
=============

Those are my config files for bash, screen and vim.

It provides:
* ssh-agent starting
* Some keyboard fixes (like turning off caps or turing on numlock)
* Adds bash completion to btrfs, dsh, git or virsh command line.
* Vim syntax improvements for python, bash and cfengine3 files.


Feel free to use

Install
-------
Here is how to install for your user:

    cd $HOME
    git clone https://github.com/rd2b/config.git
    ln -sf $HOME/config $HOME/.myconfig
    ~/.myconfig/install
