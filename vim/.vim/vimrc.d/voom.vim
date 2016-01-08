NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45

augroup auto-voom
	autocmd!
"	autocmd BufWritePost *.tex,*.md :Voomquit
	autocmd VimEnter,BufWritePost *.tex silent :nmap <silent> <Leader>m :VoomToggle latex
	autocmd VimEnter,BufWritePost *.md silent :nmap <silent> <Leader>m :VoomToggle markdown
augroup END
