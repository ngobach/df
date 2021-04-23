" Clone first
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
let g:go_version_warning = 0
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

set ls=2 nu ts=4 sw=0 sts=0 et
let g:airline_powerline_fonts = 1
let g:airline_theme = 'cobalt2'
syntax on
