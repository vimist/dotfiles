" Load other configuration files
source $HOME/.vim/vundle.vim
source $HOME/.vim/pluginsettings.vim
source $HOME/.vim/keybindings.vim

" General settings
colorscheme jellybeans
syntax on

" Don't worry about being compatible with vi
set nocompatible

" Highlight search results
set hlsearch

set wrap

set cursorline

set list
set listchars=tab:»\ ,trail:·

set hidden

" Remove comment character when joining lines
set formatoptions+=j

" Don't show the mode as our custom statusline does this for us
set noshowmode

" Load our custom statusline
source $HOME/.vim/statusline.vim

" Always show the status line
set laststatus=2

set scrolloff=5

set matchpairs+=<:>

" Set line numbers to be relative to the current position
set number
set relativenumber

" Don't redraw the screen during macro execution
set lazyredraw

" Search case insensitively, unless search string contains
" an upper case character
set ignorecase
set smartcase
set incsearch

" Set the order of locations to search for autocompletion
set complete=.,w,b,t,kspell

" Automatically mark folds, but don't actually close them
set foldmethod=indent
set foldlevel=99

" Indent settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" Set low priority file suffixes for auto completion
set suffixes=.swp

