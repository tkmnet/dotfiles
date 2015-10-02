NeoBundle 'vim-latex/vim-latex'

let g:Tex_CompileRule_dvi = 'sh -c "TEXFILE=$*;platex --interaction=nonstopmode ${TEXFILE};platex --interaction=nonstopmode ${TEXFILE}"' 
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_CompileRule_pdf = 'sh -c "TEXFILE=$*;platex --interaction=nonstopmode ${TEXFILE};platex --interaction=nonstopmode ${TEXFILE};dvipdfmx ${TEXFILE}.dvi"'
let g:Tex_DefaultTargetFormat = 'pdf' 
let g:Tex_ViewRule_dvi = 'evince'
let g:Tex_ViewRule_pdf = 'evince'

au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl setf tex
let g:tex_flavor='latex'
