let g:gdb_debugger = "gdb"


function! AddPragmaOnce()
    execute "normal i#pragma once"
endfunction


if !exists("cpp_autocmdloaded")
    let cpp_autocmdloaded = 1

    au! BufEnter *.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = '.'
    au! BufEnter *.cc let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
    au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'

    " Override default setting which i have i setup in vimrc.
    au BufRead,BufNewFile *.h set filetype=cpp

    autocmd BufWrite *.cpp :Dispatch! !ctags -R --fields=+l --langmap=cpp:.cpp.h
    autocmd BufWrite *.h :Dispatch! !ctags -R --fields=+l --langmap=cpp:.cpp.h

    autocmd BufNewFile *.h call AddPragmaOnce()
endif
