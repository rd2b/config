" Vimrc config file
" 60_templates.vim : Use a boilerplate for new files
" author=Remi Debay
" date=2019/04/02
" Use with:
"  source 60_templates.vim

function! s:use_skel(templatefile)
    let template = $HOME . "/" . a:templatefile
    let date = strftime("%Y/%m/%d") " Get the current year in format YYYY
    let file_name = expand("%:t") " Get file name without path
    let i = 0
    for line in readfile(template)
        let line = substitute(line, "<file_name>", file_name, "ge")
        let line = substitute(line, "<date>", date, "ge")
        call append(i, line)
        let i += 1
    endfor
    execute "normal! Go\<Esc>k"
endfunction



let shtemplate = ".vim/templates/skel.sh"
let pytemplate = ".vim/templates/skel.py"
let vimtemplate = ".vim/templates/skel.vim"

autocmd BufNewFile *.{sh,bash,ksh} call <SID>use_skel(shtemplate)
autocmd BufNewFile *.py call <SID>use_skel(pytemplate)
autocmd BufNewFile *.vim call <SID>use_skel(vimtemplate)
