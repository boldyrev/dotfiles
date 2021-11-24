" -----------------------------------------------------------------------------
" Base settings
" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7
set noerrorbells
set backspace=indent,eol,start
set undodir=~/.vim/undodir
set undofile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set smartindent
set fileformat=unix
set cursorline
set number relativenumber
set colorcolumn=80
set splitbelow splitright

filetype indent on      " load filetype-specific indent files
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" File and changes view
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Color scheme
Plug 'morhetz/gruvbox'

" A git wrapper.
Plug 'tpope/vim-fugitive'

" Usefull comments
Plug 'tpope/vim-commentary'

" Git changes at left side ruler
Plug 'airblade/vim-gitgutter'

" LSP and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

colorscheme gruvbox


" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
" set airline theme
let g:airline_theme='deus' " <theme> is a valid theme name


" -----------------------------------------------------------------------------
" Key bindings and remaps
" -----------------------------------------------------------------------------
let mapleader=" "

inoremap jk <esc>

" Vertical resize window
nnoremap <silent> <leader>r+ :vertical resize +5<CR>
nnoremap <silent> <leader>r- :vertical resize +5<CR>

" Show undo tree
nnoremap <leader>u :UndotreeShow<CR>

" Copy to system clipboard, C-S-v - paste from system clipboard
vmap <Leader>y "+yi

" Copy from current char to end of line
nnoremap Y y$

" Keeping it centered, incorrect work with is.vim
" patch is.vim
" from:
" noremap <Plug>(_is-n)  nzz
" noremap <Plug>(_is-N)  Nzz
" to:
" noremap <Plug>(_is-n)  nzzzv
" noremap <Plug>(_is-N)  Nzzzv
"
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Edit Vim config file in a new tab.
command! Config execute ":tabnew $MYVIMRC"
" Source Vim config file.
command! Reload execute ":source $MYVIMRC"

" navigate to buffers
map gn :bn<cr>
map gp :bp<cr>
map gw :bd<cr>
nnoremap gb :buffers<CR>:buffer<Space>

" Move line up/down in all modes
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Add blank line in normal mode
:nnoremap <silent> [<space> :pu! _<cr>:']+1<cr>
:nnoremap <silent> ]<space> :pu _<cr>:'[-1<cr>

" -----------------------------------------------------------------------------
" scrooloose/nerdtree
" -----------------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
let g:NERDTreeWinSize=30
nmap <leader>ff :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" the ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" NERDTreeGitPlugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'m',
                \ 'Staged'    :'s',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'r',
                \ 'Unmerged'  :'u',
                \ 'Deleted'   :'d',
                \ 'Dirty'     :'~',
                \ 'Ignored'   :'i',
                \ 'Clean'     :'c',
                \ 'Unknown'   :'-',
                \ }
" -----------------------------------------------------------------------------
" COC
" -----------------------------------------------------------------------------
let g:node_client_debug = 1
let g:coc_global_extensions=[
            \'coc-solargraph',
            \'coc-pyright'
            \]

"main commands
nmap <silent>gd <Plug>(coc-definition)
nmap <Leader>cr <Plug>(coc-rename)
xmap <Leader>ca <Plug>(coc-codeaction-selected)
nmap <Leader>cf <Plug>(coc-format)
nmap <Leader>cc :CocCommand editor.action.pickColor<Enter>
"ShowDocumentation in functions.vim
nnoremap <silent>K :call ShowDocumentation()<Enter>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"scroll windows
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<Enter>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<Enter>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"request window/popup
inoremap <silent><expr> <C-Space> coc#refresh()
"expand snippets
imap <C-l> <Plug>(coc-snippets-expand)
"select from menu by Enter
inoremap <silent><expr> <Enter> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<Enter>\<C-r>=coc#on_enter()\<Enter>"

" -----------------------------------------------------------------------------
" Telescope
" -----------------------------------------------------------------------------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

