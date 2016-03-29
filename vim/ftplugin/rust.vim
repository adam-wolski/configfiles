nnoremap <F5> :Neomake! cargo<CR>

nnoremap <leader>rf :RustFmt<CR>

setlocal tags=rusty-tags.vi

:set colorcolumn=100

let g:gdb_debugger = "rust-gdb"

if !exists("rust_autocmdloaded")
    let rust_autocmdloaded = 1
    autocmd BufWrite *.rs call jobstart("rusty-tags vi")
endif
