" --- Tab settings ---
set tabstop=8
set shiftwidth=8
set smarttab

" ---- indenting ----
set autoindent " auto indent
set smartindent " smart indent
set ci " C/C++ indents
set cin " 

" --- Column/Row Stuff ---
set cul                      " Highlight the current line
:set number                  " Show Line Numbers
:set lines=40 columns=120    " Window Size
:set colorcolumn=120         " Right Margin

set scrolloff=3              " Scroll when cursor gets within 3 characters of top/bottom edge

nnoremap <F5> :!clang -g % -o %:r<CR><CR>
nnoremap <F6> :!./%:r
