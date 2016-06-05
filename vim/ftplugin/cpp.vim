let g:gdb_debugger = "gdb"


function! AddPragmaOnce()
    execute "normal i#pragma once"
endfunction


nnoremap <leader>mf :%pyf /usr/share/clang/clang-format.py<CR>
vnoremap <leader>mf :'<,'>pyf /usr/share/clang/clang-format.py<CR>


if !exists("cpp_autocmdloaded")
    let cpp_autocmdloaded = 1

    au! BufEnter *.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = '.'
    au! BufEnter *.cc let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
    au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'

    " Override default setting which i have i setup in vimrc.
    au BufRead,BufNewFile *.h set filetype=cpp

    autocmd BufWrite *.cpp call jobstart("ctags -R --fields=+l --langmap=c++:.cpp.h")
    autocmd BufWrite *.h call jobstart("ctags -R --fields=+l --langmap=c++:.cpp.h")

    autocmd BufNewFile *.h call AddPragmaOnce()
endif
