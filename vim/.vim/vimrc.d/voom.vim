NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45

map <Lader>m :VoomToggle<CR>

augroup auto-voom
	autocmd!
"	autocmd BufWritePost *.tex,*.md :Voomquit
	autocmd VimEnter,BufWritePost *.tex silent :Voom latex
	autocmd VimEnter,BufWritePost *.md silent :Voom markdown
augroup END
