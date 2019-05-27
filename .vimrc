execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme iceberg

let $v = $HOME.('/.vim')

set updatetime=100

" zsh
set shell=/bin/zsh

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
nnoremap <leader>/ :nohlsearch<cr>

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
vnoremap <Leader>s :sort<cr>

" save
augroup insert_leave
  autocmd!
  autocmd InsertLeave * write
augroup END

" netrw
let g:netrw_banner        =0
" set the default listing style
let g:netrw_liststyle     =1
" directories on the top, files below
let g:netrw_sort_sequence ='[\/]$,*'
let g:netrw_preview       =1
let g:netrw_winsize       =18

nnoremap <Space> :bnext<cr>
nnoremap <Bs> :bprev<cr>
nnoremap <Leader>- :E<cr>
nnoremap <Plug>(NetrwUp) :e.<cr>
if empty(maparg('-', 'n'))
  nmap - <Plug>(NetrwUp)
endif

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
\   'javascript': ['eslint']
\ }

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
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
