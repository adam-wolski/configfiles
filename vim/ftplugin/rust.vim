nnoremap <leader>mcc :Neomake! cargo<CR>
nnoremap <leader>mcd :!cargo doc<CR>
nnoremap <leader>mct :!cargo test<CR>
nnoremap <leader>mcb :!cargo bench<CR>
nnoremap <leader>mcx :!cargo run<CR>
nnoremap <leader>mcu :!cargo update<CR>
nnoremap <leader>mf :RustFmt<CR>

setlocal tags=rusty-tags.vi

:set colorcolumn=100

let g:gdb_debugger = "rust-gdb"

if !exists("rust_autocmdloaded")
    let rust_autocmdloaded = 1
    autocmd BufWrite *.rs call jobstart("rusty-tags vi")
endif
