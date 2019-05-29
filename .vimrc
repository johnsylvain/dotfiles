execute pathogen#infect()

set autoindent
set nocompatible
set number
set showmode
set tabstop=2
set shiftwidth=2
set expandtab
syntax on

" Editor settings
set relativenumber
set t_Co=256

set nocompatible
filetype off
filetype plugin indent on

noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>
inoremap jk <esc>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'leafgarland/typescript-vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

let NERDTreeShowHidden=1
