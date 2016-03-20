" Dispatch settings
let b:dispatch = 'cargo run'
nnoremap <F5> :Make build<CR>
nnoremap <C-F5> :Make! build<CR>
nnoremap <leader>rf :RustFmt<CR>
setlocal tags=rusty-tags.vi
:set colorcolumn=100         " Right Margin

if !exists("rust_autocmdloaded")
    let rust_autocmdloaded = 1
    autocmd BufWrite *.rs :Dispatch! !rusty-tags vi
endif
