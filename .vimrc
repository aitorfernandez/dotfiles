packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('airblade/vim-gitgutter')
call minpac#add('aitorfernandez/vim-redis')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('cespare/vim-toml')
call minpac#add('fatih/vim-go')
call minpac#add('hashivim/vim-terraform')
call minpac#add('honza/vim-snippets')
call minpac#add('itchyny/lightline.vim')
call minpac#add('jparise/vim-graphql')
call minpac#add('junegunn/fzf.vim')
call minpac#add('kshenoy/vim-signature')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('mhinz/vim-grepper')
call minpac#add('OmniSharp/omnisharp-vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('plasticboy/vim-markdown')
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

set backup
set backupdir =$v/tmp/backup/
set directory =$v/tmp/swap/
set undodir   =$v/tmp/undo/
set viewdir   =$v/tmp/view/
set viminfo   ='100,n$v/tmp/viminfo

" fzf
set rtp+=/usr/local/opt/fzf

nnoremap <C-p> :Files<cr>
nnoremap <leader>' :Buffers<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>s :Snippets<cr>

let g:fzf_preview_window = ''
" let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1, 'border': 'horizontal' } }

" searching
set incsearch hlsearch smartcase ignorecase
" turn off highlighting in insert mode, and turn back on again when leaving
augroup highlight_search
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
nnoremap <leader>/ :nohlsearch<cr>

" spelling
" :setlocal spell
augroup spell
  autocmd!
  autocmd FileType latex,tex,markdown setlocal spell
augroup END

" wildmenu
set wildmenu                                       " Command line autocompletion
set wildmode   =list:longest,full                  " Shows all the options
set wildignore+=*.sw?                              " Vim swap files
set wildignore+=*/node_modules/*,*/dist,*/vendor/* " JS

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
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

vnoremap <leader>s :sort i<cr>

" save
" augroup insert_leave_update
"   autocmd!
"   autocmd InsertLeave * silent! update
" augroup END

" netrw
let g:netrw_banner        = 0
" set the default listing style, Long, one file per line with file size and time stamp
let g:netrw_liststyle     = 1
let g:netrw_sort_options  = 'i'
let g:netrw_sort_sequence = '[\/]\s'
" keep the cursor in the netrw window
let g:netrw_altv          = 1
let g:netrw_preview       = 1
" it defines the default proportion of the new window relative to the current window
let g:netrw_winsize       = 50
" let g:netrw_localrmdir  = 'rm -r'
let g:netrw_bufsettings   = 'noma nomod nu nobl nowrap ro'
let g:netrw_dirhistmax    = 0
" let g:netrw_keepdir     = 0

nnoremap <C-e> :e#<cr>
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>

nnoremap <leader>- :e.<cr>
" from tpope/vim-vinegar
nnoremap <plug>(NetrwUp) :E<cr>
if empty(maparg('-', 'n'))
  nmap - <plug>(NetrwUp)
endif

augroup file_type_language_characteristics
  autocmd!
  " autocmd FileType vim :setlocal foldmethod=marker
  autocmd FileType javascript,css,json :setlocal foldmethod=syntax
  autocmd FileType javascript,html :setlocal nowrap
augroup END

" tags
set tags=.tags
augroup file_type_ctags
  " autocmd FileType python command! Ctags !ctags
  "   \ --languages=python --exclude=**/.tox --exclude=**/.venv --exclude=.git -f .tags -R .
  autocmd FileType netrw,javascript command! Ctags !ctags
    \ --languages=javascript --exclude=node_modules --exclude=dist --exclude=build --exclude=.git -f .tags -R .
  autocmd FileType go command! Ctags !ctags
    \ --languages=go --exclude=vendor -f .tags -R .
augroup END

" mappings

vnoremap > >gv
vnoremap < <gv

" system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>a :wa!<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" nnoremap <leader>f :find **/*<C-z>
nnoremap <leader>e :e **/*<C-z>
nnoremap <leader>vs :vs **/*<C-z>

nnoremap <leader>l :set list!<cr>

" buffers
nnoremap <leader>ls :ls<cr>:b<space>

nnoremap <leader>o :only<cr>

" tabs
for i in range(1, 9)
  execute 'nnoremap <leader>'.i.' '.i.'gt<cr>'
endfor
ca tn tabnew
ca tc tabclose

inoremap jk <esc>

" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" repeat in visual mode
xnoremap . :norm.<cr>

" autocomplete
inoremap <C-n> <c-s-x><c-s-o>

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
\   'javascript': ['eslint'],
\   'cs': ['OmniSharp']
\ }

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" lightline.vim
let g:lightline = {
\   'colorscheme': 'seoul256',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head'
\   }
\ }

" vim-fugitive
" nnoremap <leader>gs :vert Git <bar> 25winc <<cr>
nnoremap <leader>gs :vert :Git<cr>
" nnoremap <leader>gc :Gcommit<cr>
" nnoremap <leader>gd :Gdiff<cr>

let g:fugitive_autoreload_status = 0

ca gb Git branch<space>
ca gco Git checkout<space>

" grepper
runtime plugin/grepper.vim

let g:grepper.highlight    = 1
let g:grepper.tools        = ['ag', 'grep', 'git']
" quote the query automatically
let g:grepper.prompt_quote = 1
" the short grep command
let g:grepper.prompt_text  = '$t> '
let g:grepper.ag.grepprg  .=
\ ' --ignore *.lock --ignore-dir *.lock --ignore-dir node_modules --ignore-dir .venv --ignore-dir *.egg-info --ignore-dir bin --ignore-dir pkg'

nnoremap <silent><leader>* :Grepper -jump -cword -noprompt<cr>
nnoremap <silent><leader>g :Grepper -tool git -noopen -jump<cr>
nnoremap <silent><leader>sa :Grepper -open -switch -prompt<cr>

nmap sz <plug>(GrepperOperator)
xmap sz <plug>(GrepperOperator)

" vim-go
augroup go_commands
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<cr>
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  " :GoAlternate  commands :A, :Av
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang Av call go#alternate#Switch(<bang>0, 'vsplit')
augroup end

" from fatih/vim-go-tutorial
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_auto_type_info           = 1
let g:go_autodetect_gopath        = 1
let g:go_decls_includes           = 'func,type'
let g:go_fmt_command              = 'goimports'
let g:go_highlight_extra_types    = 1
let g:go_highlight_fields         = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions      = 1
let g:go_highlight_generate_tags  = 1
let g:go_highlight_types          = 1
let g:go_list_type                = 'quickfix'
" remove K map
let g:go_doc_keywordprg_enabled   = 0

" nmap <C-g> :GoDeclsDir<cr>
" imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

map <C-n> :cnext<cr>
map <C-m> :cprevious<cr>

nnoremap <leader>cq :cclose<cr>
nnoremap <leader>pq :pclose<cr>
" nnoremap gq :cclose<cr>
" nnoremap gw :cw<cr>

" vim-markdown
let g:vim_markdown_fenced_languages = ['bash=sh', 'go=go', 'js=javascript']

" OmniSharp
let g:OmniSharp_server_use_mono = 1

let g:netrw_list_hide= '.*\.cs\.meta'

augroup omnisharp_commands
  autocmd!
  autocmd CursorHold *.cs OmniSharpTypeLookup

  autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4

  autocmd FileType cs nmap <silent> <buffer> <Leader>w :w! <cr> <Plug>(omnisharp_code_format)
augroup END

" colorscheme at the end of the file to avoid color issues
colorscheme nord
