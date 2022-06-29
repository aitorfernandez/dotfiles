packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('arcticicestudio/nord-vim')
call minpac#add('cespare/vim-toml')
call minpac#add('honza/vim-snippets')
" call minpac#add('jparise/vim-graphql')
call minpac#add('junegunn/fzf.vim')
call minpac#add('kshenoy/vim-signature')
" call minpac#add('maxmellon/vim-jsx-pretty')
" call minpac#add('mhinz/vim-grepper')
call minpac#add('neoclide/coc.nvim')
" call minpac#add('pangloss/vim-javascript')
call minpac#add('preservim/vim-markdown')
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

" set shell=/bin/bash
set shell=/usr/local/bin/fish

set path=.,,**

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

" set backup
set backupdir =$v/tmp/backup/
set directory =$v/tmp/swap/
set undodir   =$v/tmp/undo/
set viewdir   =$v/tmp/view/
set viminfo   ='1000,n$v/tmp/viminfo

" fzf
set rtp+=/usr/local/opt/fzf

nnoremap <leader>B :Buffers<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>M :Marks<cr>
nnoremap <leader>S :Snippets<cr>
nnoremap <leader>T :Tags<cr>

let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

" searching
set incsearch hlsearch smartcase ignorecase
" turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<cr>

" " spelling
" " :setlocal spell
" augroup spell
"   autocmd!
"   autocmd FileType latex,tex,markdown setlocal spell
" augroup END

" wildmenu
set wildmenu                                       " Command line autocompletion
set wildmode   =list:longest,full                  " Shows all the options
set wildignore+=*.sw?                              " Vim swap files
set wildignore+=*/node_modules/*,*/dist,*/vendor/* " JS
set wildignore+=*/target/*                         " Rust

set wildcharm=<C-z>

set mouse=a

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

" wrap long lines in quickfix
" augroup quickfix
"   autocmd!
"   autocmd FileType qf setlocal wrap
" augroup END

vnoremap <leader>s :sort i<cr>

" save
" augroup insert_leave_update
"   autocmd!
"   autocmd InsertLeave * silent! update
" augroup END

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

" augroup file_type_language_characteristics
"   autocmd!
"   " autocmd FileType vim :setlocal foldmethod=marker
"   autocmd FileType javascript,css,json :setlocal foldmethod=syntax
"   autocmd FileType javascript,html :setlocal nowrap
" augroup END

" tags
" set tags=.tags
" augroup file_type_ctags
"   " autocmd FileType python command! Ctags !ctags
"   "   \ --languages=python --exclude=**/.tox --exclude=**/.venv --exclude=.git -f .tags -R .
"   autocmd FileType netrw,javascript command! Ctags !ctags
"     \ --languages=javascript --exclude=node_modules --exclude=dist --exclude=build --exclude=.git -f .tags -R .
"   autocmd FileType go command! Ctags !ctags
"     \ --languages=go --exclude=vendor -f .tags -R .
" augroup END
"
" mappings

vnoremap > >gv
vnoremap < <gv

" system clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w!<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>e :e **/*<C-z>

nnoremap <leader>l :set list!<cr>

" buffers
nnoremap <leader>ls :ls<cr>:b<space>

" tabs
for i in range(1, 9)
  execute 'nnoremap <leader>'.i.' '.i.'gt<cr>'
endfor
ca tn tabnew
ca tc tabclose

inoremap jk <esc>

" repeat in visual mode
xnoremap . :norm.<cr>

" " autocomplete
" inoremap <C-n> <c-s-x><c-s-o>

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

" minpac
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()
command! PackUpdate call minpac#update()

" snippets
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" ale
let g:ale_sign_column_always         = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'rust': ['rls', 'analyzer'],
\ }
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'rust': ['rustfmt'],
\ }

let g:ale_fix_on_save        = 1
let g:ale_rust_rls_toolchain = 'stable'

nnoremap <silent> <leader>an :ALENext<cr>
nnoremap <silent> <leader>ap :ALEPrevious<cr>

" vim-fugitive
nnoremap <leader>gs :vert :Git<cr>

let g:fugitive_autoreload_status = 0

" " grepper
" runtime plugin/grepper.vim
"
" let g:grepper.highlight    = 1
" let g:grepper.tools        = ['ag', 'grep', 'git']
" " quote the query automatically
" let g:grepper.prompt_quote = 1
" " the short grep command
" let g:grepper.prompt_text  = '$t> '
" let g:grepper.ag.grepprg  .=
" \ ' --ignore *.lock --ignore-dir *.lock --ignore-dir node_modules --ignore-dir .venv --ignore-dir *.egg-info --ignore-dir bin --ignore-dir pkg'
"
" nnoremap <silent><leader>* :Grepper -jump -cword -noprompt<cr>
" nnoremap <silent><leader>g :Grepper -tool git -noopen -jump<cr>
" nnoremap <silent><leader>sa :Grepper -open -switch -prompt<cr>
"
" nmap sz <plug>(GrepperOperator)
" xmap sz <plug>(GrepperOperator)

" map <C-n> :cnext<cr>
" map <C-m> :cprevious<cr>
"
" nnoremap <leader>cq :cclose<cr>
" nnoremap <leader>pq :pclose<cr>

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

" colorscheme at the end of the file to avoid color issues
colorscheme nord
