  " PLUGINS

call plug#begin()

" LAYOUT

Plug 'https://github.com/kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'lifepillar/vim-solarized8'
Plug 'https://github.com/Lokaltog/powerline-fonts'
Plug 'https://github.com/altercation/vim-colors-solarized'

" COMPLETION

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'https://github.com/vim-scripts/paredit.vim.git'
Plug 'https://github.com/tpope/vim-fireplace.git'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'git://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/guns/vim-clojure-static'
Plug 'https://github.com/vim-scripts/BufOnly.vim.git'

call plug#end()

" SOLARIZED

set background=dark
set termguicolors
colorscheme solarized8

" AIRLINE

let g:airline_powerline_fonts = 1

" CTRL-P

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" COMPLETION

let g:deoplete#enable_at_startup = 1

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

let g:sexp_insert_after_wrap = 0

" LAYOUT

set incsearch
set hlsearch
set nu
set cursorline
set expandtab
set shiftwidth=2
set smarttab
set smartindent
filetype plugin indent on
hi CursorLine term=bold cterm=bold guibg=Grey20

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" MAPPING

let mapleader=","
nnoremap <leader>EE :%Eval<CR>
nnoremap <leader>ee :Eval<CR>
nnoremap <leader><Space> :BufOnly<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
