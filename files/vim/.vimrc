" Load other configuration files
source $HOME/.vim/plugins.vim
source $HOME/.vim/pluginsettings.vim
source $HOME/.vim/keybindings.vim

" General settings
colorscheme jellybeans
syntax on

" Don't worry about being compatible with vi
set nocompatible

" Highlight search results
set hlsearch

set colorcolumn=80

set wrap

set cursorline

set list
set listchars=tab:»\ ,trail:·

set fillchars=vert:│,fold:-,diff:-

set hidden

set wildmode=longest,list

" Remove comment character when joining lines
set formatoptions+=j
"
" Don't use two spaces when joining lines with a '.'
set nojoinspaces

" Don't show the mode as our custom statusline does this for us
set noshowmode

" Load our custom statusline
source $HOME/.vim/statusline.vim

" Move the swap and backup files to a single location
set backupdir=$HOME/.vim/backup_files//
set directory=$HOME/.vim/swap_files//

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

" Custom colours for general use
highlight User1 ctermfg=White ctermbg=234
highlight User2 ctermfg=234 ctermbg=Yellow
