call plug#begin()
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
call plug#end()

nnoremap <C-O> :call VSCodeCall("workbench.action.navigateBack")<CR>
nnoremap <C-I> :call VSCodeCall("workbench.action.navigateForward")<CR>

nmap u :call VSCodeCall("undo")<CR>
nmap <C-r> :call VSCodeCall("redo")<CR>

nmap <C-J> :call VSCodeCall('cursorDown')<CR>
nmap <C-K> :call VSCodeCall('cursorUp')<CR>

nmap <C-j> 10j
nmap <C-k> 10k
