set exrc " Executes additionally vimrc inside folder where vim was executed

"Spaces & tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent      " New lines inherit the indentation of previous lines.
set shiftwidth=4    " Indent 4 spaces

"UI Config
set nowrap " stops line breaking when line is too long
set guicursor=
set number              " show line numbers
set relativenumber
set splitbelow          " opens new buffer below current
set splitright          " opens new buffer below current
set ruler               " always show cursor position
set laststatus=2        " always shows the status bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
"set fillchars+=vert:\   " removes ugly styling of borders in vim
set termguicolors
set scrolloff=8         " set number of lines which
set signcolumn=yes      " Linting and git plugins use this
set updatetime=100      " Git gutter updating is for default val too slow

" Miscellaneous
set autoread
set noerrorbells
set hidden " keeps every buffer unsaved in background so you can navigate away without saving it
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"set backspace=indent,eol,start " Make bacskpace as usual works only vim
set clipboard=unnamed "On Os X accesses system clipboard

"Searching
set incsearch           " search as characters are entered
" set hlsearch            " highlight matches
set nohlsearch          " After hitting enter search stops highlighting

let mapleader=' '       " Mapping leader to space makes most convenient option

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'gruvbox-community/gruvbox'

call plug#end()

" Colorscheme settings
colorscheme gruvbox
" Make comments italic
highlight Comment cterm=italic gui=italic

" Removing whitespace when saving file
fun! TrimWhitespaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GROUP1
    autocmd!
    autocmd BufWritePre * :call TrimWhitespaces()
augroup END

lua << EOF
require'lspconfig'.pyright.setup{}
EOF
