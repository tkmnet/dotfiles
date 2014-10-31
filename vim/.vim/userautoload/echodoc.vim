NeoBundle 'Shougo/echodoc', '', 'default'
call neobundle#config('echodoc', {
			\ 'lazy' : 1,
			\ 'autoload' : {
			\ 'insert' : 1,
			\ }})
set noshowmode
let g:echodoc_enable_at_startup = 1
