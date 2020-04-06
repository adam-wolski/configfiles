runtime init-core.vim

" Do not show incremental substitute changes, doesn't work in VS
set inccommand=
" Use tabs
set noexpandtab

call plug#begin()
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'miniukof/FindEverything'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
call plug#end()

let g:grepper = {}
let g:grepper.tools = ['rg']

nnoremap <leader>fs :Write<CR>
nnoremap <leader>ff :Find<CR>
nnoremap <leader>fS :call VSCodeCall("C_Cpp.SwitchHeaderSource")<CR>
nnoremap <leader>h :Tabprevious<CR>
nnoremap <leader>l :Tabnext<CR>
nnoremap <leader>q :Tabclose<CR>

nnoremap <leader>fa :FEA 
nnoremap <leader>fe :FEC 

nnoremap <C-O> :call VSCodeCall("workbench.action.navigateBack")<CR>
nnoremap <C-I> :call VSCodeCall("workbench.action.navigateForward")<CR>


nnoremap u :call VSCodeCall("undo")<CR>
nnoremap <C-r> :call VSCodeCall("redo")<CR>
