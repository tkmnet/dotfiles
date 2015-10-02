NeoBundle 'vim-latex/vim-latex'

let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*'
let g:Tex_DefaultTargetFormat = 'pdf' 
let g:Tex_ViewRule_dvi = 'evince'
let g:Tex_ViewRule_pdf = 'evince'

au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl setf tex
let g:tex_flavor='latex'
