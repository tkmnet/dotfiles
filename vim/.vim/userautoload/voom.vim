NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45
autocmd VimEnter *.tex silent :Voom latex
autocmd VimEnter *.md silent :Voom markdown
