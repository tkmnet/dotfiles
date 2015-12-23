let g:my_fcitx_mode = 1

function! s:fcitx_insertenter()
	if (g:my_fcitx_mode == 2)
		call system("fcitx-remote -o")
	endif
endfunction

function! s:fcitx_insertleave()
	let g:my_fcitx_mode = system("fcitx-remote")
	if (g:my_fcitx_mode == 2)
		call system("fcitx-remote -c")
	endif
endfunction

augroup myfcitx
	autocmd!
	autocmd InsertEnter * silent call s:fcitx_insertenter()
	autocmd InsertLeave * silent call s:fcitx_insertleave()
augroup END

nmap <silent> <Esc> :let g:my_fcitx_mode = 1<CR>
