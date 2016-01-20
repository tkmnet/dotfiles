if ("" != system("fcitx-remote"))
	imap <silent> <Esc>OA <Esc>:call system("fcitx-remote -c")<CR>lk
	imap <silent> <Esc>OB <Esc>:call system("fcitx-remote -c")<CR>lj
	imap <silent> <Esc>OC <Esc>:call system("fcitx-remote -c")<CR>ll
	imap <silent> <Esc>OD <Esc>:call system("fcitx-remote -c")<CR>lh

"	nnoremap <silent> <C-Left> :call system("fcitx-remote -o")<CR>i
"	nnoremap <silent> <C-S-Left> :call system("fcitx-remote -o")<CR>a
	nnoremap <silent> Od :call system("fcitx-remote -o")<CR>i
	nnoremap <silent> [d :call system("fcitx-remote -o")<CR>a
endif
