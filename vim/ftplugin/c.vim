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
:set colorcolumn=100         " Right Margin

set scrolloff=3              " Scroll when cursor gets within 3 characters of top/bottom edge

let g:gdb_debugger = "gdb"

" Generate Minunit Macros
"
" Gets MU_TEST(function_name) marcros and adds them to first existing
" MU_TEST_SUITE() macro.
"
let s:minunit_auto = 1
function! AutoGenMinunitSuiteMacros()
    if s:minunit_auto == 0
        return
    endif

    let startpos = getcurpos()

    let suitestart = search("MU_TEST_SUITE(", 'nw')
    if suitestart == 0
        return
    endif
    let contents = getbufline(bufname('%'), 1, "$")
    let testlines = []
    for line in contents
        if match(line, "MU_TEST(") != -1
            let fun = substitute(line, '.*MU_TEST(\(.*\)).*', '\1', 'g')
            call add(testlines, "MU_RUN_TEST(".fun.");")
        endif
    endfor
    if len(testlines) > 0
        " Delete already exiting macros
        let linenum = suitestart
        while match(getbufline(bufname('%'), linenum, linenum)[0], "}") == -1
            if match(getbufline(bufname('%'), linenum, linenum)[0], "MU_RUN_TEST(") != -1
                call setpos('.', [0, linenum, 0, 0])
                execute 'normal dd'
            else
                let linenum = linenum + 1
            endif
        endwhile

        " Add the new ones
        let linenum = suitestart
        for line in testlines
            call setpos('.', [0, linenum, 0, 0]) 
            execute "normal o".line
            let linenum = linenum + 1
        endfor
    endif
    " Return cursor to starting position
    call setpos('.', startpos)
endfunction

function! AddPragmaOnce()
    execute "normal i#pragma once"
endfunction

if !exists("c_autocmdloaded")
    let c_autocmdloaded = 1
    au BufWritePre *test*.c call AutoGenMinunitSuiteMacros()
    autocmd BufWrite *.c :Dispatch! !ctags -R --fields=+l --langmap=c:.c.h
    autocmd BufWrite *.h :Dispatch! !ctags -R --fields=+l --langmap=c:.c.h
    autocmd BufNewFile *.h call AddPragmaOnce()
endif
