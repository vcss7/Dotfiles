" General
set number relativenumber       	" Show relative line numbers
set linebreak				" Break lines at word (requires Wrap lines)
set showbreak=+++ 			" Wrap-broken line prefix
set textwidth=100			" Line wrap (number of cols)
set showmatch				" Highlight matching brace
set visualbell				" Use visual bell (no beeping)
 
set hlsearch				" Highlight all search results
set smartcase				" Enable smart-case search
set ignorecase				" Always case-insensitive
set incsearch				" Searches for strings incrementally
 
set autoindent				" Auto-indent new lines
set expandtab				" Use spaces instead of tabs
set shiftwidth=2			" Number of auto-indent spaces
set smartindent				" Enable smart-indent
set smarttab				" Enable smart-tabs
set softtabstop=2			" Number of spaces per Tab
 
" Advanced
syntax on                               " Syntax Highlighting

set nocompatible                        " Disable compatible VI mode

set ruler				" Show row and column ruler information
 
set undolevels=1000			" Number of undo levels
set backspace=indent,eol,start		" Backspace behaviour

let g:netrw_dirhistmax=0                " Disable netrwlist history/bookmarks

" ========================= Plugins =========================
" Lightline
set laststatus=2                        " Enable status line
set noshowmode                          " Disable showmode

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }                                   " Nord color scheme (status line)

" Vim-hardtime
let g:hardtime_default_on=1             " Hardtime default to on
