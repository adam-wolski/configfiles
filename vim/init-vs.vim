" Plugins {{{
    " Init {{{
        call plug#begin()

        Plug 'adam-wolski/FindEverything'
        Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

        call plug#end()
    " }}}
    " Config {{{
        " Grepper {{{
            let g:grepper = {}
            let g:grepper.tools = {'rg'}
        " }}}
    " }}}
" }}}
" Shortcuts {{{
    " Global {{{
    
        " Set leader shortcut to spacebar
        let mapleader="\<Space>" 

        " Line Navigation, so it moves line down/up even with wrapping
        nnoremap j gj
        nnoremap k gk
        xnoremap j gj
        xnoremap k gk

        " tab navigation
        nnoremap <leader>h :Tabprevious<CR>
        nnoremap <leader>l :Tabnext<CR>
        nnoremap <leader>q :Tabclose<CR>

        " Paste from clipboard
        vnoremap <Leader>y "+y
        vnoremap <Leader>d "+d
        nnoremap <Leader>p "+p
        nnoremap <Leader>P "+P
        vnoremap <Leader>p "+p
        vnoremap <Leader>P "+P

        " Paste last yanked
        nnoremap P "0p
        vnoremap P "0p

        " Take cursor to end of pasted line
        vnoremap <silent> y y`]
        vnoremap <silent> p p`]
        nnoremap <silent> p p`]

        " hide matches on <leader>space
        nnoremap <leader>/ :nohlsearch<cr>

        " Add new line in insert mode
        inoremap <C-O> <C-o>o

        " Rebind macro playback
        nnoremap Q @

        " Handy shortcut for macro named q
        nnoremap QQ @q
    " }}}
    " File {{{

        nnoremap <leader>fs :Write<CR>
        nnoremap <leader>ff :Find<CR>
        nnoremap <leader>fS :call VSCodeCall("C_Cpp.SwitchHeaderSource")<CR>

    " }}}
" }}}
