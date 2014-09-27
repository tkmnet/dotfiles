NeoBundleLazy "scrooloose/nerdtree", {
      \ "autoload" : { "commands": ["NERDTreeToggle"] }}
if ! empty(neobundle#get("nerdtree"))
  nn <Leader>N :NERDTreeToggle<CR>
	nnoremap <C-e> :NERDTreeToggle<CR>
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	let g:NERDTreeDirArrows=0
	let g:NERDTreeMouseMode=0
endif
