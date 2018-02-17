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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

let NERDTreeShowHidden=1
