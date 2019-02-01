execute pathogen#infect()
syntax on
filetype plugin indent on

" powerful backspace
set backspace=indent,eol,start
" line numbers
set number

" netrw banner, I like the banner
let g:netrw_banner=1

" tree-view
let g:netrw_liststyle=3
" directories on the top, files below
let g:netrw_sort_sequence='[\/]$,*'

" space instead of tabs
set expandtab
" tab==four spaces
set tabstop=4
" spaces for auto-indent
set shiftwidth=4
set softtabstop=4
" dont't break words when wrapping text
set linebreak

