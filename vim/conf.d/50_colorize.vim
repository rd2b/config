""" Vimrc config file
""" 50_colorize.vim : Description
""" author=<author>
""" date=2019/04/02
" Use with:
"  source 50_colorize.vim 



""Coloration syntaxique pour txt2tags
au BufNewFile,BufRead *.t2t set ft=txt2tags
""Coloration syntaxique pour cfengine3
au BufRead,BufNewFile *.cf set ft=cf3
""Coloration syntaxique pour markdown
au BufRead,BufNewFile *.md set ft=markdown

