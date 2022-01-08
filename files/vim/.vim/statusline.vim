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
\		'!':  'SHELL',
\		't':  'TERM'
\	}

	return l:mode_map[mode()]
endfunction

function! StatusLine()
	let statusline  = "%2*  " . GetMode()
	let statusline .= " " . (&paste ? "(paste) " : "") . " "
	let statusline .= "%1*  %(%n\ :\ %f%)  " " Buffer number and filename
	let statusline .= "       %= " " Separator between left and right (always have at least 8 spaces)
	let statusline .= "%2*  C:%c %P  │  %b (0x%02B)  " " Cursor position and byte value

	return statusline
endfunction


set statusline=%!StatusLine()
