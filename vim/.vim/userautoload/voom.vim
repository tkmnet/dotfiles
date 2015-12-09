NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45

autocmd VimEnter,BufWritePost *.tex silent :Voom latex

autocmd VimEnter,BufWritePost *.md silent :Voom markdown
