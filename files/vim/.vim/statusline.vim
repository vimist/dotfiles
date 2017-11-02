function! GetMode()
	let l:mode_map = {
\		'i':  'INSERT',
\		'n':  'NORMAL',
\		'v':  'VISUAL',
\		'': 'VISUAL-BLOCK',
\		'V':  'VISUAL-LINE',
\		'R':  'REPLACE',
\		'Rv': 'VIRTUAL-REPLACE',
\		'r':  'HIT-ENTER',
\		'c':  'COMMAND',
\		's':  'SELECT',
\		'': 'SELECT-BLOCK',
\		'S':  'SELECT-LINE',
\		'no': 'OPERATOR PENDING',
\		'cv': 'VIM EX',
\		'ce': 'EX',
\		'rm': 'MORE',
\		'r?': 'CONFIRM',
\		'!':  'SHELL'
\	}

	return l:mode_map[mode()]
endfunction

set statusline=%1*
set statusline+=%2*\ \ %{GetMode()}\ \  " Current mode
set statusline+=│\ \ %(%n\ :\ %f%)\ \ %1* " Buffer number and filename
set statusline+=\ \ \ \ \ \ \ \ %= " Separator between left and right (always have at least 8 spaces)
set statusline+=%2*\ \ C:%c\ L:%l/%L\ \ │\ \ %<%{getcwd()}\ \  " Cursor position and CWD
