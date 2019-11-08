if has('python3')
	" python3 でも使用可能にする
	let g:gundo_prefer_python3 = 1
endif

nnoremap <F5> :GundoToggle<CR>
