execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme iceberg

let $v = $HOME.('/.vim')

set updatetime =100

" zsh
" set shell=/bin/zsh " makes my vim really slow
set shell=/bin/bash

" powerful backspace
set backspace=indent,eol,start
" line numbers
set number
" Always show statusline
set laststatus =2
set display    =lastline

" Show hidden chars
set listchars=tab:→\ ,eol:¬

" space instead of tabs
set expandtab
" tab==four spaces
set tabstop     =2
" spaces for auto-indent
set shiftwidth  =2
set softtabstop =2
" dont't break words when wrapping text
set linebreak
" fold
set foldlevel =99

set backup
set backupdir =$v/tmp/backup/
set directory =$v/tmp/swap/
set undodir   =$v/tmp/undo/
set viewdir   =$v/tmp/view/
set viminfo   ='100,n$v/tmp/viminfo

" Searching
set incsearch hlsearch smartcase ignorecase
" Turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<CR>

" Wildmenu
set wildmenu                   " Command line autocompletion
set wildmode=list:longest,full " Shows all the options

" trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup trim_whitespace
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup end

" sort
vnoremap <Leader>s :sort i<CR>

" save
augroup insert_leave
  autocmd!
  autocmd InsertLeave * silent! update
augroup END

" netrw
let g:netrw_banner        =0
" set the default listing style
let g:netrw_liststyle     =1
" directories on the top, files below
let g:netrw_sort_sequence ='[\/]$,*'
let g:netrw_preview       =1
let g:netrw_winsize       =50
let g:netrw_altv          =1
let g:netrw_localrmdir    ='rm -r'

nnoremap <Leader><Space> :Vex<CR>
nnoremap <Space> :bnext<CR>
nnoremap <Bs> :bprev<CR>
nnoremap <Leader>- :E<CR>
nnoremap <Plug>(NetrwUp) :e.<CR>
if empty(maparg('-', 'n'))
  nmap - <Plug>(NetrwUp)
endif

vnoremap > >gv
vnoremap < <gv

augroup filetype_foldmethod
  autocmd!
  autocmd FileType vim :setlocal foldmethod=marker
  autocmd FileType javascript,css,json :setlocal foldmethod=syntax
augroup END

" system clipboard
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
nnoremap <Leader>Y "+y
nnoremap <Leader>P "+p

nnoremap <Leader>q :q<CR>

" bundles

" ctrlp
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" snippes
let g:UltiSnipsExpandTrigger      ='<Tab>'
let g:UltiSnipsJumpForwardTrigger ='<Tab>'

" ack
nnoremap <Leader>a :Ack!<Space>

" ale
let g:ale_sign_column_always         =1
let g:airline#extensions#ale#enabled =1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'rust': ['rls']
\ }
let g:ale_rust_rls_toolchain = 'stable'

" lightline.vim
let g:lightline = {
\   'colorscheme': 'seoul256',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'modified' ] ]
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head'
\   }
\ }

" vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>

let g:fugitive_autoreload_status =0

" rust
let g:rustfmt_autosave =1
