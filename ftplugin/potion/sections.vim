function! s:NextSection(type, backwards)
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

noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 0)<cr>

noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 1)<cr>

noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 0)<cr>

noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 1)<cr>
