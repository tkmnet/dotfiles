if ("" != system("fcitx-remote"))
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

	nmap <silent> <Esc><Esc> :let g:my_fcitx_mode = 1<CR>
	nmap <silent> <Esc><Esc>OA k
	nmap <silent> <Esc><Esc>OB j
	nmap <silent> <Esc><Esc>OC l
	nmap <silent> <Esc><Esc>OD h
	imap <silent> <Esc>OA <Up>
	imap <silent> <Esc>OB <Down>
	imap <silent> <Esc>OC <Right>
	imap <silent> <Esc>OD <Left>
endif
