if ("" != system("fcitx-remote"))
	imap <silent> <Esc>OA <Esc>:call system("fcitx-remote -c")<CR>lk
	imap <silent> <Esc>OB <Esc>:call system("fcitx-remote -c")<CR>lj
	imap <silent> <Esc>OC <Esc>:call system("fcitx-remote -c")<CR>ll
	imap <silent> <Esc>OD <Esc>:call system("fcitx-remote -c")<CR>lh
endif
