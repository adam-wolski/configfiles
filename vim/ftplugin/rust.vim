nnoremap <leader>mcc :Neomake! clippy<CR>
nnoremap <leader>mcd :!cargo doc<CR>
nnoremap <leader>mct :!cargo test<CR>
nnoremap <leader>mcb :!cargo bench<CR>
nnoremap <leader>mcx :!cargo run<CR>
nnoremap <leader>mcu :!cargo update<CR>
nnoremap <leader>mf :RustFmt<CR>

setlocal tags=rusty-tags.vi

:set colorcolumn=100

let g:gdb_debugger = "rust-gdb"

let g:neomake_place_signs = 1
let g:neomake_open_list = 0


let g:neomake_error_sign = {'text': 'E>', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'WarningMsg'}
let g:neomake_message_sign = {'text': 'M>', 'texthl': 'WarningMsg'}
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'WarningMsg'}


if !exists("rust_autocmdloaded")
    let rust_autocmdloaded = 1
    autocmd BufWrite *.rs call jobstart("rusty-tags vi")
    autocmd BufWrite *.rs RustFmt
    autocmd BufWritePost *.rs Neomake! clippy
    autocmd VimLeave * let g:neomake_verbose = 0
endif
