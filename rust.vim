" Dispatch settings
let b:dispatch = 'cargo run'
nnoremap <F5> :Make build<CR>
nnoremap <C-F5> :Make! build<CR>
setlocal tags=rusty-tags.vi
autocmd BufWrite *.rs :Dispatch! !rusty-tags vi
:set colorcolumn=90         " Right Margin
