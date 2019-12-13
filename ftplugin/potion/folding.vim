setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
		" Case insensitive match for non whitespace char
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

	" return an invalid line number if none found we could have chosen -1 but
	" -1 has a special meaning in folding for vim, so we use -2 to clearly
	"  seggregate this case.
    return -2
endfunction

function! IndentLevel(lnum)
	let divisor = &shiftwidth
	if divisor == 0 
		let divisor = &tabstop
	endif
    return indent(a:lnum) / divisor
endfunction

function! GetPotionFold(lnum)
	" We match blank lines
	" -1 means match the smaller of the level before or after this line
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent > this_indent
		" a string of the form '>x' opens a fold at level x
        return '>' . next_indent
    endif
	return this_indent
endfunction
