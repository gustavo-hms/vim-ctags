command! CreateTags !ctags -f tags -R *

function! LoadTags()
	let file = findfile("tags", ".;")
	if (!empty(file))
		exe "set tags=" . file
		if &buflisted
			nnoremap <buffer> <CR> <C-]>
		endif
	endif
endfunction

au BufEnter /* call LoadTags()
