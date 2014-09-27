if has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))

	NeoBundleFetch 'Shougo/neocomplcache.vim'
	NeoBundle 'Shougo/neocomplete.vim'

	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#min_syntax_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Use auto select
	let g:neocomplete#enable_auto_select = 1

	" Define dictionary.
	let g:neocomplete#dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#smart_close_popup() . "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()

	" for snippets
	 imap <expr><C-k> neocomplete#sources#snippets_complete#expandable() ?
	 "\<Plug>(neocomplete#snippets_expand)" : pumvisible() ? "\<C-n>" :
	 "\<TAB>"
	 smap <C-k> <Plug>(neocomplete#snippets_expand)

endif
