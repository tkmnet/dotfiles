NeoBundleLazy "scrooloose/nerdtree", {
      \ "autoload" : { "commands": ["NERDTreeToggle"] }}
if ! empty(neobundle#get("nerdtree"))
	nnoremap <C-e> :NERDTree<CR>
	nnoremap <S-e> :NERDTreeClose<CR>
	let g:NERDTreeDirArrows=0
	let g:NERDTreeMouseMode=0
	let NERDTreeMinimalUI=1
endif
