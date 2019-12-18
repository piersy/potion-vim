function! potion#running#PotionCompileAndRunFile()
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
	let name = "__Potion_Bytecode__"
	" Get the bytecode. system runs a command and returns the output as a
	" string.
	let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

	" If the buffere 
	let window = bufwinnr(name)	
	if window != -1
		call win_gotoid(win_getid(window))
	elseif bufexists(name)
		execute "buffer " . name
	else
		" Open a new split and set it up with a buffer named __Potion_Bytecode__
		" we hope this isnt a file since if it was a file it would be loaded.
		execute "vsplit " . name
		" set a special filetype just for clarity
		setlocal filetype=potionbytecode
		" let vim no that this is not a real file and therefore cannot be written.
		setlocal buftype=nofile
	endif

	" Delete everything in the buffer
	normal! ggdG

	" Insert the bytecode. call takes the line number to append after and a
	" list of strings to append.
	call append(0, split(bytecode, '\v\n'))

endfunction

