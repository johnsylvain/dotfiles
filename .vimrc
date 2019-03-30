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

noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

let NERDTreeShowHidden=1
Plugin 'wakatime/vim-wakatime'
