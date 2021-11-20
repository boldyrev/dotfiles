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

" Language server and auto suggestion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" File and changes view
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Color scheme
Plug 'morhetz/gruvbox'

" A git wrapper.
Plug 'tpope/vim-fugitive'

" Integrate fzf with Vim.
" Need to install ripgrep
" sudo apt install ripgrep
Plug '$XDG_DATA_HOME/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Usefull comments
Plug 'tpope/vim-commentary'

" Git changes at left side ruler
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe'

call plug#end()

colorscheme gruvbox


" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

" set theme
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

" run current script with python3 by Leader+R in command and insert mode
augroup exe_code
    autocmd!

    autocmd FileType python nnoremap <buffer> <leader>r 
        \ :sp<CR> :term python3 %<CR> :startinsert<CR>
augroup END

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


" -----------------------------------------------------------------------------
" junegunn/fzf.vim
" Requires ripgrep
" https://github.com/BurntSushi/ripgrep
" -----------------------------------------------------------------------------
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \ "rg --column --line-number --no-heading --color=always --smart-case " .
"   \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'down':  '40%'}

" Show file previews
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" https://github.com/junegunn/fzf.vim/issues/162
let g:fzf_commands_expect = 'enter'

" Map a few common things to do with FZF.
"nnoremap <silent> <Leader>fb :Buffers<CR>
nmap // :BLines!<CR>
nmap ?? :Rg!<CR>

" -----------------------------------------------------------------------------
" YCM
" -----------------------------------------------------------------------------
" Turn off autocomplite
let g:ycm_auto_trigger = 0

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>


" -----------------------------------------------------------------------------
" Language server
" -----------------------------------------------------------------------------
"  npm install -g pyright

lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF




lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


