NeoBundle 'vim-latex/vim-latex'

filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*

let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'

au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl setf tex
let g:tex_flavor='latex'
