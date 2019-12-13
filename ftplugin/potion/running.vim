if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>

function! PotionShowBytecode()
    " Get the bytecode. system runs a command and returns the output as a
	" string.
	let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " Open a new split and set it up with a buffer named __Potion_Bytecode__
	" we hope this isnt a file since if it was a file it would be loaded.
    vsplit __Potion_Bytecode__
	" Delete everything in the buffer
    normal! ggdG
	" set a special filetype just for clarity
    setlocal filetype=potionbytecode
	" let vim no that this is not a real file and therefore cannot be written.
    setlocal buftype=nofile

    " Insert the bytecode. call takes the line number to append after and a
	" list of strings to append.
	call append(0, split(bytecode, '\v\n'))

endfunction

nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
