NeoBundle "vim-voom/VOoM.git"

let g:voom_tree_width=45

augroup auto-voom
	autocmd!
"	autocmd BufWritePost *.tex,*.md :Voomquit
	autocmd VimEnter *.tex silent :nmap <silent> <Leader>m :VoomToggle latex<CR>
	autocmd VimEnter *.md silent :nmap <silent> <Leader>m :VoomToggle markdown<CR>
augroup END
