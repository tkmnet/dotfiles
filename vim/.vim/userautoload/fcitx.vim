let g:my_fcitx_mode = 1

function! s:fcitx_insertenter()
	if (g:my_fcitx_mode == 2)
		call system("fcitx-remote -o")
	endif
endfunction
:command! FcitxInsertEnter :call s:fcitx_insertenter()

function! s:fcitx_insertleave()
	let g:my_fcitx_mode = system("fcitx-remote")
	if (g:my_fcitx_mode == 2)
		call system("fcitx-remote -c")
	endif
endfunction
command! FcitxInsertLeave :call s:fcitx_insertleave()

augroup myfcitx
	autocmd!
	autocmd InsertEnter * silent FcitxInsertEnter
	autocmd InsertLeave * silent FcitxInsertLeave
augroup END
