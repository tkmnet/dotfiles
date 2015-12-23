au BufRead,BufNewFile *.vhm set tabstop=3 shiftwidth=3 listchars=tab:\|-
au BufRead,BufNewFile *.vhm syn match lineComment display excludenl /^> .*$/
au BufRead,BufNewFile *.vhm :hi lineComment ctermfg=183
au BufRead,BufNewFile *.vhm syn match lineMemo display excludenl /^#\s.*$/
au BufRead,BufNewFile *.vhm :hi lineMemo ctermfg=59

au BufRead,BufNewFile *.vhm syn match lineTitle display excludenl /\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle ctermfg=76
au BufRead,BufNewFile *.vhm syn match lineTitle1 display excludenl /^\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle1 ctermfg=75
au BufRead,BufNewFile *.vhm syn match lineTitle2 display excludenl /^\t\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle2 ctermfg=72
au BufRead,BufNewFile *.vhm syn match lineTitle3 display excludenl /^\t\t\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle3 ctermfg=74
au BufRead,BufNewFile *.vhm syn match lineTitle4 display excludenl /^\t\t\t\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle4 ctermfg=71
au BufRead,BufNewFile *.vhm syn match lineTitle5 display excludenl /^\t\t\t\t\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle5 ctermfg=73
au BufRead,BufNewFile *.vhm syn match lineTitle6 display excludenl /^\t\t\t\t\t\$ .\+$/
au BufRead,BufNewFile *.vhm :hi lineTitle6 ctermfg=70

au BufRead,BufNewFile *.vhm syn match lineBar display excludenl /^========*$/
au BufRead,BufNewFile *.vhm syn match lineBar display excludenl /^--------*$/
au BufRead,BufNewFile *.vhm :hi lineBar ctermfg=8

au BufRead,BufNewFile *.vhm nmap - o<Esc>80I-<Esc><CR>
au BufRead,BufNewFile *.vhm nmap <C-h> $I$ <Esc>
au BufRead,BufNewFile *.vhm nmap <Tab> >>j
au BufRead,BufNewFile *.vhm nmap <S-Tab> <<k
au BufRead,BufNewFile *.vhm nmap <C-l> o<Esc>I> 
au BufRead,BufNewFile *.vhm nmap <C-k> 0i# <Esc>$

