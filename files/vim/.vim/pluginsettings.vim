" NERDCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" Jellybeans settings
let g:jellybeans_overrides = {
\	'background': { 'ctermbg': '232', '256ctermbg': '232' },
\	'SpecialKey': { 'ctermbg': '233', '256ctermbg': '233' },
\	'IndentGuidesEven': { 'ctermbg': '232', '256ctermbg': '232' },
\	'IndentGuidesOdd': { 'ctermbg': '233', '256ctermbg': '233' }
\}
let g:jellybeans_use_term_italics = 1

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1

highlight link BufTabLineCurrent User2
highlight link BufTabLineInactive User1
highlight link BufTabLineHidden User1

" NERDTree settings
autocmd FileType nerdtree setlocal relativenumber
