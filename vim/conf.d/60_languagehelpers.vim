"" vimrc file
"" author: Remi Debay
"" Shortcuts for programming

imap \fpath  <C-R>=expand("%:p")<CR>
imap \fname  <C-R>=expand("%")<CR>

"------------------------------------------------------------------------------
"Maps pourbashfiles :
"Headers :
imap ;#headersep #########################################################<CR>
imap ;headername <TAB>Name: <TAB>\fname<TAB><TAB>
imap ;headerdescription <TAB>Description: TODO<TAB>
imap ;#header  <LEFT>;#headersep#;headername#<CR>#;headerdescription#<CR>;#headersep
imap ;header ;#header

"Fonctions :
imap ;#commentairefonctionsep  #-------------------------------------
imap ;#commentairefonction <LEFT>;#commentairefonctionsep<CR># Description : TODO <CR>;#commentairefonctionsep
imap ;indent <space><space><space><space>

" Variables subversion
imap ;subversion # Versionned file:<CR># $HeadURL$<CR># $Id$<CR>

function! Bashtricks()
    imap ;myft YES YOU ARE IN SH
    imap ;header #!/bin/bash<CR>;#header
    imap ;func ;#commentairefonction<CR>function TODO {<CR><CR>}

endfunction

function! Phptricks()
    imap ;myft YES YOU ARE IN PHP
    imap ;#headersep /************************************************/<CR>
    imap ;#header  <?<CR><LEFT>;#headersep/*;headername*/<CR>/*;headerdescription*/<CR>;#headersep
    imap ;#commentairefonction <LEFT>/**<CR><LEFT>* Description : TODO <CR>*/
    imap ;func ;#commentairefonction<CR>function TODO(){<CR><CR>}
endfunction

function! Pythontricks()
    imap ;myft YES YOU ARE IN PYTHON
    imap ;main if __name__ == '__main__':<CR><space><space><space><space>
    imap ;func def TODO():<CR>"""DESCRIPTION"""<CR>
    imap ;header #!/usr/bin/env python<CR>;#header
endfunction

function! Crontricks()
    imap ;header ;#header
    imap ;myft YES YOU ARE IN CRONTAB
endfunction


autocmd FileType python :call Pythontricks()
autocmd FileType php    :call Phptricks()
autocmd FileType sh     :call Bashtricks()
autocmd FileType crontab :call Crontricks()


""Supprimer le mappage en entrant dans vimrc
autocmd VimEnter * if @% == '.vimrc' | mapclear!
