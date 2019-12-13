function! s:NextSection(type, backwards, visual)

	" Running any ex command ':xxxx' will reset the visual selection, since we
	" are calling this function as an ex command we want to reselect the
	" selection here if we were in visual mode. 'gv' reselects the last
	" selection.
    if a:visual
        normal! gv
    endif

    if a:type == 1
		" Match first line of file or a nonblank line following a blank, and
		" place cursor at end of match
        let pattern = '\v(%^|\n\n^\S)'
		let flags = 'e'
    elseif a:type == 2
		" Match any nonblank line that contains an equals sign
        let pattern = '\v^\S.*\=.*:$'
		let flags = ''
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 1, 0)<cr>
noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 1, 0)<cr>

vnoremap <script> <buffer> <silent> ]] :<c-u>call <SID>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[ :<c-u>call <SID>NextSection(1, 1, 1)<cr>
vnoremap <script> <buffer> <silent> ][ :<c-u>call <SID>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [] :<c-u>call <SID>NextSection(2, 1, 1)<cr>
