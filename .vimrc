"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings

set autoindent
set nocompatible
set number
set showmode
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set relativenumber
set t_Co=256
set nocompatible
filetype off
filetype plugin indent on
let g:jsx_ext_required=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings

let mapleader=","

noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>
inoremap jk <esc>
nmap <C-t> :NERDTreeToggle<CR>
nnoremap p p=`]
nnoremap P P=`]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'leafgarland/typescript-vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
