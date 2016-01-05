if ("" != system("fcitx-remote"))
	imap <silent> <Esc>OA <Esc>lk:call system("fcitx-remote -c")<CR>
	imap <silent> <Esc>OB <Esc>lj:call system("fcitx-remote -c")<CR>
	imap <silent> <Esc>OC <Esc>ll:call system("fcitx-remote -c")<CR>
	imap <silent> <Esc>OD <Esc>lh:call system("fcitx-remote -c")<CR>
endif
