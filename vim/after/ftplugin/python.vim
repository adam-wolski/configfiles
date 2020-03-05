set sts=4 ts=4 sw=4 colorcolumn=80   " Make Python follow PEP8
nnoremap <F8> :!pep8 %<CR>
nnoremap <F5> :!python %<CR>
setlocal formatprg=yapf

let g:neomake_place_signs = 1
let g:neomake_open_list = 0
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'WarningMsg'}
let g:neomake_message_sign = {'text': 'M>', 'texthl': 'WarningMsg'}
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'WarningMsg'}

if !exists("python_autocmdloaded")
    let python_autocmdloaded = 1

    au BufNewFile,BufRead SConstruct set filetype=python    " Recognize SConstruct file as python.
    
    if exists(":Neomake")
        autocmd BufWritePost *.py Neomake
        autocmd VimLeave * let g:neomake_verbose = 0
    endif
endif

