" Notes {{{

" # Dependencies
" * vim-plug plugin
" * ripgrep
" * fzf

" }}}
" Editing Settings {{{

    let mapleader="\<Space>"    " Set leader shortcut to spacebar
    set autoindent              " Keep indent of last line
    set smartindent             " Use smart indent if there is no indent file
    set scrolloff=5             " Keep x context lines above and below the cursor
    set expandtab               " Use spaces, not tabs, for autoindent/tab key.
    set softtabstop=4           " Number of spaces that a <Tab> counts for while editing
    set tabstop=4               " Number of spaces that a <Tab> counts for
    set shiftwidth=4            " Number of spaces that << >> move by.
    set backspace=indent,eol,start

" }}}
" Editor Settings {{{

    let g:author='Adam Wolski'
    let g:email='miniupuchaty@gmail.com'
    let g:github='https://github.com/adam-wolski'

    language en                                 " sets the language of the messages / ui (vim)
    set timeoutlen=1000 ttimeoutlen=0           " Faster insert to normal jump
    set nofoldenable                            " Disable folds on start, toggle with zi
    set undofile                                " Enable undo files
    set undolevels=10000                        " Bigger undo size
    set updatetime=100                          " Faster updates (helps with git gutter)
    set hidden                                  " Hide buffer instead of closing it
    set foldtext=MyFoldText()                   " Set folding text to custom fn. (*Functions section)
    set foldmethod=syntax                       " Set foldmethod to one based on syntax
    set exrc                                    " Load vimrc from current dir
    syntax on                                   " Enable syntax highlighting
    filetype on                                 " Detect filetypes
    filetype plugin indent on                   " Enable loading indent file for filetype
    set grepprg=rg\ --vimgrep                   " Program to use for grepping
    set wildmenu                                " Menu completion in command mode on <Tab>
    set wildmode=full                           " <Tab> cycles between all matching choices.
    set mouse=a                                 " Mouse, sometimes useful
    if has('unix')
        set undodir=%TEMP%                      " Directory for undo files
        set dir=%TEMP%                          " Directory for .swp files
    endif
    if has('win32')
        set undodir=/tmp/                       " Directory for undo files
        set dir=/tmp/                           " Directory for .swp files
    endif

    if has('unix')
            set dict+=/usr/share/dict/words
    endif

" }}}
" Searching Settings {{{

set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" }}}
" Visual Settings {{{

    set title                                   " Show title in console title bar
    set statusline=[%n]\                        " Buffer number
    set statusline+=%f%m%r%h%w\                 " Filename and modification
    set statusline+=%=\                         " Bring rest to right
    set statusline+=%Y\                         " Filetype"
    set statusline+=%l,%v\ %p%%\                " Line num col num and % of file
    set statusline+=%{FugitiveStatusline()}     " Git status
    set laststatus=2                            " Show statusline always
    set lazyredraw                              " Do not update screen while running macros
    set nonumber                                " Don't display line numbers
    set inccommand=split                        " Show incremental feedback for substitute
    set termguicolors                           " True color in terminal
    set langmenu=en_US.UTF-8                    " sets the language of the menu (graphical uis)
    set showcmd                                 " Show command in bottom right
    set background=dark                         " Dark background by default
    set showmatch                               " Show matching parentesis
    set cursorline                              " Have a line indicate the cursor location
    set wrap                                    " Wrap text
    set linebreak                               " But don't wrap text in the middle of a word
    set noerrorbells                            " Don't bell or blink
    set novisualbell
    set t_vb=

    if has('gui_running') || has('nvim')
        :set guioptions=
        :set guifont=Source\ Code\ Pro\ Ultra-Light\ 11
        colorscheme nugl
    endif

