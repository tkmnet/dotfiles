language en_US.UTF-8

set nocompatible
set number
set laststatus=2
set showmatch
set list
set listchars=eol:┐,tab:»\ 
set cursorline
set ruler
syntax on
set cmdheight=2

set autoread
set backupdir=$HOME/.vim_temp
set directory=$HOME/.vim_temp
set backup

set clipboard=unnamed

set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8

set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

set confirm
set swapfile

set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set wildmenu wildmode=list:longest,full

set splitbelow
set splitright
let g:netrw_alto = 1
let g:netrw_altv = 1

set tags+=tags;


"" NeoBundle
set nocompatible               " Be iMproved
filetype off                   " Required!
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on     " Required!
" Installation check.
if neobundle#exists_not_installed_bundles()
echomsg 'Not installed bundles : ' .
\ string(neobundle#get_not_installed_bundle_names())
echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif

NeoBundleCheck


set runtimepath+=~/.vim/
runtime! userautoload/*.vim
