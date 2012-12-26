function! LoadTags()
	let file = findfile("tags", ".;")
	if (!empty(file))
		exe "set tags=" . file
		if &buflisted
			nnoremap <buffer> <CR> <C-]>
		endif
	endif
endfunction
au BufEnter * call LoadTags()

function! UpdateTags()
	let file = findfile("tags", ".;")
	if (!empty(file))
		let oldpath = getcwd()
		let path = strpart(file, 0, match(file, "/tags$"))
		exe "cd " . path
		!ctags -f tags -R *
		exe "cd " . oldpath
	endif
endfunction
au VimEnter * call UpdateTags()
