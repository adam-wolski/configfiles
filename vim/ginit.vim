nmap <silent> <leader>F :call GuiWindowFullScreen(!g:GuiWindowFullScreen)<CR>

nmap <silent> <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
nmap <silent> <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>

function! AdjustFontSize(amount)
	" Split font name from FontName:hSize format and set increased size
	let font_split = split(g:GuiFont, ':')
	let font = font_split[0]
	let font_size = font_split[1][1:] + a:amount
	:execute "GuiFont! " . font . ":h" . font_size
endfunction