" }}}
" Shortcuts {{{

    " Global {{{

        " Quit window
        nnoremap <leader>q :q<CR>

        " CtrlP and similiar shortcut
        nnoremap <C-p> :Files<CR>

        " Line Navigation, so it moves line down/up even with wrapping
        nnoremap j gj
        nnoremap k gk
        xnoremap j gj
        xnoremap k gk

        " window navigation
        nnoremap <silent> <C-k> :wincmd k<CR>
        nnoremap <silent> <C-j> :wincmd j<CR>
        nnoremap <silent> <C-h> :wincmd h<CR>
        nnoremap <silent> <C-l> :wincmd l<CR>

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

        " Repalce word under cursor
        nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

    " }}}
    " File {{{

        nnoremap <leader>ff :Files
        nnoremap <leader>fs :w<CR>
        nnoremap <leader>f! :SudoWrite<CR>

    " }}}
    " Window {{{

        nnoremap <leader>wc :q<CR>
        nnoremap <leader>ws :split<CR>
        nnoremap <leader>wv :vsplit<CR>
        nnoremap <silent><leader>wk :wincmd k<CR>
        nnoremap <silent><leader>wj :wincmd j<CR>
        nnoremap <silent><leader>wh :wincmd h<CR>
        nnoremap <silent><leader>wl :wincmd l<CR>
        nnoremap <silent><leader>wK :wincmd K<CR>
        nnoremap <silent><leader>wJ :wincmd J<CR>
        nnoremap <silent><leader>wH :wincmd H<CR>
        nnoremap <silent><leader>wL :wincmd L<CR>
        nnoremap <silent><leader>w= :wincmd =<CR>
        nnoremap <silent><leader>wx :wincmd x<CR>
        nnoremap <silent><leader>wr :wincmd r<CR>
        nnoremap <silent><leader>wR :wincmd R<CR>

    " }}}
    " Buffer {{{

        nnoremap <leader>bp :b#<CR>
        nnoremap <leader>bb :Buffers<CR>

    " }}}
    " Toggle {{{

        nnoremap <silent><leader>tS :set spell!<CR>
        nnoremap <leader>tn :set number!<CR>
        nnoremap <leader>tr :set relativenumber!<CR>

    " }}}
    " Terminal {{{

        " Start/Exit
        nnoremap <leader>' :call TerminalToggle()<CR>
        tnoremap <C-e> <C-\><C-n>:call TerminalToggle()<CR>

        " window navigation
        tnoremap <C-h> <C-\><C-n><C-w>h
        tnoremap <C-j> <C-\><C-n><C-w>j
        tnoremap <C-k> <C-\><C-n><C-w>k
        tnoremap <C-l> <C-\><C-n><C-w>l

    " }}}
    " Util {{{

        " Remove whitespace
        nnoremap <leader>uws :%s/\s\+$//<cr>:let @/=''<CR>

    " }}}
    " Git {{{

        nnoremap <leader>gd :Gdiff<CR>
        nnoremap <leader>gc :Gcommit<CR>
        nnoremap <leader>gs :Gstatus<CR>
        nnoremap <leader>gw :Gwrite<CR>
        nnoremap <leader>ga :Git add -f %:p<CR><CR>
        nnoremap <leader>gk :!gitk --all<CR>

    " }}}
    " Vcs {{{

        nnoremap <leader>va :!vcs --add %:p<CR>
        nnoremap <leader>vt :!vcs --track %:p<CR>

    " }}}

" }}}
" Functions {{{

    function MyFoldText()
      let line = getline(v:foldstart)
      let sub = substitute(line, '"\|/\*\|\*/\|{{{\d\=\|}}}', '', 'g')
      return sub
    endfunction

    let g:terminal_buffer = -1
    function TerminalToggle()
        if bufnr("") == g:terminal_buffer
            close
        else
            if bufexists(g:terminal_buffer)
                exec "vsp | b".g:terminal_buffer
            else
                exec "vsp term://fish"
                let g:terminal_buffer = bufnr("")
            endif
            startinsert!
        endif
    endfunction

" }}}
" Filetype Specific Settings {{{

    " Vim {{{

        au filetype vim
          \ syn match fmrkr '"*{{{\|"*}}}'
          \ containedin=vimLineComment contained |
          \ hi def link fmrkr Ignore |
          \ set fdm=marker |
          \ set foldenable
        au FileType vim set sts=4 ts=4 sw=4

    " }}}
    " Houdini {{{
        au BufNewFile,BufRead *.vfl,*.vex set filetype=vfl
    " }}}

" }}}
