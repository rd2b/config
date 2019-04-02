"Adding ~/.vimrc.local"
function! LoadVimLocalRC()
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
endfunction

call LoadVimLocalRC()

