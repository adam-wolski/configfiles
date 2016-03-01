" --- Tab settings ---
set tabstop=4
set shiftwidth=4
set smarttab

" ---- indenting ----
set autoindent " auto indent
set smartindent " smart indent

" --- Column/Row Stuff ---
set cul                      " Highlight the current line
:set number                  " Show Line Numbers

set scrolloff=3              " Scroll when cursor gets within 3 characters of top/bottom edge

" Search for definition of skin under the cursor
nnoremap <leader>d viwy/Skin("<C-R>"")<CR>:nohlsearch<cr>

let g:current_workfolder = split(substitute(system('p4 info'), '.*Client root: \(.*\)\n.*', '\1', 'g'))[0]

" Map ctrlp to whole project. 
noremap <C-P> :execute 'CtrlP ' . current_workfolder<CR>
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 99
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
set wildignore+=*/assets_pc/*,src\*,tools/*,etc/*