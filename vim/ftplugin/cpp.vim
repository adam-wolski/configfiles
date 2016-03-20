if !exists("cpp_autocmdloaded")
    let cpp_autocmdloaded = 1

    au! BufEnter *.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = '.'
    au! BufEnter *.cc let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
    au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'

    " Override default setting which i have i setup in vimrc.
    au BufRead,BufNewFile *.h set filetype=cpp
    autocmd BufWrite *.rs :Dispatch! !ctags -R
endif
