NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45

autocmd VimEnter *.tex silent :Voom latex
autocmd BufWritePost *.tex silent <CR><CR>

autocmd VimEnter *.md silent :Voom markdown
autocmd BufWritePost *.md silent <CR><CR>
