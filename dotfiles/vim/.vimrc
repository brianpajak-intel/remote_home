" General Settings
set nocompatible          " Don't try to be vi compatible
filetype off              " Helps force plugins to load correctly

" Plugin Settings
" TODO: Load plugins here (pathogen or vundle)
filetype plugin indent on " For plugins to load correctly

" Syntax Highlighting
syntax on                 " Turn on syntax highlighting

" Leader Key
let mapleader = ","       " Pick a leader key

" Folding
set foldmethod=indent     " Enable folding based on indent
set foldlevel=99          " Start with all folds open

" Security
set modelines=0           " Disable modelines for security

" Display Settings
set number                " Show line numbers
set ruler                 " Show file stats
set visualbell            " Blink cursor on error instead of beeping

" Encoding
set encoding=utf-8        " Set encoding to UTF-8

" Whitespace and Indentation
set wrap                  " Enable line wrapping
set textwidth=119         " Set maximum text width
set formatoptions=tcqrn1  " Set format options
set tabstop=4             " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4          " Number of spaces to use for each step of (auto)indent
set softtabstop=4         " Number of spaces that a <Tab> counts for while performing editing operations
set expandtab             " Use spaces instead of tabs
set noshiftround          " Don't round indent to multiple of shiftwidth
set autoindent            " Copy indent from current line when starting a new line
set fileformat=unix       " Use Unix file format

" Cursor Motion
set scrolloff=3           " Keep 3 lines visible above/below the cursor
set backspace=indent,eol,start " Make backspace behave in a more intuitive way
set matchpairs+=<:>       " Use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Hidden Buffers
set hidden                " Allow hidden buffers

" Rendering
set ttyfast               " Faster rendering

" Status Bar
set laststatus=2          " Always show the status line

" Last Line
set showmode              " Show the current mode
set showcmd               " Show incomplete commands

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch              " Highlight search results
set incsearch             " Incremental search
set ignorecase            " Ignore case in search patterns
set smartcase             " Override ignorecase if search pattern contains uppercase letters
set showmatch             " Show matching brackets
map <leader><space> :let @/=''<cr> " Clear search

" Remap Help Key
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip        " Format paragraph

" Visualize Tabs and Newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL visualization

" Color Scheme
if has('gui_running')
  set guifont=Courier\ 20
endif

set t_Co=256
set t_ut=
colorscheme codedark
