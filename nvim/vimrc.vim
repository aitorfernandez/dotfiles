call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'preservim/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

syntax on
filetype plugin indent on

set updatetime =100

set shell =/usr/local/bin/fish

set path =.,,**

" make Vim more liberal about hidden buffers
set hidden

" automatically save before :next, :make etc.
set autowrite

" turn off error beeping and flashing in Vim
set visualbell
set t_vb=

" autocompletion
" . current buffer
" w buffers from other windows
" b buffers from the buffer list
" u buffers that have been unloaded from the buffer list
" t tag completion
set complete    =.,w,b,u,t,kspell
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
" don't break words when wrapping text
set linebreak
" fold
set foldlevel =99

set scrolloff     =3
set sidescrolloff =5

let $v = $HOME.('/.vim')
" set backup
set backupdir =$v/tmp/backup/
set directory =$v/tmp/swap/
set undodir   =$v/tmp/undo/
set viewdir   =$v/tmp/view/
set viminfo   ='1000,n$v/tmp/viminfo

" searching
set incsearch hlsearch smartcase ignorecase
" turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<cr>

" wildmenu
set wildmenu                                       " Command line autocompletion
set wildmode   =list:longest,full                  " Shows all the options
set wildignore+=*.sw?                              " Vim swap files
set wildignore+=*/node_modules/*,*/dist,*/vendor/* " JS
set wildignore+=*/target/*                         " Rust

vnoremap <leader>s :sort i<cr>

" netrw
let g:netrw_banner       = 0
" set the default listing style, Long, one file per line with file size and time stamp
let g:netrw_sort_options = 'i'
" keep the cursor in the netrw window
let g:netrw_altv         = 1
let g:netrw_preview      = 1
let g:netrw_bufsettings  = 'noma nomod nu nobl nowrap ro'
let g:netrw_dirhistmax   = 0

nnoremap <C-e> :e#<cr>
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>

" directory of the current file
nnoremap <leader>le :Lexplore %:p:h<cr>

nnoremap <leader>- :e.<cr>
" from tpope/vim-vinegar
nnoremap <plug>(NetrwUp) :E<cr>
if empty(maparg('-', 'n'))
  nmap - <plug>(NetrwUp)
endif

" mappings

vnoremap > >gv
vnoremap < <gv

" system clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w!<cr>

nnoremap <leader>o :only<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>e :e **/*<C-z>

" tabs
for i in range(1, 9)
  execute 'nnoremap <leader>'.i.' '.i.'gt<cr>'
endfor
ca tn tabnew
ca tc tabclose

inoremap jk <esc>

" repeat in visual mode
xnoremap . :norm.<cr>

" from http://karolis.koncevicius.lt/posts/porn_zen_and_vimrc/
" make J, K, L, and H move more the cursor
nnoremap J }
nnoremap K {
nnoremap L g_
nnoremap H ^

vnoremap J }
vnoremap K {
vnoremap L g_
vnoremap H ^

" plugins

" terraform
let g:terraform_fmt_on_save = 1

" snippets
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" ale
let g:ale_sign_column_always         = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'rust': ['analyzer'],
\ }
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'rust': ['rustfmt'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_completion_autoimport = 0
let g:ale_fix_on_save           = 1
let g:ale_linters_explicit      = 1
let g:ale_rust_rls_toolchain    = 'stable'
let g:ale_virtualtext_cursor    = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-fugitive
nnoremap <leader>gs :vert :Git<cr>

let g:fugitive_autoreload_status = 0

" lightline
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }

" telescope
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" rust
let g:rustfmt_autosave = 1

" rusty-tags
" cargo install rusty-tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" choose the correct method definition
:nnoremap <C-]> g<C-]>

" coc
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <C-h> coc#refresh()

" colorscheme at the end of the file to avoid color issues
colorscheme nord
