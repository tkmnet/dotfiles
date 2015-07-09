au BufRead,BufNewFile *.ol set tabstop=3
au BufRead,BufNewFile *.ol set shiftwidth=3
au BufRead,BufNewFile *.ol set listchars=tab:\|-
au BufRead,BufNewFile *.ol syn match lineComment display excludenl /^> .*$/
au BufRead,BufNewFile *.ol :hi lineComment ctermfg=183

au BufRead,BufNewFile *.ol syn match lineTitle display excludenl /\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle ctermfg=76
au BufRead,BufNewFile *.ol syn match lineTitle1 display excludenl /^\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle1 ctermfg=75
au BufRead,BufNewFile *.ol syn match lineTitle2 display excludenl /^\t\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle2 ctermfg=72
au BufRead,BufNewFile *.ol syn match lineTitle3 display excludenl /^\t\t\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle3 ctermfg=74
au BufRead,BufNewFile *.ol syn match lineTitle4 display excludenl /^\t\t\t\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle4 ctermfg=71
au BufRead,BufNewFile *.ol syn match lineTitle5 display excludenl /^\t\t\t\t\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle5 ctermfg=73
au BufRead,BufNewFile *.ol syn match lineTitle6 display excludenl /^\t\t\t\t\t\$ .\+$/
au BufRead,BufNewFile *.ol :hi lineTitle6 ctermfg=70

au BufRead,BufNewFile *.ol syn match lineBar display excludenl /^========*$/
au BufRead,BufNewFile *.ol syn match lineBar display excludenl /^--------*$/
au BufRead,BufNewFile *.ol :hi lineBar ctermfg=8

au BufRead,BufNewFile *.ol nmap - o<Esc>80I-<Esc><CR>
au BufRead,BufNewFile *.ol nmap <C-h> $I$ <Esc>
au BufRead,BufNewFile *.ol nmap <Tab> >>j
au BufRead,BufNewFile *.ol nmap <S-Tab> <<k
au BufRead,BufNewFile *.ol nmap <C-l> o<Esc>I>
