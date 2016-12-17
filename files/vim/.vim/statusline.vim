function! GetMode()
	let l:mode_map = {
\		'i':  'INSERT',
\		'n':  'NORMAL',
\		'v':  'VISUAL',
\		'': 'VISUAL-BLOCK',
\		'V':  'VISUAL-LINE',
\		'R':  'REPLACE'
\	}

	return l:mode_map[mode()]
endfunction

set statusline=%1*
set statusline+=%3*\ \ %{GetMode()}\ \  " Current mode
set statusline+=│\ \ %(%n\ :\ %f%)\ \ %1* " Buffer number and filename
set statusline+=%= " Separator between left and right
set statusline+=%3*\ \ C:%c\ L:%l/%L\ \ │\ \ %{getcwd()}\ \  " Cursor position and CWD

" Colours for statusline
hi User1 ctermfg=White ctermbg=234
hi User2 ctermfg=234 ctermbg=Yellow
hi User3 ctermfg=234 ctermbg=Yellow

