packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('airblade/vim-gitgutter')
call minpac#add('cocopon/iceberg.vim')
call minpac#add('honza/vim-snippets')
call minpac#add('itchyny/lightline.vim')
call minpac#add('kshenoy/vim-signature')
call minpac#add('mhinz/vim-grepper')
call minpac#add('mxw/vim-jsx')
call minpac#add('pangloss/vim-javascript')
call minpac#add('rust-lang/rust.vim')
call minpac#add('SirVer/ultisnips')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('w0rp/ale')

packloadall

syntax on
filetype plugin indent on

let $v = $HOME.('/.vim')

set updatetime =100

" zsh
" set shell=/bin/zsh " makes my vim really slow
set shell=/bin/bash

set path=.,,**

" make Vim more liberal about hidden buffers
set hidden

" autocompletion
" . current buffer
" w buffers from other windows
" b buffers from the buffer list
" u buffers that have been unloaded from the buffer list
" t tag completion
set complete    =.,w,b,u,t
set completeopt =menu,longest

" powerful backspace
set backspace=indent,eol,start
" line numbers
set number
set relativenumber
" Always show statusline
set laststatus =2
set display    =lastline

" Show hidden chars
set listchars=tab:→\ ,eol:¬

" space instead of tabs
set expandtab
" tab==two spaces
set tabstop     =2
" spaces for auto-indent
set shiftwidth  =2
set softtabstop =2
" dont't break words when wrapping text
set linebreak
" fold
set foldlevel   =99

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
set wildmenu                            " Command line autocompletion
set wildmode   =list:longest,full       " Shows all the options
set wildignore+=*.sw?                   " Vim swap files
set wildignore+=*/node_modules/*,*/dist " JS

" trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup buf_write_pre_trim_whitespace
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup end

" sort
vnoremap <leader>s :sort i<cr>

" save
" augroup insert_leave_update
"   autocmd!
"   autocmd InsertLeave * silent! update
" augroup END

" netrw
let g:netrw_banner        =0
" set the default listing style, Long, one file per line with file size and time stamp
let g:netrw_liststyle     =1
" directories on the top, files below
let g:netrw_sort_sequence ='[\/]$,*'
" keep the cursor in the netrw window
let g:netrw_preview       =1
let g:netrw_winsize       =50
let g:netrw_altv          =1
let g:netrw_localrmdir    ='rm -r'

nnoremap <leader><space> :Vex<cr>
nnoremap <space> :bnext<cr>
nnoremap <bs> :bprev<cr>
nnoremap <leader>- :E<cr>
" from tpope/vim-vinegar
nnoremap <plug>(NetrwUp) :e.<cr>
if empty(maparg('-', 'n'))
  nmap - <plug>(NetrwUp)
endif

augroup file_type_foldmethod
  autocmd!
  " autocmd FileType vim :setlocal foldmethod=marker
  autocmd FileType javascript,css,json :setlocal foldmethod=syntax
augroup END

" tags
set tags=.tags
augroup file_type_ctags
  autocmd FileType netrw,javascript command! Ctags !ctags
    \ --languages=javascript --exclude=node_modules --exclude=dist --exclude=build --exclude=.git -f .tags -R .
augroup END

" mappings

vnoremap > >gv
vnoremap < <gv

" system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w!<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>o :!open .<cr>

nnoremap <leader>f :find<space>

nnoremap <leader>l :set list!<cr>

nnoremap <leader>ls :ls<cr>:b<space>

" tabs
for i in range(1, 9)
  execute 'nnoremap <leader>'.i.' '.i.'gt<cr>'
endfor
nnoremap <leader>t :tabnew<space>

inoremap jk <esc>

" 😱
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" repeat in visual mode
xnoremap . :norm.<cr>

" packages

" minpac
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()
command! PackUpdate call minpac#update()

" snippets
let g:UltiSnipsExpandTrigger       ='<tab>'
let g:UltiSnipsJumpForwardTrigger  ='<tab>'
let g:UltiSnipsJumpBackwardTrigger ='<s-tab>'

" ale
let g:ale_sign_column_always         =1
let g:airline#extensions#ale#enabled =1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'rust': ['rls'],
\   'python': ['flake8']
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
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>

let g:fugitive_autoreload_status =0

" grepper
runtime plugin/grepper.vim

let g:grepper.highlight    =1
let g:grepper.tools        =['ag', 'grep', 'git']
" quote the query automatically
let g:grepper.prompt_quote =1
" the short grep command
let g:grepper.prompt_text  ='$t> '
let g:grepper.ag.grepprg  .=
\   ' --ignore-dir *.lock --ignore-dir node_modules'

nnoremap <silent><leader>sa :Grepper -open -switch -prompt<cr>
nnoremap <silent><leader>* :Grepper -jump -cword -noprompt<cr>

nmap sz <plug>(GrepperOperator)
xmap sz <plug>(GrepperOperator)

" colorscheme at the end of the file to avoid color issues
colorscheme iceberg
