NeoBundle "nathanaelkane/vim-indent-guides.git"
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_guide_size = 0
let g:indent_guides_space_guides = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
