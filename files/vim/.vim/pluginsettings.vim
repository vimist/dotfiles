" NERDCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" Jellybeans settings
let g:jellybeans_overrides = {
\	'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\	'SpecialKey': { 'ctermbg': '233', '256ctermbg': '233' },
\	'IndentGuidesEven': { 'ctermbg': 'none', '256ctermbg': 'none' },
\	'IndentGuidesOdd': { 'ctermbg': '233', '256ctermbg': '233' }
\}

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1

" NERDTree settings
autocmd FileType nerdtree setlocal relativenumber

highlight link BufTabLineCurrent User2
highlight link BufTabLineInactive User1
highlight link BufTabLineHidden User1
